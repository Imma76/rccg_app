import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/providers/all_providers.dart';
import 'package:rccg_app/routes.dart';
import 'package:rccg_app/themes/app_theme.dart';
import 'package:rccg_app/views/base/base.dart';
import 'package:rccg_app/views/onboarding/welcome_page.dart';
import 'package:rccg_app/widgets/loader.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'controllers/central_controller.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform);


  runApp(const MyApp());
  //FlutterNativeSplash.remove();
}

final botToastBuilder = BotToastInit();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(401,812),
        builder: (context,widget) {
          return MaterialApp(
            navigatorKey: centralState.navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Rccg',
            routes: routes,
            navigatorObservers: [BotToastNavigatorObserver()],
            builder: BotToastInit(),
           // initialRoute: Welcome.route,
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            home: LoadApp(),
          );
        }
      ),
    );
  }
}


class LoadApp extends ConsumerStatefulWidget {
  const LoadApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoadAppState();
}

class _LoadAppState extends ConsumerState<LoadApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(centralProvider).initializeApp();
    ref.read(authProvider);


  }
  @override
  Widget build(BuildContext context) {
    final centralController = ref.watch(centralProvider);
    final authController =ref.watch(authProvider);
    if(!centralController
        .isConnectionStable){
      return NoInternetConnection();
    }
    if(centralController.isAppLoading){

      return Scaffold(body:Indicator());
    }
    if(centralController.isUserPresent && centralController.user!.emailVerified){

      return Base();
    }


    return Welcome();

  }
}


class NoInternetConnection extends ConsumerWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
      final centralController = ref.watch(centralProvider);
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/no_internet.png'),
                Text(
                 'No internet connection',
                  textAlign: TextAlign.center,
                ),
               Gap(20.h),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  centralController.checkInternetConnection();
                },
                child: Text(
                  'Retry',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600, fontSize: 16.sp),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: LightAppTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    minimumSize: Size(329.w, 52.h)),
              ),
            )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
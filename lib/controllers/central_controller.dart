
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:rccg_app/controllers/user_controller.dart';

import '../../main.dart';
import '../views/authentication/auth.dart';


class CentralState extends ChangeNotifier{
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  User? user;

  bool isUserPresent = false;
  bool isAppLoading=false;
  bool isPhoneVerified=false;
  bool? isFirstTime = true;
  bool isConnectionStable = true;
  Connectivity connectivity = Connectivity();
  void startLoading(){

    isAppLoading=true;
    notifyListeners();
  }

  void stopLoading(){

    isAppLoading = false;
    notifyListeners();
  }

  // void userData(UserModel newUserModel){
  //   userModel= newUserModel;
  //   notifyListeners();
  // }

  //
  // void setFirstTime()async{
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool("isFirstTime", false);
  // }
  //
  // getIsUserFirstTime()async{
  //   final prefs = await SharedPreferences.getInstance();
  //
  //   isFirstTime = prefs.getBool("isFirstTime")?? true;
  //   notifyListeners();
  // }
  monitorInternetConnection() async {
    //checking for the initial status
    await checkInternetConnection();
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      isConnectionStable = (result != ConnectivityResult.none);
      print(result);
      notifyListeners();
    });
  }

  //re checks the current status of internet connection
  checkInternetConnection() async {
    final ConnectivityResult status = await connectivity.checkConnectivity();
    isConnectionStable = (status != ConnectivityResult.none);
    notifyListeners();

  }
  bool here = false;
  void initializeApp()async{
 //   await getIsUserFirstTime();
     monitorInternetConnection();
    isAppLoading = true;
    FirebaseAuth.instance.authStateChanges().listen((User? firebaseUser) async {

      if (firebaseUser != null) {
        isAppLoading = true;
        user = firebaseUser;
        notifyListeners();
        print(user?.emailVerified);
        isUserPresent = (user != null);
        print(isUserPresent);
        notifyListeners();
        await userController.init();

        isAppLoading = false;
        notifyListeners();

      } else{
        debugPrint('user is null prod');
        isUserPresent = false;
        user = null;
        isAppLoading = false;
        await Future.delayed(Duration(seconds: 3),(){
          print('hey there');
          here = true;
          notifyListeners();
          print(here);
        });
        notifyListeners();
        //     Navigator.pushNamedAndRemoveUntil(navigatorKey!.currentContext!, LoginScreen.id, (route) => false);


      }

      // await Future.delayed(Duration(seconds: 3),(){
      //
      //   isUserPresent =  false;
      //   notifyListeners();
      //   print('iiiiii');
      //
      // });

    });
  }
  void logOut()async{
    await  FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(navigatorKey!.currentContext!, Authentication.route, (route) => false);

  }
}

CentralState centralState =new CentralState();
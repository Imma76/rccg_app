import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/authentication/verify_email.dart';
import 'package:rccg_app/widgets/loader.dart';

import '../../providers/all_providers.dart';
import '../../themes/app_theme.dart';
import '../../widgets/text_fields.dart';

class Authentication extends ConsumerStatefulWidget {
  static const route = 'auth';
  const Authentication({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AuthenticationState();
}

class _AuthenticationState extends ConsumerState<Authentication> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authController = ref.read(authProvider);
  }
PageController controller = PageController();
int index = 0;
  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authProvider);

    return Scaffold(
        backgroundColor: LightAppTheme.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(75.h),
            Center(
                child: Image.asset('assets/app_logo.png',
                    height: 56.h, width: 56.w)),
            Gap(20.h),
            Center(
                child: Text(
              'Create your account',
              style: GoogleFonts.inter(
                  fontSize: 20.sp, fontWeight: FontWeight.w600),
            )),
            Gap(16.h),
            Center(
              child: Container(
                width: 330.w,
                height: 44.9.h,
                decoration: BoxDecoration(
                    color: LightAppTheme.lightBlue,
                    borderRadius: BorderRadius.circular(22)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                 index == 0
                          ? SizedBox(
                              height: 35.34.h,
                              width: 150.w,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 13),
                                        blurRadius: 25,
                                        color: Color.fromARGB(14, 14, 14, 0),
                                      ),
                                    ],
                                  color: LightAppTheme.white,
                                    borderRadius:
                                          BorderRadius.circular(17)
                                ),
                                // shape: RoundedRectangleBorder(
                                //     borderRadius:
                                //         BorderRadius.circular(17)),
                                child: Center(
                                    child: Text(
                                  'Register',
                                  style: GoogleFonts.inter(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: LightAppTheme.primary2),
                                )),
                              ))
                          : GestureDetector(
                              onTap: () {

                                controller.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.linear);

                              },
                              child: SizedBox(
                                  height: 40.34.h,
                                  width: 150.w,
                                  child: Center(
                                      child: Text(
                                    'Register',
                                    style: GoogleFonts.inter(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: LightAppTheme.grey),
                                  )))),
                      index == 1
                          ? SizedBox(
                              height: 35.34.h,
                              width: 150.w,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 13),
                                        blurRadius: 25,
                                        color: Color.fromARGB(14, 14, 14, 0),
                                      ),
                                    ],
                                    color: LightAppTheme.white,
                                    borderRadius:
                                    BorderRadius.circular(17)
                                ),
                                child: Center(
                                    child: Text(
                                  'Login',
                                  style: GoogleFonts.inter(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: LightAppTheme.primary2),
                                )),
                              ))
                          : GestureDetector(
                              onTap: () {
                                print('hherr');
                                controller.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.linear);
                              },
                              child: SizedBox(
                                  height: 44.34.h,
                                  width: 150.w,
                                  child: Center(
                                      child: Text(
                                    'Login',
                                    style: GoogleFonts.inter(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: LightAppTheme.grey),
                                  ))))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value){
                  print(value);
                  setState(() {
                    index = value;
                  });
                  if(value == 2){
                    print('here');
                  }
                },
                children: [
                  RegisterFields() , LoginFields()
                ],
              ),
            ),
            //authController.currentIndex == 0 ?
          ],
        ));
  }
}

class RegisterFields extends ConsumerWidget {
  const RegisterFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authProvider);
    final themeController = ref.watch(appThemeProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(35.h),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: Text(
              'First Name',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: LightAppTheme.primary2),
            ),
          ),
          Gap(8.h),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: SizedBox(
              width: 330.36.w,
              height: 50.h,
              child: Center(
                  child: AppTextField(hintText: 'First Name',controller: authController.firstNameController,)
              ),
            ),
          ),
          Gap(24.h),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: Text(
              'Last Name',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: LightAppTheme.primary2),
            ),
          ),
          Gap(8.h),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: SizedBox(
              width: 330.36.w,
              height: 50.h,
              child: Center(
                child: AppTextField(hintText: 'Last name',controller: authController
                    .lastNameController,),
              ),
            ),
          ),

          Gap(24.h),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: Text(
              'Email address',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: LightAppTheme.primary2),
            ),
          ),
          Gap(8.h),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: SizedBox(
              width: 330.36.w,
              height: 50.h,
              child: Center(
                child: AppTextField(hintText: 'Email address',controller: authController
                  .emailController,),
              ),
            ),
          ),
          Gap(
            24.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: Text(
              'Password',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: LightAppTheme.primary2),
            ),
          ),
          Gap(8.h),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: SizedBox(
              width: 330.36.w,
              height: 50.h,
              child: Center(
                child:AppTextField(
                  obscure: authController.showPassword?false:true,
                  suffixIcon: IconButton(icon: Icon(!authController.showPassword
                      ?Icons.visibility
                      :Icons.visibility_off,color: Colors.grey[400],),onPressed: (){
                    authController
                    .changeShowPassword();
                  },),
                  hintText: 'Password',controller: authController.passwordController,)
              ),
            ),
          ),



          Gap(43.h),
          Center(
            child: authController.load?Indicator(color: LightAppTheme.primaryColor
              ,): ElevatedButton(
              onPressed: ()async {
                // Navigator.pushNamed(context, VerifyEmail.route);
                await authController.signUp();
              },
              child: Text('Create Account'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: LightAppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  minimumSize: Size(329.w, 52.h)),
            ),
          ),
          Gap(18),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 105.w,
                  color: LightAppTheme.midGrey,
                  height: 2,
                ),
                Gap(7),
                Text('Or continue with',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: LightAppTheme.grey)),
                Gap(7),
                Container(
                  width: 105.w,
                  color: LightAppTheme.midGrey,
                  height: 2,
                ),
              ],
            ),
          ),
          Gap(10.h),
          Center(
            child:authController.googleLoad?Indicator(): ElevatedButton(
              onPressed: ()async {
                authController.googleLogIn();
              },
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/google.png',
                      height: 16.w,
                      width: 16.w,
                    ),
                    Gap(14.w),
                    Text(
                      'Sign up with Google',
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: LightAppTheme.primary2,
                          fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: LightAppTheme.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(44, 30, 95, 0)),
                    borderRadius: BorderRadius.circular(40)),
                minimumSize: Size(329.w, 52.h),
                maximumSize: Size(329.w, 52.h),
              ),
            ),
          ),
          Gap(30.h),
          GestureDetector(
            onTap: (){
              authController.changeIndex(1);
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Have an account? ',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: LightAppTheme.grey,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    'Sign In',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: LightAppTheme.primaryColor,
                        fontStyle: FontStyle.normal),
                  ),
                ],
              ),
            ),
          ),
          Gap(20.h),
        ],
      ),
    );
  }
}


class LoginFields extends ConsumerWidget {
  const LoginFields({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authProvider);
    final themeController = ref.watch(appThemeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(35.h),
        Padding(
          padding: const EdgeInsets.only(left: 31.0),
          child: Text(
            'Email address',
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: LightAppTheme.primary2),
          ),
        ),
        Gap(8.h),
        Padding(
          padding: const EdgeInsets.only(left: 31.0),
          child: SizedBox(
            width: 330.36.w,
            height: 50.h,
            child: Center(
              child: AppTextField(hintText: 'Email Address',controller: authController.emailController,)
            ),
          ),
        ),
        Gap(
          24.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 31.0),
          child: Text(
            'Password',
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: LightAppTheme.primary2),
          ),
        ),
        Gap(8.h),
        Padding(
          padding: const EdgeInsets.only(left: 31.0),
          child: SizedBox(
            width: 330.36.w,
            height: 50.h,
            child: Center(
              child: AppTextField(
                suffixIcon: IconButton(icon: Icon(!authController.showPassword
                    ?Icons.visibility
                    :Icons.visibility_off,color: Colors.grey[400],),onPressed: (){
                  authController
                      .changeShowPassword();
                },),
                hintText: 'Password',controller: authController.passwordController,)
            ),
          ),
        ),
        Gap(18.3.h),
        Row(
          children: [
            Spacer(),
            Text('Forgot Password?',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: LightAppTheme.primaryColor)),
            Gap(33.w)
          ],
        ),
        Gap(17.h),
        Center(
          child:authController.load?Indicator(): ElevatedButton(
            onPressed: ()async {
              authController.signIn();
            },
            child: Text(
              'Login',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: LightAppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                minimumSize: Size(329.w, 52.h),),
          ),
        ),
        Gap(18.h),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 105.w,
                color: LightAppTheme.midGrey,
                height: 2,
              ),
              Gap(7),
              Text('Or continue with',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: LightAppTheme.grey)),
              Gap(7),
              Container(
                width: 105.w,
                color: LightAppTheme.midGrey,
                height: 2,
              ),
            ],
          ),
        ),
        Gap(18.h),
        Center(
          child: ElevatedButton(
            onPressed: () async{
              await authController.googleLogIn();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: LightAppTheme.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromARGB(44, 30, 95, 0)),
                  borderRadius: BorderRadius.circular(40)),
              minimumSize: Size(329.w, 52.h),
              maximumSize: Size(329.w, 52.h),
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/google.png',
                    height: 16.w,
                    width: 16.w,
                  ),
                  Gap(14.w),
                  Text(
                    'Sign in with Google',
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: LightAppTheme.primary2,
                        fontStyle: FontStyle.normal),
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(45.h),
        GestureDetector(
          onTap: (){

              authController.changeIndex(0);

          },
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Dont\'t have an account? ',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: LightAppTheme.grey,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  'Sign up',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: LightAppTheme.primaryColor,
                      fontStyle: FontStyle.normal),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/authentication/verify_email.dart';

import '../../themes/app_theme.dart';

class Authentication extends ConsumerStatefulWidget {
  static const route = 'auth';
  const Authentication({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AuthenticationState();
}

class _AuthenticationState extends ConsumerState<Authentication> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppTheme.white,
          body: SingleChildScrollView(
            child: Column(
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
                    width: 320.w,
                    height: 44.9.h,
                    decoration: BoxDecoration(
                        color: AppTheme.lightBlue,
                        borderRadius: BorderRadius.circular(22)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          currentIndex == 0
                              ? SizedBox(
                                  height: 40.34.h,
                                  width: 150.w,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(17)),
                                    child: Center(
                                        child: Text(
                                      'Register',
                                      style: GoogleFonts.inter(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.primary2),
                                    )),
                                  ))
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentIndex = 0;
                                    });
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
                                            color: AppTheme.grey),
                                      )))),
                          currentIndex == 1
                              ? SizedBox(
                                  height: 40.34.h,
                                  width: 150.w,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(17)),
                                    child: Center(
                                        child: Text(
                                      'Login',
                                      style: GoogleFonts.inter(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.primary2),
                                    )),
                                  ))
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentIndex = 1;
                                    });
                                  },
                                  child: SizedBox(
                                      height: 40.34.h,
                                      width: 150.w,
                                      child: Center(
                                          child: Text(
                                        'Login',
                                        style: GoogleFonts.inter(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.grey),
                                      ))))
                        ],
                      ),
                    ),
                  ),
                ),
                currentIndex == 0 ? RegisterFields() : LoginFields()
              ],
            ),
          )),
    );
  }
}

class RegisterFields extends ConsumerWidget {
  const RegisterFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
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
                  color: AppTheme.primary2),
            ),
          ),
          Gap(8.h),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: SizedBox(
              width: 330.36.w,
              height: 50.h,
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: 'Email Address',
                      hintStyle: GoogleFonts.inter(
                          color: AppTheme.white4,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.white2),
                          borderRadius: BorderRadius.circular(28)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.white2),
                          borderRadius: BorderRadius.circular(28)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.white2),
                          borderRadius: BorderRadius.circular(28))),
                ),
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
                  color: AppTheme.primary2),
            ),
          ),
          Gap(8.h),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: SizedBox(
              width: 330.36.w,
              height: 50.h,
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: 'Password',
                      hintStyle: GoogleFonts.inter(
                          color: AppTheme.white4,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.white2),
                          borderRadius: BorderRadius.circular(28)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.white2),
                          borderRadius: BorderRadius.circular(28)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.white2),
                          borderRadius: BorderRadius.circular(28))),
                ),
              ),
            ),
          ),
          Gap(
            24.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: Text(
              'Confirm Password',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.primary2),
            ),
          ),
          Gap(8.h),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: SizedBox(
              width: 330.36.w,
              height: 50.h,
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: 'Confirm Password',
                      hintStyle: GoogleFonts.inter(
                          color: AppTheme.white4,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.white2),
                          borderRadius: BorderRadius.circular(28)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.white2),
                          borderRadius: BorderRadius.circular(28)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.white2),
                          borderRadius: BorderRadius.circular(28))),
                ),
              ),
            ),
          ),
          Gap(43.h),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, VerifyEmail.route);
              },
              child: Text('Create Account'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
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
                  color: AppTheme.midGrey,
                  height: 2,
                ),
                Gap(7),
                Text('Or continue with',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppTheme.grey)),
                Gap(7),
                Container(
                  width: 105.w,
                  color: AppTheme.midGrey,
                  height: 2,
                ),
              ],
            ),
          ),
          Gap(10.h),
          Center(
            child: ElevatedButton(
              onPressed: () {},
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
                          color: AppTheme.primary2,
                          fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppTheme.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(44, 30, 95, 0)),
                    borderRadius: BorderRadius.circular(40)),
                minimumSize: Size(329.w, 52.h),
                maximumSize: Size(329.w, 52.h),
              ),
            ),
          ),
          Gap(30.h),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Dont\'t have an account? ',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppTheme.grey,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  'Sign In',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppTheme.primaryColor,
                      fontStyle: FontStyle.normal),
                ),
              ],
            ),
          )
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
                color: AppTheme.primary2),
          ),
        ),
        Gap(8.h),
        Padding(
          padding: const EdgeInsets.only(left: 31.0),
          child: SizedBox(
            width: 330.36.w,
            height: 50.h,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: 'Email Address',
                    hintStyle: GoogleFonts.inter(
                        color: AppTheme.white4,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.white2),
                        borderRadius: BorderRadius.circular(28)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.white2),
                        borderRadius: BorderRadius.circular(28)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.white2),
                        borderRadius: BorderRadius.circular(28))),
              ),
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
                color: AppTheme.primary2),
          ),
        ),
        Gap(8.h),
        Padding(
          padding: const EdgeInsets.only(left: 31.0),
          child: SizedBox(
            width: 330.36.w,
            height: 50.h,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: 'Password',
                    hintStyle: GoogleFonts.inter(
                        color: AppTheme.white4,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.white2),
                        borderRadius: BorderRadius.circular(28)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.white2),
                        borderRadius: BorderRadius.circular(28)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.white2),
                        borderRadius: BorderRadius.circular(28))),
              ),
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
                    color: AppTheme.primaryColor)),
            Gap(33.w)
          ],
        ),
        Gap(17.h),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Login',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                minimumSize: Size(329.w, 52.h)),
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
                color: AppTheme.midGrey,
                height: 2,
              ),
              Gap(7),
              Text('Or continue with',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: AppTheme.grey)),
              Gap(7),
              Container(
                width: 105.w,
                color: AppTheme.midGrey,
                height: 2,
              ),
            ],
          ),
        ),
        Gap(18.h),
        Center(
          child: ElevatedButton(
            onPressed: () {},
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
                        color: AppTheme.primary2,
                        fontStyle: FontStyle.normal),
                  ),
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppTheme.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromARGB(44, 30, 95, 0)),
                  borderRadius: BorderRadius.circular(40)),
              minimumSize: Size(329.w, 52.h),
              maximumSize: Size(329.w, 52.h),
            ),
          ),
        ),
        Gap(45.h),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Dont\'t have an account? ',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppTheme.grey,
                    fontStyle: FontStyle.normal),
              ),
              Text(
                'Sign up',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppTheme.primaryColor,
                    fontStyle: FontStyle.normal),
              ),
            ],
          ),
        )
      ],
    );
  }
}

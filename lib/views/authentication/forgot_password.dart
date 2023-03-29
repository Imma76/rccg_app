import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../../widgets/text_fields.dart';

class ForgotPassword extends ConsumerWidget {
  static const route = 'forgot_password';
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppTheme.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.asset('assets/app_logo.png',
                  height: 56.h, width: 56.w)),
          Gap(20.h),
          Center(
            child: Text(
              'Forgot Password',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primary2),
            ),
          ),
          Gap(12.h),
          Center(
            child: Text(
              'Enter your email address to reset your password',textAlign: TextAlign.center, style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppTheme.grey3) ,),
          ),
          Gap(37.h),
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
                child:AppTextField(hintText: 'Email Address',)
              ),
            ),
          ),
          Gap(97.h),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ForgotPassword.route);
              },
              child: Text(
                'Submit',
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

        ],
      ),
    );
  }
}

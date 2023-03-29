import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/authentication/password_changed_done.dart';

import '../../themes/app_theme.dart';

class VerificationComplete extends StatelessWidget {
  static const route = 'verify_done';
  const VerificationComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Gap(75.h),
            Center(child: Image.asset('assets/app_logo.png',height:56.h,width:56.w)),
            Gap(112.h),
            Image.asset('assets/phone.png',width: 218.w,height: 136.h,),
            Gap(48.h),
            Text(
              'Congratulations',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600, fontSize: 20.sp,color: AppTheme.black2),
            ),
            Gap(14.h),
            Text(
              'Voila! You have successfuly created \n your account.',textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400, fontSize: 16.sp,color: AppTheme.black2),
            ),
            Gap(69.h),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, PasswordChangeDone.route);
                },
                child: Text(
                  'Get Started',
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
      ),
    );
  }
}

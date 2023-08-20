

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/app_theme.dart';

showSuccessDialogWidget(context,{String? title='Thank you', String?body='Review submitted successfully!', String? buttonText='Done'}){
  showDialog(context: context, builder: (context)=>Dialog(child:Container(
    height:352.h,
    width: 324.w,
    child: Column(
      children: [
        Gap(20.h),
        Image.asset('assets/green_check.png', height:150.h, width: 150.w,),
        Gap(10.h),
        Text('$title',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              color: LightAppTheme.neutralDark,
              fontSize: 24.sp,)),
        Gap(10.h),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 276.w,
            child: Text('$body',textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  color: LightAppTheme.grey11,
                  fontSize: 14.sp,)),
          ),
        ),  Gap(10.h),

        Center(
          child: ElevatedButton(
            onPressed: ()async {
              // Navigator.pushNamed(context, VerifyEmail.route);
              // await authController.signUp();
              Navigator.pop(context);

            },
            child:  Text('$buttonText', style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color: LightAppTheme.primaryColor,
              fontSize: 16.sp,)),
            style: ElevatedButton.styleFrom(
                backgroundColor: LightAppTheme.white,
                side: BorderSide(color: LightAppTheme.primaryColor),
                shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(40)),
                fixedSize: Size(108.w, 44.h),
                maximumSize: Size(108.w, 44.h)),
          ),
        ),
      ],
    ),
  ),));

}
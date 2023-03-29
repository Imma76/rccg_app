import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rccg_app/themes/app_theme.dart';

class VerifyEmail extends ConsumerWidget {
  static const route = 'forgot_password';
  const VerifyEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
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
        backgroundColor: AppTheme.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset('assets/app_logo.png',
                    height: 56.h, width: 56.w)),
            Gap(20.h),
            Text(
              'Verification Code',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primary2),
            ),
            Gap(27.h),
            Text(
                'We have to send the verification to your email mic****@mail.com',textAlign: TextAlign.center, style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppTheme.primary2) ,),
            Gap(45.h),
            Padding(
              padding: const EdgeInsets.only(left:24.0,right:24),
              child: PinCodeTextField(

                appContext: context,
                length: 5,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  selectedFillColor: AppTheme.white,
                  inactiveFillColor:   AppTheme.grey2,

                  activeColor:  AppTheme.grey2,
                  inactiveColor: AppTheme.grey2,
                  shape: PinCodeFieldShape.box,

                  borderRadius: BorderRadius.circular(16),
                  fieldHeight: 56,
                  fieldWidth: 56,
                  activeFillColor: AppTheme.grey2,
                ),
                animationDuration: Duration(milliseconds: 300),
               // backgroundColor: Colors.blue.shade50,
                enableActiveFill: true,
                // errorAnimationController: errorController,
                // controller: textEditingController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  // setState(() {
                  //   currentText = value;
                  // });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
            ),

            Text(
              'Resend code',textAlign: TextAlign.center, style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppTheme.primaryColor) ,),
            Gap(46.h),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Verify',
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

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rccg_app/themes/app_theme.dart';
import 'package:rccg_app/views/authentication/verify_done.dart';

import '../../controllers/central_controller.dart';
import '../../providers/all_providers.dart';


class VerifyEmail extends ConsumerStatefulWidget {
  static const route = 'verify email';
  const VerifyEmail({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends ConsumerState<VerifyEmail> {
  @override
  void initState() {
    // TODO: implement initState

    ref.read(authProvider);
    Timer timer = Timer.periodic(Duration(seconds: 3), (timer) async{
      print('waiting verification');
      if(FirebaseAuth.instance.currentUser != null){
        await FirebaseAuth.instance.currentUser!.reload();
        if( FirebaseAuth.instance.currentUser!.emailVerified){
          print('verified');
          timer.cancel();
          Navigator.pushNamedAndRemoveUntil(context, VerificationComplete.route, (route) => false);
        }
      }

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context, ) {
    final centralController = ref.watch(centralProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: LightAppTheme.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: LightAppTheme.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: LightAppTheme.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset('assets/app_logo.png',
                    height: 56.h, width: 56.w)),
            Gap(20.h),
            Text(
              'Confirm Email',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: LightAppTheme.primary2),
            ),
            Gap(68.h),
            Image.asset("assets/email.png", height: 127.h, width: 127.w),
            Gap(27.h),
            Center(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'We sent a message to ',
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                            text: '${centralController.user!.email}. ',
                            style: GoogleFonts.inter(
                                color: LightAppTheme.black2,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600)),
                        TextSpan(
                            text:
                            'Tap the link in that email to confirm that’s you.',
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400)),
                      ])),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left:10.0,right: 10),
            //   child: Text('We sent a message to victorvax@gmail.com. Tap the link in that email to confirm that’s you.',textAlign:
            //     TextAlign.center,style: GoogleFonts.inter(fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppTheme.black2),),
            // ),
            Gap(191.h),
            Text(
              'Didn’t see the link? Kindly check your spam folder or click resend below',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: LightAppTheme.grey3),
            ),
            Gap(41.h),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/email_icon.png',
                      width: 15.w,
                      height: 12.h,
                    ),
                    Gap(10.h),
                    Text('RESEND ACCOUNT VERIFICATION',
                        style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: LightAppTheme.primaryColor)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



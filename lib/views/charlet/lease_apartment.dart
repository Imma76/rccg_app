import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../../widgets/dialog.dart';

class LeaseApartment extends ConsumerWidget {
  static const route = 'lease';
  const LeaseApartment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: LightAppTheme.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: LightAppTheme.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: false,
          title: Text('Lease Your Apartment',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: LightAppTheme.black2))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 593.h,
              width: 327.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: LightAppTheme.white
              ),
              child: Column(
                children: [
                  Gap(20),
                  Center(
                    child: Container(
                      height:111.h,
                      width:double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(image: AssetImage('assets/lease2.png'))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gap(10),
                          Center(
                            child: Container(
                              height:32.h, width: 103.w,
                              decoration: BoxDecoration(color:LightAppTheme.lightPurple2, borderRadius:BorderRadius.circular(31)),
                              child: Center(
                                child: Text('Coming Soon',
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                        color: LightAppTheme.primaryColor)),
                              ),),
                          )
                        ],
                      ),
                    ),
                  ),
                  Gap(20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gap(20),
                      Text('Features to expect' ,style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: LightAppTheme.black)),
                    ],
                  ),
                  Gap(20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/check.png', width:24.h, height: 26.h,),Gap(20),   Text('Able to post your apartment for lease.',   style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: LightAppTheme.grey11)),
                    ],),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/check.png', width:24.h, height: 26.h,),Gap(20),   Text('Make money per day into your wallet.', style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: LightAppTheme.grey11)),
                    ],),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/check.png', width:24.h, height: 26.h,),Gap(20),   SizedBox(
                          width: 236.w,
                          child: Text('Personalize dashboard to view your earnings, update apartment details.',style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: LightAppTheme.grey11))),Gap(20),
                    ],),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/check.png', width:24.h, height: 26.h,),Gap(20),   Text('Make money per day into your wallet.',style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: LightAppTheme.grey11)),
                    ],),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/check.png', width:24.h, height: 26.h,),Gap(20),   Text('Make money per day into your wallet.',style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: LightAppTheme.grey11)),
                    ],),
                  Gap(20),
                  Center(child: SizedBox(
                      width: 277,
                      child: Text('Note: Join our wait list by clicking the button below to be notified when we launch this feature.',style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: LightAppTheme.grey11)))),
                  Gap(30),
                  Center(
                    child: ElevatedButton(
                      onPressed: ()async {
                        // Navigator.pushNamed(context, VerifyEmail.route);
                        //   await authController.signUp();
                        showSuccessDialogWidget(context,title: 'Congratulations',body: 'You have successfully joined our waitlist.');
                      },
                      child: Text('Join our waitlist'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: LightAppTheme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          minimumSize: Size(256.w, 50.h)),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

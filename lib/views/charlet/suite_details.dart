import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../../widgets/dialog.dart';

class SuiteDetails extends ConsumerStatefulWidget {
  static const route = 'suite deatils';
  const SuiteDetails({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SuiteDetailsState();
}

class _SuiteDetailsState extends ConsumerState<SuiteDetails> {
  @override
  Widget build(BuildContext context) {
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
          title: Text('RCCG Guest Suites',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: LightAppTheme.black2))),
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: LightAppTheme.white,
              child: Image.asset('assets/chat.png',height: 18.h,width: 23.w,color: LightAppTheme.primaryColor,),
              onPressed: () {


              },
              heroTag: null,
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              backgroundColor: LightAppTheme.white,
              child: Image.asset('assets/call2.png',height: 18.h,width: 23.w,color: LightAppTheme.primaryColor,),
              onPressed: () {
                showSuccessDialogWidget(context);
              },
              heroTag: null,
            )
          ]
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset('assets/suite_details.png', height: 197.h, width: 328.w,)),
          Gap(20),

          Padding(
            padding: const EdgeInsets.only(left:30.0),
            child: SizedBox(
              width: 237.w,
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
             //  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('RCCG Guest Suites',
                    style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: LightAppTheme.black2)), Gap(10),  Image.asset('assets/star.png', height: 13.h,width:14.w),
                  Text('4.5'),
                ],
              ),
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.only(left:30.0),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //  mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/location3.png', height: 24.h,width:24.w,color: LightAppTheme.black3,),
                Gap(10),
                SizedBox(
                  width: 327.w,
                  child: Text('Holiness road,Beside old auditorium centre, Rccg Camp',
                      style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: LightAppTheme.grey11)),
                ),
              ],
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.only(left:30.0),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //  mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/call.png', height: 24.h,width:24.w,color: LightAppTheme.black3,),
                Gap(10),
                SizedBox(
                  width: 327.w,
                  child: Text('+2348067494749',
                      style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: LightAppTheme.grey11)),
                ),
              ],
            ),
          ),
          Gap(20),
          Center(
            child:  ElevatedButton(
              onPressed: ()async {
                // Navigator.pushNamed(context, VerifyEmail.route);
                //await authController.signUp();
              },
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Directions on Map'), Gap(20),Image.asset(
                      'assets/location.png',
                      width: 11.w,
                      height: 16.h,color: LightAppTheme.white,
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: LightAppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  maximumSize: Size(329.w, 52.h)),
            ),
          ),




        ],
      ),
    );
  }
}

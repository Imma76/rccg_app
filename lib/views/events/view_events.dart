import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';

class ViewEvents extends ConsumerWidget {
  static const route = 'view events';
  const ViewEvents({
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
          title: Text('Events',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: LightAppTheme.black2)),
      actions: [
        Image.asset("assets/event_arrow.png", height: 26.h,width: 26.w,),
        Gap(10),
      ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/event_poster.png", height: 240.h,width: 328.w,)),
            Gap(20),
            SizedBox(
              width: 333.w,
              child: Text('April Holy Ghost Service: Victory without a fight', style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: LightAppTheme.black4)),
            ),
            Gap(12.h),
            SizedBox(
                width: 333.w,
                child: Text('Date: 7th April 2023', textAlign: TextAlign.start,style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: LightAppTheme.grey8))),
            Gap(12.h),
            SizedBox(
                width: 333.w,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/location.png',
                      width: 11.w,
                      height: 16.h,
                    ), Gap(12.h),
                    Text('New Auditorium, RCCG Camp', textAlign: TextAlign.start,style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: LightAppTheme.grey8)),

                  ],
                )),
            Gap(22.h),
            SizedBox(
                width: 333.w,
                child: Text('About this events', textAlign: TextAlign.start,style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: LightAppTheme.black4))),
            Gap(12.h),
            SizedBox(
                width: 333.w,
                child: Text("We're celebrating our 30th edition of the California Art Festival in CA this Spring so join us at the Building Park in California State University from March 29 - 30, 2022 with our Private View opening on Saturday, March 26!",
                 textAlign: TextAlign.start,style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    height: 2,
                    fontWeight: FontWeight.w400,
                    color: LightAppTheme.grey8))),
            Gap(22.h),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/events/view_events.dart';

import '../../themes/app_theme.dart';
import '../../widgets/text_fields.dart';

class RccgEvents extends ConsumerWidget {
  static const route = 'events';
  const RccgEvents({
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
                    color: LightAppTheme.black2))),
      body: Column(children: [
        Gap(20),
        Row(
          children: [
            Gap(20),
            SizedBox(
                height: 45,
                width: 326.w,
                child: AppTextField(
                  hintText: 'Search for events',
                  prefixIcon: Icon(Icons.search, color: LightAppTheme.black),
                  backGroundColor: LightAppTheme.white,
                  borderColor: LightAppTheme.white6,
                )),
            Gap(10),
            Image.asset('assets/calendar.png', height:32.h, width: 32.w,)
          ],
        ),

        Gap(20),
        EventCard()]));
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
            context, ViewEvents.route);
       },
      child: Padding(
        padding: const EdgeInsets.only(left: 23.0, right: 23),
        child: Container(
          //width:329.w,
          height: 120.h,
          padding: EdgeInsets.only(top: 12.h, left: 12.w),
          decoration: BoxDecoration(
              color: LightAppTheme.white,
              boxShadow: [
                const BoxShadow(
                    color: LightAppTheme.shadowColor,
                    offset: Offset(0, 10),
                    blurRadius: 15),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/events.png',
                        width: 88.w,
                        height: 96.h,
                      ))
                ],
              ),
              Gap(11.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('April Holy Ghost Service',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: LightAppTheme.primaryColor)),
                  Gap(6.h),
                  Text('Date: 7th April 2023',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: LightAppTheme.grey3)),
                  Gap(5.h),
                  Gap(21.h),
                  Row(
                    //   mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/location.png',
                        width: 11.w,
                        height: 16.h,
                      ),
                      Gap(8.w),

                      Text('Redemption City',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: LightAppTheme.grey3)),
                      Gap(21.h),
                      //   Text(
                      //     'View',
                      //     style: GoogleFonts.inter(
                      //         fontWeight: FontWeight.w600, fontSize: 16.sp),
                      //   ),
                      // ElevatedButton(
                      //   onPressed: () async {},
                      //   child: Text(
                      //     'View',
                      //     style: GoogleFonts.inter(
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 12.sp),
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //       backgroundColor: LightAppTheme.primaryColor,
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(40)),
                      //       minimumSize: Size(72.w, 32.h)),
                      // ),
                    ],
                  )
                ],
              ),
      ],),
    )),
    );
  }
}

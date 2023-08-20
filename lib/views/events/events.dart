import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/events/view_events.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../providers/all_providers.dart';
import '../../themes/app_theme.dart';
import '../../widgets/text_fields.dart';

class RccgEvents extends ConsumerWidget {
  static const route = 'events';
  const RccgEvents({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventController = ref.watch(eventProvider);
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
            GestureDetector(
                onTap: (){
                  showDialog(
                      useSafeArea: false,

                      context: context, builder: (context)=>StatefulBuilder(
                        builder: (context,state) {
                          return SizedBox(
                    width: double.infinity,
                            child: Dialog(
                              insetPadding: EdgeInsets.all(10),

                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 367.h,
                    width: double.infinity,
                    child:     Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.h),
                            child: SizedBox(
                              height: 400.h,
                              width: double.infinity,
                              //   color: AppTheme.lightGreen,
                              child: Column(
                                children: [
                                  TableCalendar(
                                    weekNumbersVisible: false,

                                    availableCalendarFormats: {
                                      CalendarFormat.month: 'Month',
                                    },
                                    daysOfWeekHeight: 40,
                                    rowHeight: 40,
                                    firstDay: DateTime.utc(2010, 10, 16),
                                    lastDay: DateTime.utc(2030, 3, 14),
                                    focusedDay:  eventController.selectedDate,
                                    currentDay: eventController.selectedDate,
                                    headerStyle: HeaderStyle(titleCentered: true,leftChevronIcon: Icon(Icons.chevron_left,color: LightAppTheme.primaryColor,),rightChevronIcon: Icon(Icons.chevron_right,color: LightAppTheme.primaryColor,)),
                                    daysOfWeekStyle: DaysOfWeekStyle(decoration: BoxDecoration()),
                                    calendarStyle: CalendarStyle(
                                      cellPadding: EdgeInsets.all(2),
                                      cellMargin: EdgeInsets.all(0),
                                      //    markerDecoration : const BoxDecoration(color: const Color(0xFF263238), shape: BoxShape.circle),
                                      //  todayTextStyle : const TextStyle(color: AppTheme.black, fontSize: 16.0),
                                      //
                                      //todayDecoration : const BoxDecoration(color: AppTheme.black, shape: BoxShape.circle),
                                      //    selectedTextStyle : const TextStyle(color: const Color(0xFFFAFAFA), fontSize: 16.0),
                                      // selectedDecoration : const BoxDecoration(color: AppTheme.white, shape: BoxShape.circle),
                                      //  rangeStartTextStyle : const TextStyle(color: const Color(0xFFFAFAFA), fontSize: 16.0),
                                      // rangeStartDecoration : const BoxDecoration(color: const Color(0xFF6699FF), shape: BoxShape.circle),
                                      //
                                      //  rangeEndTextStyle :const TextStyle(color: const Color(0xFFFAFAFA), fontSize: 16.0),
                                      //    rangeEndDecoration : const BoxDecoration(color: const Color(0xFF6699FF), shape: BoxShape.circle),
                                      //    withinRangeTextStyle : const TextStyle(),
                                      //   defaultDecoration :const BoxDecoration(shape: BoxShape.circle,color: AppTheme.black),
                                      //  // rowDecoration : const BoxDecoration(color: AppTheme.lightGreen),
                                      tableBorder: const TableBorder(
                                        // horizontalInside: BorderSide(color: AppTheme.black,strokeAlign: StrokeAlign.outside)
                                      ),
                                      // tablePadding:
                                      // EdgeInsets.only(bottom: 10, right: 10, left: 10)
                                      //  rowDecoration:BoxDecoration(color: AppTheme.lightGreen),

                                    ),
                                    // selectedDayPredicate: (date){
                                    //
                                    //
                                    //  if (date.day!=DateTime.now().day){
                                    //
                                    //   // return false;
                                    //  }
                                    //
                                    // // return true;
                                    // },
                                    calendarBuilders: CalendarBuilders(
                                        todayBuilder: (BuildContext context, DateTime date, _) {
                                          return GestureDetector(
                                            onTap: () {
                                              eventController.changeSelectedDate(date);
                                              state((){});

                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                //      margin: EdgeInsets.only(left: 2, right: ),
                                                child: Text(
                                                  date.day.toString(),
                                                  style: GoogleFonts.inter(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.bold,color: LightAppTheme.white
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: LightAppTheme.primaryColor,
                                                  borderRadius: BorderRadius
                                                      .circular(20),
                                                  border: Border.symmetric(
                                                    // vertical: BorderSide(color: AppTheme.black),
                                                    // horizontal: BorderSide(color: AppTheme.black),
                                                  ),
                                                )),
                                          );
                                        }, defaultBuilder: (BuildContext context, DateTime date, _) {
                                      return GestureDetector(
                                        onTap: () {

                                          eventController.changeSelectedDate(date);
                                          state((){});
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            //  margin: EdgeInsets.only(left: 5, right: 5),
                                            child: Text(date.day.toString(),
                                                style: GoogleFonts.inter(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                            decoration: BoxDecoration(

                                              border: Border.symmetric(
                                                //    vertical: BorderSide(color: AppTheme.black),
                                                //  horizontal: BorderSide(color: AppTheme.black),
                                              ),
                                              // borderRadius:
                                              // BorderRadius.all(Radius.circular(1)
                                              // )
                                            )),
                                      );
                                    }, outsideBuilder: (context, date, _) {
                                      return GestureDetector(
                                        onTap: () {
                                          eventController.changeSelectedDate(date);
                                          state((){});
                                        },
                                        child: Container(
                                          //  height: 30,
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(left: 5, right: 5),
                                            decoration: BoxDecoration(
                                              //    color: AppTheme.white,
                                              border: Border.symmetric(
                                                //  vertical: BorderSide(color: AppTheme.black),
                                                //   horizontal: BorderSide(color: AppTheme.black),
                                              ),
                                            ),
                                            child: Text('${date.day}',
                                                style: GoogleFonts.inter(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  // color:
                                                  //  AppTheme.red
                                                  //   AppTheme.lightBlack.withOpacity(0.6)

                                                ))),
                                      );
                                    }),
                                  ),
                                  Gap(20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Gap(0),
                                      GestureDetector(
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel')),
                                      Gap(20),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height:35.h, width: 103.w,
                                          decoration: BoxDecoration(color:LightAppTheme.primaryColor, borderRadius:BorderRadius.circular(31)),
                                          child: Center(
                                            child: Text('Done',
                                                style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.sp,
                                                    color: LightAppTheme.white)),
                                          ),),
                                      ),
                                      Gap(0),
                                    ],
                                  ),
                                  Gap(20),
                                ],
                              ),
                            ),
                    ) ,
                  ),),
                          );
                        }
                      ));
                },
                child: Image.asset('assets/calendar.png', height:32.h, width: 32.w,))
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/models/adeboye_sermon_model.dart';
import 'package:rccg_app/models/mmp_video_model.dart';
import 'package:rccg_app/models/mount_zion_movies.dart';
import 'package:rccg_app/models/rccg_movie_search_model.dart';
import 'package:rccg_app/models/youth_convention_model.dart';
import 'package:rccg_app/views/authentication/verify_email.dart';
import 'package:rccg_app/views/manuals/rccg_manuals.dart';
import 'package:rccg_app/views/programs/movies.dart';
import 'package:rccg_app/widgets/loader.dart';
import 'package:rccg_app/widgets/text_fields.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/holy_ghost_service.dart';
import '../../models/psfVideoModel.dart';
import '../../models/rccg_program_model.dart';
import '../../providers/all_providers.dart';
import '../../themes/app_theme.dart';
import '../authentication/auth.dart';
import '../programs/rccg_program.dart';
import '../watch_programs/watch_church_programs.dart';
import '../watch_programs/watch_movies.dart';

class Home extends ConsumerStatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(homeProvider);
    final programController = ref.read(programProvider);
    Future(() {
       programController.getRccgProgramChannelInfo();
    });
    Future(() {
       programController.loadMovieVideos();
    });
  }

  PageController controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authProvider);
    final homeController = ref.watch(homeProvider);
    final programController = ref.watch(programProvider);
    return Scaffold(
      backgroundColor: LightAppTheme.lightBlue,
      appBar: AppBar(
        backgroundColor: LightAppTheme.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Image.asset(
            'assets/app_logo.png',
            height: 37.h,
            width: 37.w,
          ),
        ),
        centerTitle: false,
        actions: [
          Image.asset(
            'assets/search.png',
            color: LightAppTheme.black,
            height: 18.h,
            width: 18.h,
          ),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.only(right: 28.0),
            child: Image.asset(
              'assets/notifications.png',
              color: LightAppTheme.black,
              height: 18.h,
              width: 18.h,
            ),
          )
        ],
        title: Text(
          'Welcome 👋 ',
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: LightAppTheme.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(10.h),
            Center(
              child: Container(
                width: 330.w,
                height: 44.9.h,
                decoration: BoxDecoration(
                    color: const Color(0xffEDEEEF),
                    borderRadius: BorderRadius.circular(22)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      authController.currentHomeIndex == 0
                          ? SizedBox(
                              height: 35.34.h,
                              width: 150.w,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 13),
                                        blurRadius: 25,
                                        color: Color.fromARGB(14, 14, 14, 0),
                                      ),
                                    ],
                                    color: LightAppTheme.white,
                                    borderRadius: BorderRadius.circular(17)),
                                // shape: RoundedRectangleBorder(
                                //     borderRadius:
                                //         BorderRadius.circular(17)),
                                child: Center(
                                    child: Text(
                                  'Get Started',
                                  style: GoogleFonts.inter(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: LightAppTheme.black2),
                                )),
                              ))
                          : GestureDetector(
                              onTap: () {
                                authController.changeHomeIndex(0);
                              },
                              child: SizedBox(
                                  height: 40.34.h,
                                  width: 150.w,
                                  child: Center(
                                      child: Text(
                                    'Get Started',
                                    style: GoogleFonts.inter(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: LightAppTheme.grey),
                                  )))),
                      authController.currentHomeIndex == 1
                          ? SizedBox(
                              height: 35.34.h,
                              width: 150.w,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 13),
                                        blurRadius: 25,
                                        color: Color.fromARGB(14, 14, 14, 0),
                                      ),
                                    ],
                                    color: LightAppTheme.white,
                                    borderRadius: BorderRadius.circular(17)),
                                child: Center(
                                    child: Text(
                                  'My Prayer Tracker',
                                  style: GoogleFonts.inter(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: LightAppTheme.black2),
                                )),
                              ))
                          : GestureDetector(
                              onTap: () {
                                authController.changeHomeIndex(1);
                              },
                              child: SizedBox(
                                  height: 44.34.h,
                                  width: 150.w,
                                  child: Center(
                                      child: Text(
                                    'My Prayer Tracker',
                                    style: GoogleFonts.inter(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: LightAppTheme.grey),
                                  ))))
                    ],
                  ),
                ),
              ),
            ),

            Gap(19.h),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 27.w, right: 27.w),
                  child: Container(
                    height: 121.h,
                    //width: 327.w,

                    decoration: BoxDecoration(
                        // boxShadow: const [
                        //   BoxShadow(
                        //     offset: Offset(8,4),
                        //     blurRadius: 25,
                        //     color: LightAppTheme.lightPurple,
                        //   ),
                        // ],
                        color: LightAppTheme.lightPurple,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Gap(24.h),
                        Text('Find an RCCG church near you',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: LightAppTheme.white)),
                        Gap(15.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox(
                            height: 25,
                            child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Enter your location',
                                    hintStyle: GoogleFonts.inter(
                                        color: LightAppTheme.white4,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: LightAppTheme.white2),
                                        borderRadius:
                                            BorderRadius.circular(28)),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: LightAppTheme.white2),
                                        borderRadius:
                                            BorderRadius.circular(28)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: LightAppTheme.white2),
                                        borderRadius:
                                            BorderRadius.circular(28)))),
                          ),
                          //AppTextField(hintText: 'Enter your location',prefixIcon:Icon(Icons.location_on_outlined,color: LightAppTheme.grey,),backGroundColor: LightAppTheme.white,)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 27.w, right: 27.w),
                  child: Container(
                    height: 121.h,
                    //width: 327.w,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 13),
                            blurRadius: 25,
                            color: LightAppTheme.shadowColor,
                          ),
                        ],
                        color: LightAppTheme.purple2,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Gap(24.h),
                        Text('Find an RCCG church near you',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: LightAppTheme.white)),
                        Gap(15.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox(
                              height: 35,
                              child: Center(
                                child: TextField(
                                    cursorColor: LightAppTheme.primaryColor,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: LightAppTheme.white,
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        hintText: 'Enter your location',
                                        prefixIcon: const Icon(
                                          Icons.location_on_outlined,
                                          color: LightAppTheme.grey,
                                        ),
                                        hintStyle: GoogleFonts.inter(
                                            color: LightAppTheme.white4,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: LightAppTheme.white2),
                                            borderRadius:
                                                BorderRadius.circular(28)),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: LightAppTheme.white2),
                                            borderRadius:
                                                BorderRadius.circular(28)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: LightAppTheme.white2),
                                            borderRadius:
                                                BorderRadius.circular(28)))),
                              )),
                          //AppTextField(hintText: 'Enter your location',prefixIcon:Icon(Icons.location_on_outlined,color: LightAppTheme.grey,),backGroundColor: LightAppTheme.white,)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Gap(27.h),
            Padding(
              padding: EdgeInsets.only(left: 27.w, right: 27.w),
              child: Row(
                children: [
                  Text('Daily Open heavens',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: LightAppTheme.black2)),
                  const Spacer(),
                  // Text('View all',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.primaryColor)),
                ],
              ),
            ),
            Gap(20.h),
            Padding(
              padding: const EdgeInsets.only(left: 23.0, right: 23),
              child: Container(
                // width:329.w,
                height: 120.h,
                padding: EdgeInsets.only(top: 12.h, left: 12.w),
                decoration: BoxDecoration(
                    color: LightAppTheme.white,
                    boxShadow: [
                      const BoxShadow(
                        offset: Offset(0, 13),
                        blurRadius: 25,
                        color: LightAppTheme.shadowColor,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/open_heavens.png',
                              width: 88.w,
                              height: 96.h,
                            ))
                      ],
                    ),
                    Gap(11.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 203.w,
                            child: Text('Topic: God Is Taking Records.',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    color: LightAppTheme.primaryColor))),
                        Gap(6.h),
                        Text('Date: 31st March 2023',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: LightAppTheme.grey3)),
                        Gap(10.h),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Gap(27.h),
            Padding(
              padding: EdgeInsets.only(left: 27.w, right: 27.w),
              child: Row(
                children: [
                  Text('Features',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: LightAppTheme.black2)),
                  const Spacer(),
                  Text('More',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: LightAppTheme.black2)),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 9,
                  )
                ],
              ),
            ),
            Gap(14.h),
            SizedBox(
              height: 156.h,
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  print(value);
                  setState(() {
                    index = value;
                  });
                  if (value == 2) {
                    print('here');
                  }
                },
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 27.w, right: 27.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  if (authController.googleUser != null) {
                                    await authController.googleSignIn
                                        .disconnect();
                                    await FirebaseAuth.instance.signOut();
                                  } else {
                                    await FirebaseAuth.instance.signOut();
                                  }

                                  Navigator.pushNamedAndRemoveUntil(context,
                                      Authentication.route, (route) => false);
                                },
                                child: Container(
                                  height: 70.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                      color: LightAppTheme.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/radio.png',
                                          height: 20.h,
                                          width: 20.w,
                                        ),
                                        Gap(6.w),
                                        Text('Rccg Radio',
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color:
                                                    LightAppTheme.primaryColor))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(14.w),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RccgManual.route);
                                },
                                child: Container(
                                  height: 70.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                      color: LightAppTheme.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/manuals.png',
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                                      Gap(6.w),
                                      Text('Rccg Manuals',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color:
                                                  LightAppTheme.primaryColor))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(15.h),
                      Padding(
                        padding: EdgeInsets.only(left: 27.w, right: 27.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 70.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    color: LightAppTheme.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/music.png',
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                                      Gap(6.w),
                                      Text('Rccg Hymns',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color:
                                                  LightAppTheme.primaryColor))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Gap(14.w),
                            Expanded(
                              child: Container(
                                height: 70.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    color: LightAppTheme.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/charlets.png',
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                    Gap(6.w),
                                    Text('Rccg charlets',
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            color: LightAppTheme.primaryColor))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 27.w, right: 27.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  if (authController.googleUser != null) {
                                    await authController.googleSignIn
                                        .disconnect();
                                    await FirebaseAuth.instance.signOut();
                                  } else {
                                    await FirebaseAuth.instance.signOut();
                                  }

                                  Navigator.pushNamedAndRemoveUntil(context,
                                      Authentication.route, (route) => false);
                                },
                                child: Container(
                                  height: 70.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                      color: LightAppTheme.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/events_icon.png',
                                          height: 20.h,
                                          width: 20.w,
                                        ),
                                        Gap(6.w),
                                        Text('Rccg Events',
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color:
                                                    LightAppTheme.primaryColor))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(14.w),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RccgManual.route);
                                },
                                child: Container(
                                  height: 70.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                      color: LightAppTheme.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/discover.png',
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                                      Gap(6.w),
                                      Text('Discover',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color:
                                                  LightAppTheme.primaryColor))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(15.h),
                      Padding(
                        padding: EdgeInsets.only(left: 27.w, right: 27.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 70.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    color: LightAppTheme.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/app_logo.png',
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                                      Gap(6.w),
                                      Text('About Rccg',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color:
                                                  LightAppTheme.primaryColor))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Gap(14.w),
                            Expanded(
                              child: Container(
                                height: 70.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    color: LightAppTheme.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/location.png',
                                      height: 20.h,
                                      width: 20.w,
                                      color: LightAppTheme.primaryColor,
                                    ),
                                    Gap(6.w),
                                    Text('Camp Map',
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            color: LightAppTheme.primaryColor))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Gap(14.h),
            AnimatedSmoothIndicator(
              activeIndex: index,
              count: 2,
              effect: ExpandingDotsEffect(
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  activeDotColor: LightAppTheme.primaryColor,
                  dotColor: LightAppTheme.primary5),
            ),

            Gap(14.h),

            Padding(
              padding: EdgeInsets.only(left: 27.w, right: 27.w),
              child: Row(
                children: [
                  Text('Rccg Programs',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: LightAppTheme.black2)),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RccgProgram.route);
                      },
                      child: Text('View all',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: LightAppTheme.black2))),
                ],
              ),
            ),
            Gap(27.h),
            Padding(
              padding: EdgeInsets.only(left: 07.w, right: 07.w),
              child: SizedBox(
                height: 35.h,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Gap(
                      20.w,
                    ),
                    const ProgramsChoiceButton(
                      title: 'All',
                      index: 0,
                    ),
                    const Gap(10),
                    const ProgramsChoiceButton(
                      title: 'Live Programs',
                      index: 1,
                    ),
                    const Gap(10),
                    const ProgramsChoiceButton(
                      title: 'Pastor EA Sermons',
                      index: 2,
                    ),
                    const Gap(10),
                    const ProgramsChoiceButton(
                      title: 'Pastor Mrs FA Sermons',
                      index: 3,
                    ),
                    const Gap(10),
                    const ProgramsChoiceButton(
                      title: 'Holy Ghost Service',
                      index: 4,
                    ),
                    const Gap(10),
                    const ProgramsChoiceButton(
                      title: 'Convention',
                      index: 5,
                    ),
                    const Gap(10),
                    const ProgramsChoiceButton(
                      title: 'Congress',
                      index: 6,
                    ),
                    const Gap(10),
                    const ProgramsChoiceButton(
                      title: 'Psf Programs',
                      index: 7,
                    ),
                    const Gap(10),
                    const ProgramsChoiceButton(
                      title: 'RCCG Youths',
                      index: 8,
                    ),
                    const Gap(10),
                    const ProgramsChoiceButton(
                      title: 'RCCG MMP',
                      index: 9,
                    ),
                    const Gap(10),
                    const ProgramsChoiceButton(
                      title: 'Feast of Esther',
                      index: 10,
                    ),
                    Gap(
                      20.w,
                    ),
                  ],
                ),
              ),
            ),

            Gap(34.h),
            if(programController.load)
              Indicator(),
            if (programController.rccgProgramModel!=null)
              Visibility(
                visible:
                    homeController.currentProgramChoice == 0 ? true : false,
                child: SizedBox(
                  height: 235.h,
                  child:ListView.builder(
                          itemCount: programController
                              .rccgProgramModel!.videos!.length,
                          padding: EdgeInsets.zero,
                          //itemExtent: 0,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                                ProgramCard(
                              programDetails: programController
                                  .rccgProgramModel!.videos![index],
                            );
                          }),
                ),
              ),


            if (programController.psfVideosList!=null)
              Visibility(
                visible:
                homeController.currentProgramChoice == 7 ? true : false,
                child: SizedBox(
                  height: 235.h,
                  child:  ListView.builder(
                      itemCount: programController.psfVideosList!.psfvideos!.length,
                      padding: EdgeInsets.zero,
                      //itemExtent: 0,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL

                        PSfProgramCard(psfVideoItem: programController.psfVideosList!.psfvideos![index],);
                      }),
                ),
              ),
            if (programController.mmpVideosList!=null)
              Visibility(
                visible:
                homeController.currentProgramChoice == 9 ? true : false,
                child: SizedBox(
                  height: 235.h,
                  child: ListView.builder(
                      itemCount: programController.mmpVideosList!.mmpvideos!.length,
                      padding: EdgeInsets.zero,
                      //itemExtent: 0,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL

                          MmpProgramCard(mmpVideosItem: programController.mmpVideosList!.mmpvideos![index],);
                      }),
                ),
              ),
            if (programController.pAdeboyeSermonModel != null)
              Visibility(
                visible:
                    homeController.currentProgramChoice == 2 ? true : false,
                child: SizedBox(
                  height: 235.h,
                  child:ListView.builder(
                          itemCount: programController
                              .pAdeboyeSermonModel!.items!.length,
                          padding: EdgeInsets.zero,
                          //itemExtent: 0,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL

                                AdeboyeSermonCard(
                              adeboyeSermonVideoModel: programController
                                  .pAdeboyeSermonModel!.items![index],
                            );
                          }),
                ),
              ),
            if (programController.holyGhostServiceModel != null)
              Visibility(
                visible:
                    homeController.currentProgramChoice == 4 ? true : false,
                child: SizedBox(
                  height: 235.h,
                  child:ListView.builder(
                          itemCount: programController
                              .holyGhostServiceModel!.items!.length,
                          padding: EdgeInsets.zero,
                          //itemExtent: 0,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL

                                HolyGhostProgramCard(
                              holyGhostServiceVideoItem: programController
                                  .holyGhostServiceModel!.items![index],
                            );
                          }),
                ),
              ),
            if (programController.youthConventionModel != null)
              Visibility(
                visible:
                    homeController.currentProgramChoice == 8 ? true : false,
                child: SizedBox(
                  height: 235.h,
                  child: ListView.builder(
                          itemCount: programController
                              .youthConventionModel!.items!.length,
                          padding: EdgeInsets.zero,
                          //itemExtent: 0,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL

                                YouthConventionProgramCard(
                              youthConventionVideoItem: programController
                                  .youthConventionModel!.items![index],
                            );
                          }),
                ),
              ),
            Gap(27.h),
            Padding(
              padding: const EdgeInsets.only(left: 23.0, right: 23),
              child: Row(
                children: [
                  Text('Upcoming events',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: LightAppTheme.black2)),
                  const Spacer(),
                  Text('View all',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: LightAppTheme.black2)),
                ],
              ),
            ),
            Gap(20.h),
            Padding(
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
                            Gap(11.h),
                            //   Text(
                            //     'View',
                            //     style: GoogleFonts.inter(
                            //         fontWeight: FontWeight.w600, fontSize: 16.sp),
                            //   ),
                            ElevatedButton(
                              onPressed: () async {},
                              child: Text(
                                'View',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: LightAppTheme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  minimumSize: Size(72.w, 32.h)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Gap(27.h),
            Padding(
              padding: const EdgeInsets.only(left: 23.0, right: 23),
              child: Row(
                children: [
                  Text('Christian Movies',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: LightAppTheme.black2)),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ChristianMovie.route);
                      },
                      child: Text('View all',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: LightAppTheme.black2))),
                ],
              ),
            ),
            Gap(20.h),
            SizedBox(
              height: 35.h,
              child: Padding(
                padding: const EdgeInsets.only(left: 7.0, right: 5),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Gap(
                      20.w,
                    ),
                    const MovieChoiceButton(
                      title: 'All',
                      index: 0,
                    ),
                    const Gap(10),
                    const MovieChoiceButton(
                      title: 'Mount Zion Movies',
                      index: 1,
                    ),
                    const Gap(10),
                    const MovieChoiceButton(
                      title: 'Kids Christian Movie',
                      index: 2,
                    ),
                    const Gap(10),
                    const MovieChoiceButton(
                      title: 'International Christian Movie',
                      index: 2,
                    ),
                    Gap(
                      20.w,
                    ),
                  ],
                ),
              ),
            ),
            Gap(27.h),
            if(programController.loadMovies)
              Indicator(),

            if(programController.christianMovieModel!=null)
            Visibility(
              visible:homeController.currentMovieChoice==0,
              child: SizedBox(
                height: 220.h,
                child: ListView.builder(
                    itemCount: programController.christianMovieModel!.videos!.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context,index) {
                      return  MovieCard(searchVideoItem: programController.christianMovieModel!.videos![index]
                        ,);
                    }
                ),
              ),
            ),
            if(programController.mountZionMovies!=null)
              Visibility(
                visible:homeController.currentMovieChoice==1,
                child: SizedBox(
                  height: 220.h,
                  child:programController.loadMovies?Indicator():  ListView.builder(
                      itemCount: programController.christianMovieModel!.videos!.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context,index) {
                        return MountZionMovieCard(mountZionVideoItem: programController.mountZionMovies!.items![index],);
                      }
                  ),
                ),
              ),
            Gap(40.h),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23.0, right: 23),
                  child: Center(
                    child: Container(
                      //width:326.w,
                      height: 107.h,
                      //  margin:EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(top: 12.h, left: 12.w),
                      decoration: BoxDecoration(
                          color: LightAppTheme.lightPurple,
                          boxShadow: [
                            const BoxShadow(
                              offset: Offset(0, 13),
                              blurRadius: 25,
                              color: LightAppTheme.shadowColor,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Gap(15.h),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/support.png',
                                    width: 76.w,
                                    height: 74.h,
                                  ))
                            ],
                          ),
                          Gap(11.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Gap(15.h),
                              Text('Love what we are doing ?',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: LightAppTheme.white)),
                              Gap(6.h),
                              ElevatedButton(
                                onPressed: () async {},
                                child: Row(
                                  children: [
                                    Text(
                                      'Support us ',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: LightAppTheme.primaryColor),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: LightAppTheme.primaryColor,
                                      size: 8,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: LightAppTheme.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    minimumSize: Size(72.w, 32.h)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23.0, right: 23),
                  child: Center(
                    child: Container(
                      //width:326.w,
                      height: 107.h,
                      margin: const EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(top: 12.h, left: 12.w),
                      decoration: BoxDecoration(
                          color: LightAppTheme.purple2,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 13),
                              blurRadius: 25,
                              color: LightAppTheme.shadowColor,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Gap(15.h),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/support.png',
                                    width: 76.w,
                                    height: 74.h,
                                  ))
                            ],
                          ),
                          Gap(11.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Gap(15.h),
                              Text('Love what we are doing ?',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: LightAppTheme.white)),
                              Gap(6.h),
                              ElevatedButton(
                                onPressed: () async {},
                                child: Row(
                                  children: [
                                    Text(
                                      'Support us ',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: LightAppTheme.primaryColor),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: LightAppTheme.primaryColor,
                                      size: 8,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: LightAppTheme.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    minimumSize: Size(72.w, 32.h)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}

class MrsFaProgramCard extends StatelessWidget {
  final RccgProgramVideoItem? programDetails;

  const MrsFaProgramCard({Key? key, this.programDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WatchPrograms(
            rccgProgramModel: programDetails,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 23.0, right: 5, bottom: 4),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: 100.h,
          width: 288.w,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: const [
                BoxShadow(
                    color: LightAppTheme.shadowColor,
                    offset: Offset(0, 10),
                    blurRadius: 15),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  CachedNetworkImage(
                    imageUrl: programDetails!
                        .videoDetails!.thumbnails!.medium!.url
                        .toString(),
                    height: 144.h,
                    width: 266.w,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 50,
                      // left: 30,
                      child: Image.asset(
                        'assets/play.png',
                        height: 40.h,
                        width: 40.w,
                      ))
                ],
              ),
              Gap(20.h),
              Center(
                  child: Text(
                programDetails!.videoDetails!.title.toString(),
                style: GoogleFonts.inter(
                    color: LightAppTheme.black2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class HolyGhostProgramCard extends StatelessWidget {
  final HolyGhostServiceVideoItem? holyGhostServiceVideoItem;

  const HolyGhostProgramCard({Key? key, this.holyGhostServiceVideoItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) {
        //       return WatchPrograms(
        //         rccgProgramModel:programDetails,
        //       );
        //     }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 23.0, right: 5, bottom: 4),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: 100.h,
          width: 288.w,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: const [
                BoxShadow(
                    color: LightAppTheme.shadowColor,
                    offset: Offset(0, 10),
                    blurRadius: 15),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  CachedNetworkImage(
                    imageUrl: holyGhostServiceVideoItem!
                        .snippet!.thumbnails!.medium!.url
                        .toString(),
                    height: 144.h,
                    width: 266.w,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 50,
                      // left: 30,
                      child: Image.asset(
                        'assets/play.png',
                        height: 40.h,
                        width: 40.w,
                      ))
                ],
              ),
              Gap(20.h),
              Center(
                  child: Text(
                holyGhostServiceVideoItem!.snippet!.title.toString(),
                style: GoogleFonts.inter(
                    color: LightAppTheme.black2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              )),
            ],
          ),
        ),
      ),
    );
  }
}



class MmpProgramCard extends StatelessWidget {
  final MmpVideoItem?mmpVideosItem;

  const MmpProgramCard({Key? key, this.mmpVideosItem
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) {
        //       return WatchPrograms(
        //         rccgProgramModel:programDetails,
        //       );
        //     }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 23.0, right: 5, bottom: 4),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: 100.h,
          width: 288.w,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: const [
                BoxShadow(
                    color: LightAppTheme.shadowColor,
                    offset: Offset(0, 10),
                    blurRadius: 15),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  CachedNetworkImage(
                    imageUrl: mmpVideosItem!.mmpsnippet!.thumbnails!.medium!.url
                        .toString(),
                    height: 144.h,
                    width: 266.w,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 50,
                      // left: 30,
                      child: Image.asset(
                        'assets/play.png',
                        height: 40.h,
                        width: 40.w,
                      ))
                ],
              ),
              Gap(20.h),
              Center(
                  child: Text(
                    mmpVideosItem!.mmpsnippet!.title.toString(),
                    style: GoogleFonts.inter(
                        color: LightAppTheme.black2,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}


class PSfProgramCard extends StatelessWidget {
  final PsfVideoItem? psfVideoItem;

  const PSfProgramCard({Key? key, this.psfVideoItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) {
        //       return WatchPrograms(
        //         rccgProgramModel:programDetails,
        //       );
        //     }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 23.0, right: 5, bottom: 4),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: 100.h,
          width: 288.w,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: const [
                BoxShadow(
                    color: LightAppTheme.shadowColor,
                    offset: Offset(0, 10),
                    blurRadius: 15),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  CachedNetworkImage(
                    imageUrl:  psfVideoItem!
                        .psfsnippet!.thumbnails!.medium!.url
                        .toString(),
                    height: 144.h,
                    width: 266.w,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 50,
                      // left: 30,
                      child: Image.asset(
                        'assets/play.png',
                        height: 40.h,
                        width: 40.w,
                      ))
                ],
              ),
              Gap(20.h),
              Center(
                  child: Text(
                    psfVideoItem!.psfsnippet!.title.toString(),
                    style: GoogleFonts.inter(
                        color: LightAppTheme.black2,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class YouthConventionProgramCard extends StatelessWidget {
  final YouthConventionVideoItem? youthConventionVideoItem;

  const YouthConventionProgramCard({Key? key, this.youthConventionVideoItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) {
        //       return WatchPrograms(
        //         rccgProgramModel:programDetails,
        //       );
        //     }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 23.0, right: 5, bottom: 4),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: 100.h,
          width: 288.w,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: const [
                BoxShadow(
                    color: LightAppTheme.shadowColor,
                    offset: Offset(0, 10),
                    blurRadius: 15),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  CachedNetworkImage(
                    imageUrl: youthConventionVideoItem!
                        .snippet!.thumbnails!.medium!.url
                        .toString(),
                    height: 144.h,
                    width: 266.w,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 50,
                      // left: 30,
                      child: Image.asset(
                        'assets/play.png',
                        height: 40.h,
                        width: 40.w,
                      ))
                ],
              ),
              Gap(20.h),
              Center(
                  child: Text(
                youthConventionVideoItem!.snippet!.title.toString(),
                style: GoogleFonts.inter(
                    color: LightAppTheme.black2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgramCard extends StatelessWidget {
  final RccgProgramVideoItem? programDetails;

  const ProgramCard({Key? key, this.programDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WatchPrograms(
            rccgProgramModel: programDetails,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 23.0, right: 5, bottom: 4),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: 100.h,
          width: 288.w,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: const [
                BoxShadow(
                    color: LightAppTheme.shadowColor,
                    offset: Offset(0, 10),
                    blurRadius: 15),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  CachedNetworkImage(
                    imageUrl: programDetails!
                        .videoDetails!.thumbnails!.medium!.url
                        .toString(),
                    height: 144.h,
                    width: 266.w,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 50,
                      // left: 30,
                      child: Image.asset(
                        'assets/play.png',
                        height: 40.h,
                        width: 40.w,
                      ))
                ],
              ),
              Gap(20.h),
              Center(
                  child: Text(
                programDetails!.videoDetails!.title.toString(),
                style: GoogleFonts.inter(
                    color: LightAppTheme.black2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class AdeboyeSermonCard extends StatelessWidget {
  final PAdeboyeSermonModelVideoItem? adeboyeSermonVideoModel;

  const AdeboyeSermonCard({Key? key, this.adeboyeSermonVideoModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) {
        //       return WatchPrograms(
        //         rccgProgramModel:programDetails,
        //       );
        //     }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 23.0, right: 5, bottom: 4),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: 100.h,
          width: 288.w,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: const [
                BoxShadow(
                    color: LightAppTheme.shadowColor,
                    offset: Offset(0, 10),
                    blurRadius: 15),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  CachedNetworkImage(
                    imageUrl: adeboyeSermonVideoModel!
                        .snippet!.thumbnails!.medium!.url
                        .toString(),
                    height: 144.h,
                    width: 266.w,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 50,
                      // left: 30,
                      child: Image.asset(
                        'assets/play.png',
                        height: 40.h,
                        width: 40.w,
                      ))
                ],
              ),
              Gap(20.h),
              Center(
                  child: Text(
                adeboyeSermonVideoModel!.snippet!.title.toString(),
                style: GoogleFonts.inter(
                    color: LightAppTheme.black2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final SearchVideoItem? searchVideoItem;
  const MovieCard({Key? key, this.searchVideoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WatchMovies(
            videoId: searchVideoItem!.id,
            searchVideoDetails: searchVideoItem!.videoDetails,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 23.0, right: 5, bottom: 4),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          height: 218.h,
          width: 288.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: LightAppTheme.white,
            boxShadow: [
              const BoxShadow(
                  color: LightAppTheme.shadowColor,
                  offset: Offset(0, 10),
                  blurRadius: 15),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  CachedNetworkImage(
                    imageUrl: searchVideoItem!
                        .videoDetails!.thumbnails!.medium!.url
                        .toString(),
                    height: 144.h,
                    width: 266.w,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 50,
                      // left: 30,
                      child: Image.asset(
                        'assets/play.png',
                        height: 40.h,
                        width: 40.w,
                      ))
                ],
              ),
              Gap(10.h),
              Text(
                searchVideoItem!.videoDetails!.title.toString(),
                style: GoogleFonts.inter(
                    color: LightAppTheme.black2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class MountZionMovieCard extends StatelessWidget {
  final MountZionVideoItem?mountZionVideoItem;
  const MountZionMovieCard({Key? key, this.mountZionVideoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return WatchMovies(
        //     videoId: searchVideoItem!.id,
        //     searchVideoDetails: searchVideoItem!.videoDetails,
        //   );
        // }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 23.0, right: 5, bottom: 4),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          height: 218.h,
          width: 288.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: LightAppTheme.white,
            boxShadow: [
              const BoxShadow(
                  color: LightAppTheme.shadowColor,
                  offset: Offset(0, 10),
                  blurRadius: 15),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  CachedNetworkImage(
                    imageUrl: mountZionVideoItem!.snippet!
                       .thumbnails!.medium!.url
                        .toString(),
                    height: 144.h,
                    width: 266.w,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 50,
                      // left: 30,
                      child: Image.asset(
                        'assets/play.png',
                        height: 40.h,
                        width: 40.w,
                      ))
                ],
              ),
              Gap(10.h),
              Text(
                mountZionVideoItem!.snippet!.title.toString(),
                style: GoogleFonts.inter(
                    color: LightAppTheme.black2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ProgramsChoiceButton extends ConsumerWidget {
  final String? title;
  final int? index;
  const ProgramsChoiceButton({Key? key, this.title, this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final homeController = ref.watch(homeProvider);
    final programController = ref.watch(programProvider);
    return GestureDetector(
        onTap: () async {
          homeController.changeCurrentProgramChoice(index!);
          if(index ==7 && programController.psfVideosList==null){
            await programController.getPsfChannelInfo();
          }
          if(index == 9&& programController.mmpVideosList==null){
            await programController.getMmpChannelInfo();
          }
          if (index == 8 && programController.youthConventionModel == null) {
            await programController.loadYouthConvention();
          }
          if (index == 0 && programController.rccgProgramModel == null) {
            await programController.getRccgProgramChannelInfo();
          }

          if (index == 4 && programController.holyGhostServiceModel == null) {
            await programController.loadHolyGhostService();
          }
          if (index == 2 && programController.pAdeboyeSermonModel == null) {
            print('kkk$index');
            await programController.loadAdeboyeSermons();
          } else {
            //homeController.changeCurrentProgramChoice(index!);
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: homeController.currentProgramChoice == index
                  ? LightAppTheme.primaryColor
                  : LightAppTheme.white,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: const Color(0xffE3E9ED))),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, top: 4, bottom: 4),
            child: Center(
              child: Text('$title',
                  style: GoogleFonts.inter(
                      color: homeController.currentProgramChoice == index
                          ? LightAppTheme.white
                          : LightAppTheme.black)),
            ),
          ),
        ));
  }
}

class MovieChoiceButton extends ConsumerWidget {
  final String? title;
  final int? index;
  const MovieChoiceButton({Key? key, this.title, this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final homeController = ref.watch(homeProvider);
    final programController = ref.watch(programProvider);
    return GestureDetector(
        onTap: () async{
          homeController.changeCurrentMovieChoice(index!);
          if(index == 1&& programController.mountZionMovies==null){
            await programController.loadMountZionMovies();
          }
          if(index ==0&& programController.christianMovieModel ==null){
            await programController.loadMovieVideos();
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: homeController.currentMovieChoice == index
                  ? LightAppTheme.primaryColor
                  : LightAppTheme.white,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: const Color(0xffE3E9ED))),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, top: 4, bottom: 4),
            child: Center(
              child: Text('$title',
                  style: GoogleFonts.inter(
                      color: homeController.currentMovieChoice == index
                          ? LightAppTheme.white
                          : LightAppTheme.black)),
            ),
          ),
        ));
  }
}

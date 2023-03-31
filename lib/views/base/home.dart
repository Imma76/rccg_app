import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/authentication/verify_email.dart';
import 'package:rccg_app/views/programs/movies.dart';
import 'package:rccg_app/widgets/text_fields.dart';

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
  }
  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authProvider);
    final homeController =ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left:22.0),
          child: Image.asset('assets/app_logo.png',height: 37.h,width: 37.w,),
        ),
        centerTitle: false,
        actions: [

          Image.asset('assets/search.png',color: AppTheme.black,height: 18.h,width: 18.h,),
          Gap(15),
          Padding(
            padding: const EdgeInsets.only(right:28.0),
            child: Image.asset('assets/notifications.png',color: AppTheme.black,height: 18.h,width: 18.h,),
          )
        ],
        title: Text('Welcome 👋 ',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 18.sp,color: AppTheme.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left:27.w,right: 27.w),
              child: Container(height: 121.h,
                //width: 327.w,

                decoration: BoxDecoration(color:AppTheme.purple2 , borderRadius: BorderRadius
              .circular(10)),
                child: Column(children: [
                  Gap(24.h),
                  Text('Find an RCCG church near you',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 16.sp,color: AppTheme.white)),
               Gap(15.h),
                const Padding(
                  padding: EdgeInsets.only(left:20,right: 20),
                  child: SizedBox(
                      height: 35,
                      child: AppTextField(hintText: 'Enter your location',prefixIcon:Icon(Icons.location_on_outlined,color: AppTheme.grey,),backGroundColor: AppTheme.white,)),
                ),
                ],),),
            ),
            Gap(17.h),
            Padding(
              padding:  EdgeInsets.only(left:27.w,right: 27.w),
              child: Container(
                height: 72.h,
               // width: 326.w,
                decoration: BoxDecoration(
                  color:AppTheme.lightPurple,borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:21.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(14.h),
                          Text('Go Premium Now 🚀',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.primaryColor)),
                        Text('Access all features',style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12.sp,color: AppTheme.primaryColor))
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right:21.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('View Details',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.primaryColor)),Icon(Icons.arrow_forward_ios_rounded,size: 7,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Gap(27.h),
            Padding(
              padding:  EdgeInsets.only(left:27.w,right: 27.w),
              child: Row(
                children: [
                  Text('Features',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.primaryColor)),
                  Spacer(),
                  Text('More',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.primaryColor)),
                  Icon(Icons.arrow_forward_ios_rounded,size: 9,)

                ],
              ),
            ),
            Gap(16.h),
            Padding(
              padding:  EdgeInsets.only(left:27.w,right: 27.w),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()async {
                        await authController.googleSignIn.disconnect();
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushNamedAndRemoveUntil(context, Authentication.route, (route) => false);

                      },
                      child: Container(

                        height: 70.h,width: 150.w,decoration: BoxDecoration(color:
                      AppTheme.white,borderRadius: BorderRadius.circular(10)),

                        child: Center(
                          child: Row(
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Image.asset('assets/manuals.png',height: 13.h,width: 18.w,),
                            Text('Rccg Manuals',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14.sp,color: AppTheme.primaryColor))
                          ],),
                        ),),
                    ),
                  ),
                  Gap(14.w),
                  Expanded(
                    child: Container(
                      height: 70.h,width: 150.w,decoration: BoxDecoration(color:
                    AppTheme.white,borderRadius: BorderRadius.circular(10)),
                      child: Row(

                        crossAxisAlignment:CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Image.asset('assets/music.png',height: 13.h,width: 18.w,),
                        Text('Rccg Hymns',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14.sp,color: AppTheme.primaryColor))
                      ],),),
                  ),
                ],
              ),
            ),
            Gap(15.h),
            Padding(
              padding:  EdgeInsets.only(left:27.w,right: 27.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(

                      child: Center(
                        child: Row(
                          crossAxisAlignment:CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/charlets.png',height: 13.h,width: 18.w,),
                            Text('Rccg Charlets',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14.sp,color: AppTheme.primaryColor))
                          ],),
                      ),
                      height: 70.h,width: 150.w,decoration: BoxDecoration(color:
                    AppTheme.white,borderRadius: BorderRadius.circular(10)),),
                  ),
                  Gap(14.w),
                  Expanded(
                    child: Container(
                      child: Row(

                        crossAxisAlignment:CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/bible.png',height: 13.h,width: 18.w,),
                          Text('My Bible',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14.sp,color: AppTheme.primaryColor))
                        ],),
                      height: 70.h,width: 150.w,decoration: BoxDecoration(color:
                    AppTheme.white,borderRadius: BorderRadius.circular(10)),),
                  ),
                ],
              ),
            ),
            Gap(27.h),
            Padding(
              padding:  EdgeInsets.only(left:27.w,right: 27.w),
              child: Row(
                children: [
                  Text('Rccg Programs',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.primaryColor)),
                  Spacer(),
                  GestureDetector(
                      onTap:(){
                        Navigator.pushNamed(context, RccgProgram.route);
                      },
                      child: Text('View all',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.primaryColor))),

                ],
              ),
            ),
            Gap(27.h),
            Padding(
              padding:  EdgeInsets.only(left:27.w,right: 27.w),
              child: SizedBox(
                height: 35.h,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    ProgramsChoiceButton(
                      title: 'All',index: 0,
                    ),Gap(10),ProgramsChoiceButton(  title: 'Live Programs',index: 1,),Gap(10),ProgramsChoiceButton(  title: 'Pastor EA Sermons',index: 2,),

                  ],
                ),
              ),
            ),
            Gap(34.h),

            SizedBox(
              height: 220.h,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context,index) {
                  return ProgramCard();
                }
              ),
            ),
            Gap(27.h),
            Padding(
              padding:  EdgeInsets.only(left:27.w,right: 27.w),
              child: Row(
                children: [
                  Text('Upcoming events',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.primaryColor)),
                  Spacer(),
                  Text('View all',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.primaryColor)),

                ],
              ),
            ),
            Gap(20.h),
            Container(
              width:329.w,
              height:120.h,
              padding: EdgeInsets.only(top: 12.h,left: 12.w),
              decoration: BoxDecoration(
                color:AppTheme.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 13),
                    blurRadius: 25,
                    color: Color.fromARGB(14, 14, 14, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Column(children: [
                    ClipRRect(
                        borderRadius:BorderRadius.circular(10),
                        child: Image.asset('assets/events.png',width: 88.w,height:96.h,))
                  ],),
                  Gap(11.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('April Holy Ghost Service',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.primaryColor)),
                      Gap(6.h),
                      Text('Date: 7th April 2023',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.grey3)),
                      Gap(13.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/location.png',width: 11.w,height: 16.h,),Gap(8.w),
                          Text('Redemption City',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.grey3)),
                         Gap(11.h),
                          ElevatedButton(
                            onPressed: ()async {

                            },
                            child: Text(
                              'View',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600, fontSize: 16.sp),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primaryColor,
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
            Gap(27.h),
            Padding(
              padding:  EdgeInsets.only(left:27.w,right: 27.w),
              child: Row(
                children: [
                  Text('Christian Movies',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.primaryColor)),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context,ChristianMovie.route);
                      },
                      child: Text('View all',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.primaryColor))),

                ],
              ),
            ),
            Gap(20.h),
            Padding(
              padding:  EdgeInsets.only(left:27.w,right: 27.w),
              child: SizedBox(
                height: 35.h,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    MovieChoiceButton(

                      title: 'All',index: 0,
                    ),Gap(10),MovieChoiceButton(  title: 'Mount Zion Movies',index: 1,),Gap(10),MovieChoiceButton(  title: 'Kids Christian Movie',index: 2,),

                  ],
                ),
              ),
            ),
            Gap(27.h),
            SizedBox(
              height: 220.h,
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    return MovieCard();
                  }
              ),
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}

class ProgramCard extends StatelessWidget {
  const ProgramCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right:8.0,bottom: 7.0),
      child: Container(
        padding: EdgeInsets.all(12),
        height: 100.h,width: 288.w,decoration: BoxDecoration(color: AppTheme.white, boxShadow: const [
        BoxShadow(
          offset: Offset(0, 13),
          blurRadius: 25,
          color: Color.fromARGB(14, 14, 14, 0),
        ),
      ],borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/program.png', height: 144.h,width: 266.w,),
            Gap(10.h),
            Text('Pastor EA Adeboye Sermon Rccg Holy Ghost Service',style: GoogleFonts.inter(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w400),),
          ],
        ),),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right:8.0,bottom: 7.0),
      child: Container(
        padding: EdgeInsets.all(12),
        height: 218.h,width: 288.w,decoration: const BoxDecoration(color: AppTheme.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, 13),
          blurRadius: 25,
          color: Color.fromARGB(14, 14, 14, 0),
        ),
      ],),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/movie.png', height: 144.h,width: 266.w,),
            Gap(10.h),
            Text('Pastor EA Adeboye Sermon Rccg Holy Ghost Service',style: GoogleFonts.inter(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w400),),
          ],
        ),),
    );
  // }
  // builDot() {
  //   return AnimatedSmoothIndicator(
  //     activeIndex: activeIndex,
  //     count: imageUrl.length,
  //     effect: ExpandingDotsEffect(
  //       activeDotColor: Color(0xff1CA9F8),
  //       dotHeight: 7,
  //       dotWidth: 7,
  //     ),
  //   );
  // }
}
}

class ProgramsChoiceButton extends ConsumerWidget {
  final String? title;
  final int? index;
  const ProgramsChoiceButton({
    Key? key,this.title,this.index=0
  }) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final homeController =ref.watch(homeProvider);
    return GestureDetector(
        onTap: (){
          homeController.changeCurrentProgramChoice(index!);
        },
        child: Container(decoration: BoxDecoration(color: homeController.currentProgramChoice==index?AppTheme.primaryColor:AppTheme.white,borderRadius: BorderRadius.circular(60)),child: Padding(
          padding: const EdgeInsets.only(left:24.0,right:24.0,top: 4,bottom: 4),
          child: Center(
            child: Text('$title',style:GoogleFonts.inter(color:homeController.currentProgramChoice==index?AppTheme.white:AppTheme.black)),
          ),
        ),));
  }
}


class MovieChoiceButton extends ConsumerWidget {
  final String? title;
  final int? index;
  const MovieChoiceButton({
    Key? key,this.title,this.index=0
  }) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final homeController =ref.watch(homeProvider);
    return GestureDetector(
        onTap: (){
          homeController.changeCurrentMovieChoice(index!);
        },
        child: Container(decoration: BoxDecoration(color: homeController.currentMovieChoice==index?AppTheme.primaryColor:AppTheme.white,borderRadius: BorderRadius.circular(60)),child: Padding(
          padding: const EdgeInsets.only(left:24.0,right:24.0,top: 4,bottom: 4),
          child: Center(
            child: Text('$title',style:GoogleFonts.inter(color:homeController.currentMovieChoice==index?AppTheme.white:AppTheme.black)),
          ),
        ),));
  }
}



import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../providers/all_providers.dart';
import '../../themes/app_theme.dart';
import '../../widgets/loader.dart';
import '../base/home.dart';
import '../programs/rccg_program.dart';

class DoveTv extends ConsumerStatefulWidget {
  DoveTv({this.videoItem, this.title, this.viewAll, this.videoList});

  final videoItem, title, videoList;
  final Widget? viewAll;
  @override
  ConsumerState createState() => _DoveTvState();
}

class _DoveTvState extends ConsumerState<DoveTv> {
  final videoPlayerController = VideoPlayerController.network(
    'https://streaming.viewmedia.tv/viewsatstream03/viewsatstream03.smil/playlist.m3u8',
  );
  ChewieController? chewieController;
  @override
  void initState() {
    super.initState();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
   aspectRatio: 16/9,
   allowFullScreen: false,
      autoPlay: true,
      looping: true,
      isLive: true,
    );
    chewieController?.play();
  }

  void deactivate() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //chewieController.pause();

      if (!this.mounted &&  chewieController!= null && chewieController!.isPlaying) {
        chewieController?.pause();
        // chewieController.dispose();
      }

      // Add Your Code here.
    });

    super.deactivate();
  }

  int activeIndex = 0;

  @override
  void dispose() {
    if (!this.mounted && chewieController!.isPlaying) {
      chewieController!.pause();
      chewieController!.dispose();
    }
    // Add Your Code here.

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  Widget build(BuildContext context) {

    final homeController = ref.watch(homeProvider);
    final programController = ref.watch(programProvider);
    return Container(
      child: LayoutBuilder(

        builder: (context,constraints) {
          return Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   child:
              //  Container(),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(child: Container(
                      width: double.infinity,
                      child: Chewie(controller: chewieController!))),
                    Expanded(flex: 2, child: SizedBox()),
                  ],
                ),
              ),

              ListView(
                //  mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height:200),
                  Container(
                      padding: EdgeInsets.only(left: 5, right: 7),
                     // height:100,
                      width: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/dove_tv.png',
                                  height: 38.h,
                                  width: 38.w,
                                ),
                                SizedBox(width: 40),
                                Flexible(
                                  child: Text(
                                    'Dove Television Broadcast',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,fontSize: 12,

                                      //   fontSize: AdaptiveTextSize()
                                      //     .getAdaptiveTextSize(context, 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              'World Dove Media is a Christian family entertainment multimedia company with a focus to develop life changing media products on all platforms including satellite, cable, free to air',
                              style: TextStyle(height: 1.5, fontSize:12,
                  ),
                            ),
                            Gap(20.h),
                            Padding(
                              padding:  EdgeInsets.only(left:27.w,right: 27.w),
                              child: Row(
                                children: [
                                  Text('Rccg Programs',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: LightAppTheme.primaryColor)),
                                  Spacer(),
                                  GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, RccgProgram.route);
                                      },
                                      child: Text('View all',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: LightAppTheme.primaryColor))),

                                ],
                              ),
                            ),
                            Gap(27.h),
                            Padding(
                              padding:  EdgeInsets.only(left:2.w,right: 2.w),
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
                            if(programController.load)
                              Indicator(),

                            if (programController.conventionVideoModel!=null)
                              Visibility(
                                visible:
                                homeController.currentProgramChoice == 5 ? true : false,
                                child: SizedBox(
                                  height: 220.h,
                                  child:ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: programController.conventionVideoModel!.videoDetails!.length,
                                      padding: EdgeInsets.zero,
                                      //itemExtent: 0,

                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL


                                          ProgramCard(
                                            videoUrlList: programController.conventionVideoModel!.videoDetails!,
                                            title:programController.conventionVideoModel!.videoDetails![index].snippet!.title,
                                            videoUrl:programController.conventionVideoModel!.videoDetails![index].id!
                                                .videoId,
                                            imageUrl:
                                            programController.conventionVideoModel!.videoDetails![index].snippet!.thumbnails!.medium!.url,
                                          );

                                      }),
                                ),
                              ),



                            if (programController.congressVideoModel!=null)
                              Visibility(
                                visible:
                                homeController.currentProgramChoice == 6 ? true : false,
                                child: SizedBox(
                                  height: 220.h,
                                  child:ListView.builder(
                                      itemCount: programController.congressVideoModel!.videoDetails!.length,
                                      padding: EdgeInsets.zero,
                                      //itemExtent: 0,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL

                                          ProgramCard(
                                            videoUrlList: programController.congressVideoModel!.videoDetails!,
                                            title:programController.congressVideoModel!.videoDetails![index].snippet!.title,
                                            videoUrl:programController.congressVideoModel!.videoDetails![index].id!
                                                .videoId,
                                            imageUrl:
                                            programController.congressVideoModel!.videoDetails![index].snippet!.thumbnails!.medium!.url,
                                          );

                                      }),
                                ),
                              ),



                            if (programController.rccgProgramModel!=null)
                              Visibility(
                                visible:
                                homeController.currentProgramChoice == 0 ? true : false,
                                child: SizedBox(
                                  height: 220.h,
                                  child:ListView.builder(
                                      itemCount: programController
                                          .rccgProgramModel!.videoDetails!.length,
                                      padding: EdgeInsets.zero,
                                      //itemExtent: 0,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                                          ProgramCard(
                                            videoUrlList:programController
                                                .rccgProgramModel!.videoDetails ,
                                            title:programController
                                                .rccgProgramModel!.videoDetails![index].snippet!.title,
                                            videoUrl:programController
                                                .rccgProgramModel!.videoDetails![index].snippet!.resourceId!.videoId,
                                            imageUrl:
                                            programController
                                                .rccgProgramModel!.videoDetails![index].snippet!.thumbnails!.medium!.url,
                                          );

                                      }),
                                ),
                              ),


                            if (programController.psfVideosList!=null)
                              Visibility(
                                visible:
                                homeController.currentProgramChoice == 7 ? true : false,
                                child: SizedBox(
                                  height: 220.h,
                                  child: ListView.builder(

                                      itemCount: programController.psfVideosList!.videoDetails!.length,
                                      padding: EdgeInsets.zero,
                                      //itemExtent: 0,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                                          ProgramCard(
                                            videoUrlList:  programController.psfVideosList!.videoDetails,
                                            title:programController.psfVideosList!.videoDetails![index].snippet!.title,
                                            videoUrl:programController.psfVideosList!.videoDetails![index].snippet!.resourceId!.videoId,
                                            imageUrl:
                                            programController.psfVideosList!.videoDetails![index].snippet!.thumbnails!.medium!.url,
                                          );

                                      }),
                                ),
                              ),
                            if (programController.mmpVideosList!=null)
                              Visibility(
                                visible:
                                homeController.currentProgramChoice == 9 ? true : false,
                                child: SizedBox(
                                  height: 220.h,
                                  child: ListView.builder(
                                      itemCount: programController.mmpVideosList!.videoDetails!.length,
                                      padding: EdgeInsets.zero,
                                      //itemExtent: 0,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL


                                          ProgramCard(
                                            videoUrlList: programController.mmpVideosList!.videoDetails ,
                                            title:programController.mmpVideosList!.videoDetails![index].mmpsnippet!.title,
                                            videoUrl: programController.mmpVideosList!.videoDetails![index].mmpsnippet!.resourceId!.videoId,
                                            imageUrl:
                                            programController.mmpVideosList!.videoDetails![index].mmpsnippet!.thumbnails!.medium!.url,
                                          );

                                      }),
                                ),
                              ),
                            if (programController.pAdeboyeSermonModel != null)
                              Visibility(
                                visible:
                                homeController.currentProgramChoice == 2 ? true : false,
                                child:  SizedBox(
                                  height: 220.h,
                                  child:ListView.builder(
                                      itemCount: programController
                                          .pAdeboyeSermonModel!.videoDetails!.length,
                                      padding: EdgeInsets.zero,
                                      //itemExtent: 0,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                                          ProgramCard(
                                            videoUrlList:programController
                                                .pAdeboyeSermonModel!.videoDetails ,
                                            title:programController
                                                .pAdeboyeSermonModel!.videoDetails![index].snippet!.title,
                                            videoUrl: programController
                                                .pAdeboyeSermonModel!.videoDetails![index].snippet!.resourceId!.videoId,
                                            imageUrl:
                                            programController
                                                .pAdeboyeSermonModel!.videoDetails![index].snippet!.thumbnails!.medium!.url,
                                          );

                                      }),
                                ),
                              ),
                            if (programController.holyGhostServiceModel != null)
                              Visibility(
                                visible:
                                homeController.currentProgramChoice == 4 ? true : false,
                                child: SizedBox(
                                  height: 220.h,
                                  child:ListView.builder(
                                      itemCount: programController
                                          .holyGhostServiceModel!.videoDetails!.length,
                                      padding: EdgeInsets.zero,
                                      //itemExtent: 0,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                                          ProgramCard(
                                            videoUrlList: programController
                                                .holyGhostServiceModel!.videoDetails ,
                                            title:programController
                                                .holyGhostServiceModel!.videoDetails![index].snippet!.title,
                                            videoUrl: programController
                                                .holyGhostServiceModel!.videoDetails![index].snippet!.resourceId!.videoId,
                                            imageUrl:
                                            programController
                                                .holyGhostServiceModel!.videoDetails![index].snippet!.thumbnails!.medium!.url,
                                          );

                                      }),
                                ),
                              ),


                            if (programController.faSermonsModel != null)
                              Visibility(
                                visible:
                                homeController.currentProgramChoice == 3 ? true : false,
                                child: SizedBox(
                                  height: 220.h,
                                  child:ListView.builder(
                                      itemCount: programController.faSermonsModel!.videoDetails!.length,
                                      padding: EdgeInsets.zero,
                                      //itemExtent: 0,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                                          ProgramCard(
                                            videoUrlList: programController.faSermonsModel!.videoDetails,
                                            title:programController.faSermonsModel!.videoDetails![index].snippet!.title,
                                            videoUrl: programController.faSermonsModel!.videoDetails![index].id!.videoId,
                                            imageUrl:
                                            programController.faSermonsModel!.videoDetails![index].snippet!.thumbnails!.medium!.url,
                                          );

                                      }),
                                ),
                              ),


                            if (programController.youthConventionModel != null)
                              Visibility(
                                visible:
                                homeController.currentProgramChoice == 8 ? true : false,
                                child: SizedBox(
                                  height: 220.h,
                                  child: ListView.builder(
                                      itemCount: programController
                                          .youthConventionModel!.videoDetails!.length,
                                      padding: EdgeInsets.zero,
                                      //itemExtent: 0,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                                          ProgramCard(
                                            videoUrlList:programController
                                                .youthConventionModel!.videoDetails,
                                            title: programController
                                                .youthConventionModel!.videoDetails![index].snippet!.title,
                                            videoUrl: programController
                                                .youthConventionModel!.videoDetails![index].snippet!.resourceId!.videoId,
                                            imageUrl:
                                            programController
                                                .youthConventionModel!.videoDetails![index].snippet!.thumbnails!.medium!.url,
                                          );
                                        // YouthConventionProgramCard(
                                        //   youthConventionVideoItem: programController
                                        //       .youthConventionModel!.items![index],
                                        // );
                                      }),
                                ),
                              ),
                            Gap(27.h),
                            Gap(50.h),
                          ],
                        ),
                      )),

                ],
              ),
            ],
          );
        }
      ),
    );
  }

  // builDot() {
  //   return AnimatedSmoothIndicator(
  //     activeIndex: activeIndex,
  //     count: 3,
  //     effect: ExpandingDotsEffect(
  //       activeDotColor: Color(0xff1CA9F8),
  //       dotHeight: 6,
  //       dotWidth: 6,
  //     ),
  //   );
  // }
}
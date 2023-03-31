

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../themes/app_theme.dart';
import '../base/home.dart';

class DoveTv extends StatefulWidget {
  DoveTv({this.videoItem, this.title, this.viewAll, this.videoList});

  final videoItem, title, videoList;
  final Widget? viewAll;
  @override
  _DoveTvState createState() => _DoveTvState();
}

class _DoveTvState extends State<DoveTv> {
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
                                  Text('Rccg Programs',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.primaryColor)),
                                  Spacer(),
                                  Text('View all',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.primaryColor)),

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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../models/rccg_program_model.dart';
import '../../themes/app_theme.dart';

class WatchPrograms extends ConsumerStatefulWidget {
  static const route ='watch programs';
  final RccgProgramVideoItem?rccgProgramModel;
  const WatchPrograms({
    Key? key,this.rccgProgramModel
  }) : super(key: key);

  @override
  ConsumerState createState() => _WatchProgramsState();
}

class _WatchProgramsState extends ConsumerState<WatchPrograms> {
  YoutubePlayerController? _controller;
  bool? _isPlayerReady;
  @override
  void initState() {
    super.initState();
    _isPlayerReady = true;
    _controller = YoutubePlayerController(
        initialVideoId: widget.rccgProgramModel!.videoDetails!.resourceId!.videoId.toString(),
        flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
        ))
      ..addListener(() {
        void _listener() {
          if (_isPlayerReady!=null&&_isPlayerReady! && mounted! && !_controller!.value.isFullScreen) {}
        }

        _listener();
      });
  }

  @override
  void deactivate() {
    _controller!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller!.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  bool fullScreen = false;
  @override
  Widget build(BuildContext context) {
    print(widget.rccgProgramModel!.videoDetails!.resourceId!.videoId.toString());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppTheme.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Christian Movies',
                style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.black2))),
        body: Column(
          children: [
            YoutubePlayer(
              controller: _controller!,
              showVideoProgressIndicator: true,
              controlsTimeOut: Duration(seconds: 10),
              onReady: () {
                print('Player is ready');
                _isPlayerReady = true;
              },
            ),
            // Container(
            //   height: 281.h,
            //  // width: 376.w,
            //   decoration: const BoxDecoration(
            //       color: AppTheme.white,
            //       borderRadius: BorderRadius.only(
            //           bottomRight: Radius.circular(20),
            //           bottomLeft: Radius.circular(20))),
            //   child: Column(
            //     children: [
            //       Image.asset('assets/program_pic.png',
            //           width: 376.w, height: 206.h,fit: BoxFit.fill,),
            //       Gap(15.h),
            //       Row(
            //         children: [
            //           Padding(
            //             padding:  EdgeInsets.only(left:27.w,),
            //             child: Image.asset('assets/movie_pic.png', height: 35.h, width: 35.w),
            //           ),
            //           Gap(5.h),
            //           Expanded(
            //             child: Text('Enoch | A Biopic of Pastor E.A. Adeboye',  style: GoogleFonts.inter(
            //                 fontWeight: FontWeight.w500, fontSize: 14.sp,color: AppTheme.black2),),
            //           ),
            //           Gap(10.w),
            //           Text('Share',  style: GoogleFonts.inter(
            //               fontWeight: FontWeight.w400, fontSize: 14.sp,color: AppTheme.black2),), Gap(10.w),
            //           Image.asset('assets/share.png',width: 19.w,height: 16.h,),
            //           Gap(10.w),
            //         ],
            //       ),
            //
            //     ],
            //   ),
            // ),
            Gap(27.h),
            Padding(
              padding:  EdgeInsets.only(left:27.w,right: 27.w),
              child: Row(
                children: [
                  Text('More Rccg Programs',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.black2)),
                  Spacer(),
                  GestureDetector(
                      onTap: (){

                      },
                      child: Text('View all',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.black2))),

                ],
              ),
            ),
            Gap(33.h),
            GestureDetector(
              onTap:
              (){
                print('ll');
                // _controller = YoutubePlayerController(
                //     initialVideoId: 'hQIA-f0hprY',
                //     flags: YoutubePlayerFlags(
                //       mute: false,
                //       autoPlay: true,
                //     ))
                //   ..addListener(() {
                //     void _listener() {
                //       if (_isPlayerReady!=null&&_isPlayerReady! && mounted! && !_controller!.value.isFullScreen) {}
                //     }
                //     setState(() {
                //
                //     });
                //
                //     _listener();
                //   });

                  _controller!.load('hQIA-f0hprY');
                _controller?.play();
                print(_controller!.initialVideoId);
                //_controller?.reset();


                setState(() {

                });
              },
              child: Container(
                height: 108.h,
                padding: EdgeInsets.only(top: 10,bottom: 15,right: 15,left: 15),
                width: 375.w,
                decoration: BoxDecoration(
                  color: AppTheme.white
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/program.png',width: 136.w,height: 80.h,)
                      ],
                    ),
                    Gap(19.w),
                    Column(
                      children: [
                        Text('April Holy Ghost...',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.black2)),
                        Gap(16.h),
                        Container(
                          height: 36.h,
                          width: 126.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                              border: Border.all(color:AppTheme.grey4)
                          ),
                          child: Center(child: Text('Watch Program',style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12.sp,color: AppTheme.black2))),
                        )
                      ],
                    )
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

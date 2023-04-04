import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/models/rccg_movie_search_model.dart';
import 'package:rccg_app/providers/all_providers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../themes/app_theme.dart';

class WatchMovies extends ConsumerStatefulWidget {

  static const route = 'watch movie';

  final SearchVideoDetails? searchVideoDetails;
  final VideoId? videoId;
  const WatchMovies({
    Key? key,this.searchVideoDetails,this.videoId
  }) : super(key: key);

  @override
  ConsumerState createState() => _WatchMoviesState();
}

class _WatchMoviesState extends ConsumerState<WatchMovies> {
  YoutubePlayerController? _controller;
  bool? _isPlayerReady;
  @override
  void initState() {
    super.initState();
    _isPlayerReady = true;
    _controller = YoutubePlayerController(
        initialVideoId: widget!.videoId!.videoUrl.toString(),
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
    final programController = ref.watch(programProvider);
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color:  LightAppTheme.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Christian Movies',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color:  LightAppTheme.black2))),
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
          Gap(27.h),
           Padding(
            padding:  EdgeInsets.only(left:27.w,right: 27.w),
            child: Row(
              children: [
                Text('More Mount Zion Movies',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: LightAppTheme.black2)),
                Spacer(),
                GestureDetector(
                    onTap: (){

                    },
                    child: Text('View all',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color:  LightAppTheme.black2))),

              ],
            ),
          ),  Gap(33.h),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: programController.christianMovieModel!.videos!.length,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 108.h,
                    padding: EdgeInsets.only(top: 10,bottom: 15,right: 15,left: 15),
                    width: 375.w,
                    decoration: BoxDecoration(
                        color:  LightAppTheme.white
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            CachedNetworkImage(imageUrl: programController.christianMovieModel!.videos![index].videoDetails!.thumbnails!.medium!.url.toString()
                              ,
                              width: 136.w, height: 80.h,fit: BoxFit.cover,),
                          ],
                        ),
                        Gap(19.w),
                        Column(
                          children: [
                            SizedBox(
                                width:199.w,
                                child: Text('${programController.christianMovieModel!.videos![index].videoDetails!.title}',maxLines:2,softWrap: true, overflow: TextOverflow.clip,style: GoogleFonts.inter(fontSize: 10),)),

                            Gap(16.h),
                            GestureDetector(
                              onTap:(){
                                _controller!.load(programController.christianMovieModel!.videos![index].id!.videoUrl.toString());
                                _controller?.play();
                                print(programController.christianMovieModel!.videos![index].id,);
                                //_controller?.reset();


                                setState(() {

                                });
                },
                              child: Container(
                                height: 36.h,
                                width: 126.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    border: Border.all(color: LightAppTheme.grey4)
                                ),
                                child: const Center(child: Text('Watch Movie')),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../models/rccg_program_model.dart';
import '../../themes/app_theme.dart';

class AllVideoPlayer extends StatefulWidget {
static const route = 'all video player';

  final RccgProgramVideoItem?rccgProgramModel;

  const AllVideoPlayer(
      {this.rccgProgramModel});

  //final videoItem, title, videoList, image, desc;

  @override
  _AllVideoPlayerState createState() => _AllVideoPlayerState();
}

class _AllVideoPlayerState extends State<AllVideoPlayer> {
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
    double height = MediaQuery.of(context).size.height;
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.rccgProgramModel!.videoDetails!.title.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: AppTheme.primaryColor,
            ),
            body: Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   child:
                Container(),
                YoutubePlayer(
                  controller: _controller!,
                  showVideoProgressIndicator: true,
                  controlsTimeOut: Duration(seconds: 10),
                  onReady: () {
                    print('Player is ready');
                    _isPlayerReady = true;
                  },
                ),

                Column(
                  //  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(),
                    Container(
                        height: 500,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //   shrinkWrap: true,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        'assets/${widget.rccgProgramModel!.videoDetails!.thumbnails!.medium!.url}',
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        '${widget.rccgProgramModel!.videoDetails!.title}',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          //   fontSize: AdaptiveTextSize()
                                          //     .getAdaptiveTextSize(context, 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${widget.rccgProgramModel!.videoDetails!.description}'),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Next Videos',
                                          style: GoogleFonts.inter()),
                                      GestureDetector(
                                        onTap: () {
                                          // Get.offAndToNamed(
                                          //     '${widget.rccgProgramModel!.videoDetails!.}');
                                          //(() => widget.viewAll);
                                        },
                                        child: Text(
                                          'View all',
                                          style: GoogleFonts.inter(
                                            color:AppTheme.primaryColor,
                                          ),
                                        ),
                                      ),
                                      //  SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                                // widget.videoList,
                              ],
                            ),
                          ),
                        )),
                  ],
                ),

                //),
                // YoutubePlayerBuilder(
                //     onEnterFullScreen: ()=>fullScreen = true,
                //     onExitFullScreen: ()=>fullScreen = false,

                //   )
              ],
            ),
          );
        }
        return Scaffold(
          resizeToAvoidBottomInset: true,
          // appBar: AppBar(
          //   title: Text(widget.videoItem.allvideo.title),
          //   backgroundColor: videoPageAppBarColor,
          // ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: buildPlayer(),
              ),
              // Container(
              //   child:

              //   YoutubePlayer(

              //     controller: _controller,
              //     showVideoProgressIndicator: true,
              //     controlsTimeOut: Duration(seconds: 10),
              //     onReady: () {
              //       print('Player is ready');
              //       _isPlayerReady = true;
              //     },
              //   ),
              // ),
              // YoutubePlayerBuilder(
              //     onEnterFullScreen: ()=>fullScreen = true,
              //     onExitFullScreen: ()=>fullScreen = false,

              //   )
            ],
          ),
        );
      },
    );
  }

  buildPlayer() {
    return YoutubePlayerBuilder(
      onEnterFullScreen: () => fullScreen = true,
      onExitFullScreen: () => fullScreen = false,
      player: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        controlsTimeOut: Duration(seconds: 10),
        onReady: () {
          print('Player is ready');
          _isPlayerReady = true;
        },
      ),
      builder: (context, player) {
        return Column(
          children: [
            //  Text('play'),
            player,
          ],
        );
      },
    );
  }
}

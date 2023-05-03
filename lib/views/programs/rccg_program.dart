import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/providers/all_providers.dart';
import 'package:rccg_app/views/watch_programs/watch_church_programs.dart';
import 'package:rccg_app/views/watch_programs/watch_movies.dart';
import 'package:rccg_app/widgets/loader.dart';

import '../../themes/app_theme.dart';
import '../../widgets/text_fields.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../watch_programs/all_video_player.dart';

class RccgProgram extends ConsumerStatefulWidget {
  static const route = 'rccg program';
  const RccgProgram({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _RccgProgramState();
}

class _RccgProgramState extends ConsumerState<RccgProgram> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final programController = ref.read(programProvider);
    // Future(() {
    //   programController.getRccgProgramChannelInfo();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final homeController = ref.watch(homeProvider);
    final programController = ref.watch(programProvider);

    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: LightAppTheme.black,
            ),
            onPressed: () {
              Navigator.pop(context);
              homeController.changeCurrentProgramChoice(0);
            },
          ),
          title: Text('RCCG Programs',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: LightAppTheme.black2))),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 23.w, right: 23.w),
          child: SizedBox(
              height: 45,
              child: AppTextField(
                controller: programController.programSearchController,
                onTap: (String query) {
                  // searchVideo(String query) {
                  if (homeController.currentProgramChoice == 0) {
                    final videos = programController
                        .rccgProgramModel!.videoDetails!
                        .where((video) {
                      final titleLower = video.snippet!.title!.toLowerCase();
                      final searchLower = query.toLowerCase();
                      return titleLower!.contains(searchLower);
                    }).toList();
                    setState(() {
                      if (query.isEmpty) {
                        programController.loadProgramVideos();
                      } else {
                        programController.getSearchedProgramDetails(videos);
                      }
                    });
                  }
                  if (homeController.currentProgramChoice == 2) {
                    final videos = programController
                        .pAdeboyeSermonModel!.videoDetails!
                        .where((video) {
                      final titleLower = video.snippet!.title!.toLowerCase();
                      final searchLower = query.toLowerCase();
                      return titleLower!.contains(searchLower);
                    }).toList();
                    setState(() {
                      if (query.isEmpty) {
                        programController.loadAdeboyeSermons();
                      } else {
                        programController.getSearchedPASermons(videos);
                      }
                    });
                  }
                  if (homeController.currentProgramChoice == 3) {
                    final videos = programController
                        .faSermonsModel!.videoDetails!
                        .where((video) {
                      final titleLower = video.snippet!.title!.toLowerCase();
                      final searchLower = query.toLowerCase();
                      return titleLower!.contains(searchLower);
                    }).toList();
                    setState(() {
                      if (query.isEmpty) {
                        programController.loadFaSermons();
                      } else {
                        programController.getSearchedMFaSermons(videos);
                      }
                    });
                  }
                  if (homeController.currentProgramChoice == 4) {
                    final videos = programController
                        .holyGhostServiceModel!.videoDetails!
                        .where((video) {
                      final titleLower = video.snippet!.title!.toLowerCase();
                      final searchLower = query.toLowerCase();
                      return titleLower!.contains(searchLower);
                    }).toList();
                    setState(() {
                      if (query.isEmpty) {
                        programController.loadHolyGhostService();
                      } else {
                        programController.getSearchedHHolyGhostDetails(videos);
                      }
                    });
                  }

                  if (homeController.currentProgramChoice == 5) {
                    final videos = programController
                        .conventionVideoModel!.videoDetails!
                        .where((video) {
                      final titleLower = video.snippet!.title!.toLowerCase();
                      final searchLower = query.toLowerCase();
                      return titleLower!.contains(searchLower);
                    }).toList();
                    setState(() {
                      if (query.isEmpty) {
                        programController.loadConventionVideos();
                      } else {
                        programController.getSearchedConventionDetails(videos);
                      }
                    });
                  }
                  if (homeController.currentProgramChoice == 6) {
                    final videos = programController
                        .congressVideoModel!.videoDetails!
                        .where((video) {
                      final titleLower = video.snippet!.title!.toLowerCase();
                      final searchLower = query.toLowerCase();
                      return titleLower!.contains(searchLower);
                    }).toList();
                    setState(() {
                      if (query.isEmpty) {
                        programController.loadCongressVideos();
                      } else {
                        programController.getSearchedCongressDetails(videos);
                      }
                    });
                  }
                  if (homeController.currentProgramChoice == 7) {
                    final videos = programController
                        .psfVideosList!.videoDetails!
                        .where((video) {
                      final titleLower = video.snippet!.title!.toLowerCase();
                      final searchLower = query.toLowerCase();
                      return titleLower!.contains(searchLower);
                    }).toList();
                    setState(() {
                      if (query.isEmpty) {
                        programController.loadPsfVideos();
                      } else {
                        programController.getSearchedPsfDetails(videos);
                      }
                    });
                  }
                  if (homeController.currentProgramChoice == 8) {
                    final videos = programController
                        .youthConventionModel!.videoDetails!
                        .where((video) {
                      final titleLower = video.snippet!.title!.toLowerCase();
                      final searchLower = query.toLowerCase();
                      return titleLower!.contains(searchLower);
                    }).toList();
                    setState(() {
                      if (query.isEmpty) {
                        programController.loadYouthConvention();
                      } else {
                        programController.getSearchedYouthDetails(videos);
                      }
                    });
                  }
                  if (homeController.currentProgramChoice == 9) {
                    final videos = programController
                        .psfVideosList!.videoDetails!
                        .where((video) {
                      final titleLower = video.snippet!.title!.toLowerCase();
                      final searchLower = query.toLowerCase();
                      return titleLower!.contains(searchLower);
                    }).toList();
                    setState(() {
                      if (query.isEmpty) {
                        programController.loadPsfVideos();
                      } else {
                        programController.getSearchedPsfDetails(videos);
                      }
                    });
                  }
                },
                hintText: 'Search for a RCCG Program',
                prefixIcon: Icon(Icons.search, color: LightAppTheme.black),
                backGroundColor: LightAppTheme.white,
                borderColor: LightAppTheme.white6,
              )),
        ),
        Gap(27.h),
        Padding(
          padding: EdgeInsets.only(left: 27.w, right: 27.w),
          child: SizedBox(
            height: 35.h,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ProgramsViewChoiceButton(
                  title: 'All',
                  index: 0,
                ),
                Gap(10),
                ProgramsViewChoiceButton(
                  title: 'Live Programs',
                  index: 1,
                ),
                Gap(10),
                ProgramsViewChoiceButton(
                  title: 'Pastor EA Sermons',
                  index: 2,
                ),
                const Gap(10),
                const ProgramsViewChoiceButton(
                  title: 'Pastor Mrs FA Sermons',
                  index: 3,
                ),
                const Gap(10),
                const ProgramsViewChoiceButton(
                  title: 'Holy Ghost Service',
                  index: 4,
                ),
                const Gap(10),
                const ProgramsViewChoiceButton(
                  title: 'Convention',
                  index: 5,
                ),
                const Gap(10),
                const ProgramsViewChoiceButton(
                  title: 'Congress',
                  index: 6,
                ),
                const Gap(10),
                const ProgramsViewChoiceButton(
                  title: 'Psf Programs',
                  index: 7,
                ),
                const Gap(10),
                const ProgramsViewChoiceButton(
                  title: 'RCCG Youths',
                  index: 8,
                ),
                const Gap(10),
                const ProgramsViewChoiceButton(
                  title: 'RCCG MMP',
                  index: 9,
                ),
                const Gap(10),
              ],
            ),
          ),
        ),
        Gap(39.h),
        // programController.load
        //     ? Indicator()
        //     : Expanded(
        //         child: programController.rccgProgramModel == null
        //             ? SizedBox()
        //             : ListView.builder(
        //                 itemCount:
        //                     programController.rccgProgramModel?.videos?.length,
        //                 shrinkWrap: true,
        //                 itemBuilder: (context, index) {
        //                   return GestureDetector(
        //                     onTap: () {
        //                       Navigator.push(context,
        //                           MaterialPageRoute(builder: (context) {
        //                         return WatchPrograms(
        //                           rccgProgramModel: programController
        //                               .rccgProgramModel?.videos![index],
        //                         );
        //                       }));
        //                     },
        //                     child: Padding(
        //                       padding:
        //                           const EdgeInsets.only(bottom: 20, top: 20),
        //                       child: Container(
        //                         height: 281.h,
        //                         width: 376.w,
        //                         decoration: const BoxDecoration(
        //                             color: LightAppTheme.white,
        //                             borderRadius: BorderRadius.only(
        //                                 bottomRight: Radius.circular(20),
        //                                 bottomLeft: Radius.circular(20))),
        //                         child: Column(
        //                           children: [
        //                             CachedNetworkImage(
        //                               imageUrl: programController
        //                                   .rccgProgramModel!
        //                                   .videos![index]
        //                                   .videoDetails!
        //                                   .thumbnails!
        //                                   .medium!
        //                                   .url
        //                                   .toString(),
        //                               width: 397.w,
        //                               height: 207.h,
        //                               fit: BoxFit.cover,
        //                             ),
        //                             Gap(15.h),
        //                             Row(
        //                               children: [
        //                                 Padding(
        //                                   padding: EdgeInsets.only(
        //                                     left: 27.w,
        //                                   ),
        //                                   child: Image.asset(
        //                                       'assets/app_logo.png',
        //                                       height: 35.h,
        //                                       width: 35.w),
        //                                 ),
        //                                 Gap(5.h),
        //                                 Expanded(
        //                                   child: Text(
        //                                       '${programController.rccgProgramModel?.videos?[index].videoDetails?.title}'),
        //                                 ),
        //                               ],
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   );
        //                 }),
        //       )
        if (programController.load) Indicator(),

        if (programController.conventionVideoModel != null)
          Visibility(
            visible: homeController.currentProgramChoice == 5 ? true : false,
            child: Expanded(
              //  height: 235.h,
              child: ListView.builder(
                  itemCount: programController
                      .conventionVideoModel!.videoDetails!.length,
                  padding: EdgeInsets.zero,
                  //itemExtent: 0,

                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL

                        ProgramViewCard(
                      videoUrlList:
                          programController.conventionVideoModel!.videoDetails!,
                      title: programController.conventionVideoModel!
                          .videoDetails![index].snippet!.title,
                      videoUrl: programController.conventionVideoModel!
                          .videoDetails![index].id!.videoId,
                      imageUrl: programController
                          .conventionVideoModel!
                          .videoDetails![index]
                          .snippet!
                          .thumbnails!
                          .medium!
                          .url,
                    );
                  }),
            ),
          ),

        if (programController.congressVideoModel != null)
          Visibility(
            visible: homeController.currentProgramChoice == 6 ? true : false,
            child: Expanded(
              //   height: 235.h,
              child: ListView.builder(
                  itemCount: programController
                      .congressVideoModel!.videoDetails!.length,
                  padding: EdgeInsets.zero,
                  //itemExtent: 0,
                  //   scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL

                        ProgramViewCard(
                      videoUrlList:
                          programController.congressVideoModel!.videoDetails!,
                      title: programController.congressVideoModel!
                          .videoDetails![index].snippet!.title,
                      videoUrl: programController
                          .congressVideoModel!.videoDetails![index].id!.videoId,
                      imageUrl: programController
                          .congressVideoModel!
                          .videoDetails![index]
                          .snippet!
                          .thumbnails!
                          .medium!
                          .url,
                    );
                  }),
            ),
          ),

        if (programController.rccgProgramModel != null)
          Visibility(
            visible: homeController.currentProgramChoice == 0 ? true : false,
            child: Expanded(
              child: ListView.builder(
                  itemCount:
                      programController.rccgProgramModel!.videoDetails!.length,
                  padding: EdgeInsets.zero,
                  //itemExtent: 0,
                  //   scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                        ProgramViewCard(
                      videoUrlList:
                          programController.rccgProgramModel!.videoDetails,
                      title: programController.rccgProgramModel!
                          .videoDetails![index].snippet!.title,
                      videoUrl: programController.rccgProgramModel!
                          .videoDetails![index].snippet!.resourceId!.videoId,
                      imageUrl: programController
                          .rccgProgramModel!
                          .videoDetails![index]
                          .snippet!
                          .thumbnails!
                          .medium!
                          .url,
                    );
                  }),
            ),
          ),

        if (programController.psfVideosList != null)
          Visibility(
            visible: homeController.currentProgramChoice == 7 ? true : false,
            child: Expanded(
              child: ListView.builder(
                  itemCount:
                      programController.psfVideosList!.videoDetails!.length,
                  padding: EdgeInsets.zero,
                  //itemExtent: 0,

                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                        ProgramViewCard(
                      videoUrlList:
                          programController.psfVideosList!.videoDetails,
                      title: programController
                          .psfVideosList!.videoDetails![index].snippet!.title,
                      videoUrl: programController.psfVideosList!
                          .videoDetails![index].snippet!.resourceId!.videoId,
                      imageUrl: programController
                          .psfVideosList!
                          .videoDetails![index]
                          .snippet!
                          .thumbnails!
                          .medium!
                          .url,
                    );
                  }),
            ),
          ),
        if (programController.mmpVideosList != null)
          Visibility(
            visible: homeController.currentProgramChoice == 9 ? true : false,
            child: Expanded(
              child: ListView.builder(
                  itemCount:
                      programController.mmpVideosList!.videoDetails!.length,
                  padding: EdgeInsets.zero,
                  //itemExtent: 0,

                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL

                        ProgramViewCard(
                      videoUrlList:
                          programController.mmpVideosList!.videoDetails,
                      title: programController.mmpVideosList!
                          .videoDetails![index].mmpsnippet!.title,
                      videoUrl: programController.mmpVideosList!
                          .videoDetails![index].mmpsnippet!.resourceId!.videoId,
                      imageUrl: programController
                          .mmpVideosList!
                          .videoDetails![index]
                          .mmpsnippet!
                          .thumbnails!
                          .medium!
                          .url,
                    );
                  }),
            ),
          ),
        if (programController.pAdeboyeSermonModel != null)
          Visibility(
            visible: homeController.currentProgramChoice == 2 ? true : false,
            child: Expanded(
              child: ListView.builder(
                  itemCount: programController
                      .pAdeboyeSermonModel!.videoDetails!.length,
                  padding: EdgeInsets.zero,
                  //itemExtent: 0,

                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                        ProgramViewCard(
                      videoUrlList:
                          programController.pAdeboyeSermonModel!.videoDetails,
                      title: programController.pAdeboyeSermonModel!
                          .videoDetails![index].snippet!.title,
                      videoUrl: programController.pAdeboyeSermonModel!
                          .videoDetails![index].snippet!.resourceId!.videoId,
                      imageUrl: programController
                          .pAdeboyeSermonModel!
                          .videoDetails![index]
                          .snippet!
                          .thumbnails!
                          .medium!
                          .url,
                    );
                  }),
            ),
          ),
        if (programController.holyGhostServiceModel != null)
          Visibility(
            visible: homeController.currentProgramChoice == 4 ? true : false,
            child: Expanded(
              child: ListView.builder(
                  itemCount: programController
                      .holyGhostServiceModel!.videoDetails!.length,
                  padding: EdgeInsets.zero,
                  //itemExtent: 0,

                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                        ProgramViewCard(
                      videoUrlList:
                          programController.holyGhostServiceModel!.videoDetails,
                      title: programController.holyGhostServiceModel!
                          .videoDetails![index].snippet!.title,
                      videoUrl: programController.holyGhostServiceModel!
                          .videoDetails![index].snippet!.resourceId!.videoId,
                      imageUrl: programController
                          .holyGhostServiceModel!
                          .videoDetails![index]
                          .snippet!
                          .thumbnails!
                          .medium!
                          .url,
                    );
                  }),
            ),
          ),

        if (programController.faSermonsModel != null)
          Visibility(
            visible: homeController.currentProgramChoice == 3 ? true : false,
            child: Expanded(
              child: ListView.builder(
                  itemCount:
                      programController.faSermonsModel!.videoDetails!.length,
                  padding: EdgeInsets.zero,
                  //itemExtent: 0,

                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                        ProgramViewCard(
                      videoUrlList:
                          programController.faSermonsModel!.videoDetails,
                      title: programController
                          .faSermonsModel!.videoDetails![index].snippet!.title,
                      videoUrl: programController
                          .faSermonsModel!.videoDetails![index].id!.videoId,
                      imageUrl: programController
                          .faSermonsModel!
                          .videoDetails![index]
                          .snippet!
                          .thumbnails!
                          .medium!
                          .url,
                    );
                  }),
            ),
          ),

        if (programController.youthConventionModel != null)
          Visibility(
            visible: homeController.currentProgramChoice == 8 ? true : false,
            child: Expanded(
              child: ListView.builder(
                  itemCount: programController
                      .youthConventionModel!.videoDetails!.length,
                  padding: EdgeInsets.zero,
                  //itemExtent: 0,

                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return // Figma Flutter Generator ItemcardproductWidget - FRAME - VERTICAL
                        ProgramViewCard(
                      videoUrlList:
                          programController.youthConventionModel!.videoDetails,
                      title: programController.youthConventionModel!
                          .videoDetails![index].snippet!.title,
                      videoUrl: programController.youthConventionModel!
                          .videoDetails![index].snippet!.resourceId!.videoId,
                      imageUrl: programController
                          .youthConventionModel!
                          .videoDetails![index]
                          .snippet!
                          .thumbnails!
                          .medium!
                          .url,
                    );
                    // YouthConventionProgramCard(
                    //   youthConventionVideoItem: programController
                    //       .youthConventionModel!.items![index],
                    // );
                  }),
            ),
          ),
      ]),
    );
  }
}

class ProgramViewCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? videoUrl;
  final List? videoUrlList;
  const ProgramViewCard(
      {Key? key, this.title, this.videoUrl, this.imageUrl, this.videoUrlList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WatchPrograms(
            videoUrl: videoUrl,
            videoList: videoUrlList,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: 281.h,
          width: 376.w,
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
                    imageUrl: imageUrl.toString(),
                    width: 397.w,
                    height: 207.h,
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
                title.toString(),
                overflow: TextOverflow.ellipsis,
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

class ProgramsViewChoiceButton extends ConsumerWidget {
  final String? title;
  final int? index;
  const ProgramsViewChoiceButton({Key? key, this.title, this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final homeController = ref.watch(homeProvider);
    final programController = ref.watch(programProvider);
    return GestureDetector(
        onTap: () async {
          homeController.changeCurrentProgramChoice(index!);
          if (index == 7 && programController.psfVideosList == null) {
            await programController.getPsfChannelInfo();
          }
          if (index == 9 && programController.mmpVideosList == null) {
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
          }
          if (index == 3 && programController.faSermonsModel == null) {
            await programController.loadFaSermons();
          }
          if (index == 10 && programController.feastofEsther == null) {
            await programController.loadFeastOfEsther();
          }

          if (index == 5 && programController.conventionVideoModel == null) {
            await programController.loadConventionVideos();
          }
          if (index == 6 && programController.congressVideoModel == null) {
            await programController.loadCongressVideos();
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

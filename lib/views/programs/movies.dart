import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/watch_programs/watch_movies.dart';
import 'package:rccg_app/widgets/loader.dart';

import '../../providers/all_providers.dart';
import '../../themes/app_theme.dart';
import '../../widgets/text_fields.dart';
import '../base/home.dart';
import '../watch_programs/watch_church_programs.dart';


class ChristianMovie extends ConsumerStatefulWidget {
  static const route = 'christian movie';
  const ChristianMovie({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ChristianMovieState();
}

class _ChristianMovieState extends ConsumerState<ChristianMovie> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final programController=ref.read(programProvider);
    Future(() {
      programController.loadMovieVideos();
    });



  }
  @override

  Widget build(BuildContext context, ) {
    final programController=ref.watch(programProvider);
    final homeController = ref.watch(homeProvider);
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
          title: Text('Kids & Adults Christian Movies',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: LightAppTheme.black2))),
      body: Column(children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w),
              child:  SizedBox(
                  height: 45,
                  width:287.w,
                  child: AppTextField(
                    onTap: (query){
                      if (homeController.currentMovieChoice == 0) {
                        final videos = programController
                            .christianMovieModel!.videoDetails!
                            .where((video) {
                          final titleLower = video.snippet!.title!.toLowerCase();
                          final searchLower = query.toLowerCase();
                          return titleLower!.contains(searchLower);
                        }).toList();
                        setState(() {
                          if (query.isEmpty) {
                            programController.loadMovieVideos();
                          } else {
                            programController.getSearchedChristianMovies(videos);
                          }
                        });
                      }
                      if (homeController.currentMovieChoice == 1) {
                        final videos = programController
                            .mountZionMovies!.videoDetails!
                            .where((video) {
                          final titleLower = video.snippet!.title!.toLowerCase();
                          final searchLower = query.toLowerCase();
                          return titleLower!.contains(searchLower);
                        }).toList();
                        setState(() {
                          if (query.isEmpty) {
                            programController.loadMountZionMovies();
                          } else {
                            programController.getSearchedMountZionMovies(videos);
                          }
                        });
                      }
                      if (homeController.currentMovieChoice == 2) {
                        final videos = programController
                            .kidsChristianMovies!.videoDetails!
                            .where((video) {
                          final titleLower = video.snippet!.title!.toLowerCase();
                          final searchLower = query.toLowerCase();
                          return titleLower!.contains(searchLower);
                        }).toList();
                        setState(() {
                          if (query.isEmpty) {
                            programController.getKidsMovies();
                          } else {
                            programController.getSearchedKidsMovies(videos);
                          }
                        });
                      }
                      if (homeController.currentMovieChoice == 3) {
                        final videos = programController
                            .internationalChristianMovies!.videoDetails!
                            .where((video) {
                          final titleLower = video.snippet!.title!.toLowerCase();
                          final searchLower = query.toLowerCase();
                          return titleLower!.contains(searchLower);
                        }).toList();
                        setState(() {
                          if (query.isEmpty) {
                            programController.loadInternationalMovies();
                          } else {
                            programController.getSearchedInternationalMovies(
                                videos);
                          }
                        });
                      }

                    },
                    hintText: 'Search for program',
                    prefixIcon: Icon(Icons.search, color: LightAppTheme.black),
                    backGroundColor: LightAppTheme.white,
                    borderColor: LightAppTheme.white6,
                  )),
            ), GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (context)=>Dialog(
                    child: Container(
                      height: 374,width:324,

                      decoration: BoxDecoration(
                          color: LightAppTheme.white,borderRadius: BorderRadius.circular(13)
                      ),
                      child: Column(children: [
                        Gap(18.h),
                        Center(child: Text('Search Filter', style: GoogleFonts.inter(
                            color: LightAppTheme.black2,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),)),
                        Gap(14.h),
                        Container(height: 1,width: double.infinity,color: LightAppTheme.lightPurple3,),
                        Gap(21.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Sort by'),
                                Gap(42.h),
                                Text('Type'),
                                Gap(42.h),
                                Text('Upload Date'),
                                Gap(42.h),
                                Text('Duration'),
                                Gap(42.h),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Relevance'),
                                Gap(42.h),
                                Text('All'),
                                Gap(42.h),
                                Text('Anytime'),
                                Gap(42.h),
                                Text('Anytime'),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Gap(3),
                                RotatedBox(
                                    quarterTurns: 5,
                                    child: Icon(Icons.arrow_forward_ios_rounded, size: 13,)),    Gap(42.h),Gap(5),
                                RotatedBox(
                                    quarterTurns: 5,
                                    child: Icon(Icons.arrow_forward_ios_rounded, size: 13,)), Gap(42.h),
                                Gap(3),
                                RotatedBox(
                                    quarterTurns: 5,
                                    child: Icon(Icons.arrow_forward_ios_rounded, size: 13,)), Gap(42.h),
                                Gap(3),
                                RotatedBox(
                                    quarterTurns: 5,
                                    child: Icon(Icons.arrow_forward_ios_rounded, size: 13,)),
                              ],
                            ),
                          ],),
                        Container(height: 1,width: double.infinity,color: LightAppTheme.lightPurple3,),
                        Gap(16)
                        ,                              Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap:(){
                                Navigator.pop(context)
                                ;                          },
                              child: Text('CANCEL',style: GoogleFonts.inter(
                                  color: LightAppTheme.black2,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400)),
                            ),
                            Gap(50),
                            GestureDetector(
                              onTap:(){
                                Navigator.pop(context);
                              },
                              child: Text('APPLY',style: GoogleFonts.inter(
                                  color: LightAppTheme.primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400)),
                            ),
                            Gap(20),
                          ],)



                      ],),
                    ),

                  ));
                },
                child: Image.asset('assets/filter.png', height:32.h, width: 32.w,)),
          ],
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
              children:  const [
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
                  index: 3,
                ),
              ],
            ),
          ),
        ),
        Gap(39.h),
        if(programController.loadMovies )
          Indicator(),
        if(programController.christianMovieModel!=null)
          Visibility(
            visible:homeController.currentMovieChoice==0,
            child:  Expanded(
              child: ListView.builder(
                  itemCount: programController.christianMovieModel!.videoDetails!.length,
                //  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    return     MovieListCard(
                    title: programController.christianMovieModel!.videoDetails![index].snippet!.title,
                    imageUrl:programController.christianMovieModel!.videoDetails![index].snippet!.thumbnails!.medium!.url,
                    videoUrl: programController.christianMovieModel!.videoDetails![index].id!.videoUrl,
    videoUrlList:programController.christianMovieModel!.videoDetails!,
    );
                  }
              ),
            ),
          ),
        if(programController.internationalChristianMovies!=null)
          Visibility(
            visible:homeController.currentMovieChoice==3,
            child: Expanded(
              child:  ListView.builder(
                  itemCount: programController.internationalChristianMovies!.videoDetails!.length,
                //  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    return   MovieListCard(
                      title: programController.internationalChristianMovies!.videoDetails![index].snippet!.title,
                      imageUrl:programController.internationalChristianMovies!.videoDetails![index].snippet!.thumbnails!.medium!.url,
                      videoUrl: programController.internationalChristianMovies!.videoDetails![index].id!.videoId,
                      videoUrlList: programController.internationalChristianMovies!.videoDetails,
                    );
                  }
              ),
            ),
          ),

        if(programController.kidsChristianMovies!=null)
          Visibility(
            visible:homeController.currentMovieChoice==2,
            child: Expanded(
              child: ListView.builder(
                  itemCount: programController.kidsChristianMovies!.videoDetails!.length,
                  //scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    return  MovieListCard(
                      title: programController.kidsChristianMovies!.videoDetails![index].snippet!.title,
                      imageUrl:programController.kidsChristianMovies!.videoDetails![index].snippet!
                      .thumbnails!.medium!
                      .url,
                      videoUrl:programController.kidsChristianMovies!.videoDetails![index].id!.videoId,
                      videoUrlList: programController.kidsChristianMovies!.videoDetails,
                    );
                  }
              ),
            ),
          ),
        if(programController.mountZionMovies!=null)
          Visibility(
            visible:homeController.currentMovieChoice==1,
            child:  Expanded(
              child: programController.loadMovies?Indicator():  ListView.builder(
                  itemCount: programController.christianMovieModel!.videoDetails!.length,
                  //scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    return MovieListCard(
                      title: programController.christianMovieModel!.videoDetails![index].snippet!.title ,
                      imageUrl: programController.christianMovieModel!.videoDetails![index].snippet!.thumbnails!.medium!.url,
                      videoUrl: programController.christianMovieModel!.videoDetails![index].id!.videoUrl ,
                      videoUrlList:  programController.christianMovieModel!.videoDetails,
                    );
                  //
                  //   MovieListCard(
                  //     title: ,
                  //     imageUrl:,
                  //     videoUrl: ,
                  //     videoUrlList: [],
                  //   );
                   }
             ),
            ),
          ),
        // Expanded(
        //   child: programController.load?Indicator():ListView.builder(
        //       itemCount: programController.christianMovieModel!.videoDetails!.length,
        //       shrinkWrap: true,
        //       itemBuilder: (context,index) {
        //         return GestureDetector(
        //           onTap: (){
        //          Navigator.push(context, MaterialPageRoute(builder: (context){
        //            return WatchMovies(
        //              videoId:  programController.christianMovieModel!.videoDetails![index].id,
        //              searchVideoDetails:  programController.christianMovieModel!.videoDetails![index].videoDetails,
        //            );
        //          }));
        //           },
        //           child: Padding(
        //             padding: const EdgeInsets.only(bottom: 20,top: 20),
        //             child: Container(
        //               height: 281.h,
        //               width: 376.w,
        //               decoration: const BoxDecoration(
        //                   color: LightAppTheme.white,
        //                   borderRadius: BorderRadius.only(
        //                       bottomRight: Radius.circular(20),
        //                       bottomLeft: Radius.circular(20))),
        //               child: Column(
        //                 children: [
        //                   CachedNetworkImage(imageUrl: programController.christianMovieModel
        //                   !.videoDetails![index].videoDetails!.thumbnails!.medium!.url.toString()
        //                     ,
        //                     width: 397.w, height: 207.h,fit: BoxFit.cover,),
        //                   Gap(15.h),
        //                   Row(
        //                     children: [
        //                       Padding(
        //                         padding:  EdgeInsets.only(left:27.w,),
        //                         child: Image.asset('assets/movie_pic.png', height: 35.h, width: 35.w),
        //                       ),
        //                       Gap(5.h),
        //                       Expanded(child: Text('${programController.christianMovieModel!.videoDetails![index].videoDetails!.title}')),
        //                     ],
        //                   )
        //                 ],
        //               ),
        //             ),
        //           ),
        //         );
        //       }
        //   ),
        // )
      ]),
    );
  }
}




class MovieListCard extends StatelessWidget {
  final String? imageUrl;
  final String?title;
  final String? videoUrl;
  final List? videoUrlList;
  const MovieListCard({Key? key,this.title,this.videoUrl,this.imageUrl,this.videoUrlList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:(){

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WatchPrograms(
            videoUrl: videoUrl,
            videoList: videoUrlList,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20,top: 20,left:
        10,right:
        10),
        child: Container(
          height: 281.h,
          width: 376.w,
          decoration: const BoxDecoration(
              color: LightAppTheme.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: Column(
            children: [
              CachedNetworkImage(imageUrl:   imageUrl.toString(),

                width: 397.w, height: 207.h,fit: BoxFit.cover,),
              Gap(15.h),Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text( title.toString(),),
              )),
              Row(
                children: [
                  // Padding(
                  //   padding:  EdgeInsets.only(left:27.w,),
                  //   child: Image.asset('assets/movie_pic.png', height: 35.h, width: 35.w),
                  // ),
                  Gap(5.h),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

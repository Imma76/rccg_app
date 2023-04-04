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
          title: Text('Christian Movies',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: LightAppTheme.black2))),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 23.w, right: 23.w),
          child: const SizedBox(
              height: 45,
              child: AppTextField(
                hintText: 'Search for a christian movies',
                prefixIcon: Icon(Icons.search, color: LightAppTheme.black),
                backGroundColor: LightAppTheme.white,
                borderColor: LightAppTheme.white6,
              )),
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
                ProgramsChoiceButton(

                  title: 'All',index: 0,
                ),Gap(10),ProgramsChoiceButton(  title: 'Live Programs',index: 1,),Gap(10),ProgramsChoiceButton(  title: 'Pastor EA Sermons',index: 2,),

              ],
            ),
          ),
        ),
        Gap(39.h),
        Expanded(
          child: programController.load?Indicator():ListView.builder(
              itemCount: programController.christianMovieModel!.videos!.length,
              shrinkWrap: true,
              itemBuilder: (context,index) {
                return GestureDetector(
                  onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                   return WatchMovies(
                     videoId:  programController.christianMovieModel!.videos![index].id,
                     searchVideoDetails:  programController.christianMovieModel!.videos![index].videoDetails,
                   );
                 }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20,top: 20),
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
                          CachedNetworkImage(imageUrl: programController.christianMovieModel
                          !.videos![index].videoDetails!.thumbnails!.medium!.url.toString()
                            ,
                            width: 397.w, height: 207.h,fit: BoxFit.cover,),
                          Gap(15.h),
                          Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left:27.w,),
                                child: Image.asset('assets/movie_pic.png', height: 35.h, width: 35.w),
                              ),
                              Gap(5.h),
                              Expanded(child: Text('${programController.christianMovieModel!.videos![index].videoDetails!.title}')),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        )
      ]),
    );
  }
}



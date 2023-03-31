import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';

class WatchMovies extends ConsumerStatefulWidget {
  static const route = 'watch movie';
  const WatchMovies({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _WatchMoviesState();
}

class _WatchMoviesState extends ConsumerState<WatchMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text('RCCG Programs',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.black2))),
      body: Column(
        children: [
          Container(
            height: 281.h,
            // width: 376.w,
            decoration: const BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: Column(
              children: [
                Image.asset('assets/movie_pic2.png',
                  width: 376.w, height: 206.h,fit: BoxFit.fill,),
                Gap(15.h),
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left:27.w,),
                      child: Image.asset('assets/movie_pic.png', height: 35.h, width: 35.w),
                    ),
                    Gap(5.h),
                    Text('Enoch | A Biopic of Pastor E.A. Adeboye'),
                  ],
                ),



              ],
            ),
          ),   Padding(
            padding:  EdgeInsets.only(left:27.w,right: 27.w),
            child: Row(
              children: [
                Text('More Mount Zion Movies',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.black2)),
                Spacer(),
                GestureDetector(
                    onTap: (){

                    },
                    child: Text('View all',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.black2))),

              ],
            ),
          ),  Gap(33.h),Container(
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
                    Image.asset('assets/movie_poster.png',width: 136.w,height: 80.h,)
                  ],
                ),
                Gap(19.w),
                Column(
                  children: [
                    const Text('30 Pieces Movie...-'),
                    Gap(16.h),
                    Container(
                      height: 36.h,
                      width: 126.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color:AppTheme.grey4)
                      ),
                      child: const Center(child: Text('Watch Movie')),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

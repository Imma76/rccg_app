import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../../widgets/text_fields.dart';
import '../base/home.dart';

class ChristianMovie extends ConsumerWidget {
  static const route = 'christian program';
  const ChristianMovie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          title: Text('Christian Movies',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.black2))),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 23.w, right: 23.w),
          child: const SizedBox(
              height: 45,
              child: AppTextField(
                hintText: 'Search for a christian movies',
                prefixIcon: Icon(Icons.search, color: AppTheme.black),
                backGroundColor: AppTheme.white,
                borderColor: AppTheme.white6,
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
          child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20,top: 20),
                  child: Container(
                    height: 281.h,
                    width: 376.w,
                    decoration: const BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Column(
                      children: [
                        Image.asset('assets/movie_pic2.png',
                            width: 397.w, height: 207.h),
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
                        )
                      ],
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

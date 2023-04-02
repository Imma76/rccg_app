import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';

class ReadHymns extends ConsumerWidget {
  static const route= 'read hymns';
  const ReadHymns({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Gap(23.h),
        Text('Hymn 24:\n', style: GoogleFonts.inter(
            color: LightAppTheme.black2,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600),),

        Text(' "That Wonderful Name, Jesus”', style: GoogleFonts.inter(
            color: LightAppTheme.black2,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600),),
        Gap(26.h),
        Container(
          height: 1,
          width: double.infinity,
          color: LightAppTheme.grey4,
        ),
        Gap(26.h),
        Text('1 That wonderful Name, Jesus!That wonderful Name, Jesus!That wonderful Name, Jesus!There is no other name I know.',style: GoogleFonts.inter(
            color: LightAppTheme.black2,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400),)
      ],
    );
  }
}
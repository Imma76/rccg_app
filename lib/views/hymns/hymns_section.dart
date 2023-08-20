import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/hymns/read_hymns.dart';

import '../../themes/app_theme.dart';

class HymnsSection extends ConsumerWidget {
  static const route = 'hymn section';
  const HymnsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          centerTitle: false,
          title: Text('RCCG Hymns',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: LightAppTheme.black2))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(10),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context,index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child:  HymnSectionCard()
                  );
                }
            ),
          ),

        ],
      ),
    );
  }
}


class HymnSectionCard extends ConsumerWidget {
  const HymnSectionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
   // final homeController = ref.watch(homeProvider);
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ReadHymns.route );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            width:329.w,
            height:65.h,
            padding: EdgeInsets.only(top: 8.h,left: 7.w),
            decoration: BoxDecoration(
                color:LightAppTheme.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 13),
                    blurRadius: 25,
                    color: Color.fromARGB(14, 14, 14, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [


                Gap(20),

                Text('1.'),
                Gap(10),
                SizedBox(
                    width: 173.w,
                    child: Text('General Hymn Book',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14.sp,color: LightAppTheme.black))),
                  Spacer(),
                Icon(Icons.arrow_forward_ios_rounded, size: 14,),
                Gap(10.h),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
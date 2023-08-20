import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';

class DailyRefresh extends ConsumerStatefulWidget {
  static const route = 'daily refresh';
  const DailyRefresh({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _DailyRefreshState();
}

class _DailyRefreshState extends ConsumerState<DailyRefresh> {
  int currentIndex=0;

  List<Color> colorList=[
    LightAppTheme.bg1,  LightAppTheme.bg2,  LightAppTheme.bg3,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [


         Container(color:colorList[currentIndex].withOpacity(1)),
          GestureDetector(
              onTap: (){

                if(currentIndex==2){
                  currentIndex= 0;
                  setState(() {

                  });
                }else{
                  currentIndex++;
                      setState(() {

                      });
                }
              },
              child: Image.asset('assets/refresh_background.png',)),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           // mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Gap(50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 103,
                      height: 2,
                      decoration: BoxDecoration( color: currentIndex == 0?Colors.white:Colors.white.withOpacity(0.4000000059604645),),
                    ),
                    Gap(8),
                  Container(
                  width: 103,
                  height: 2,
                  decoration: BoxDecoration(
                  color: currentIndex == 1?Colors.white:Colors.white.withOpacity(0.4000000059604645),
                  ),),   Gap(8),
                    Container(
                      width: 103,
                      height: 2,
                      decoration: BoxDecoration(
                        color: currentIndex == 2?Colors.white:Colors.white.withOpacity(0.4000000059604645),
                      ),)
                  ],
                ),
              ),  Gap(20),

              Row(
                children: [
                  Gap(30),
                  Text('Daily Refresh', style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: LightAppTheme.white)),Spacer(),
                  Image.asset('assets/sound.png', height: 18, width: 18,color: LightAppTheme.white,), Gap(10), GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/cancel.png', height: 13, width: 18,color: LightAppTheme.white,)),Gap(20),
                ],
              ),
              Spacer(),
              Center(
                child: SizedBox(
                  width: 297,
                  child: Text(
                    'Jesus Christ the same yesterday, and to day, and for ever.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 26.sp,  height: 1.50,
    color: LightAppTheme.white)


                  ),
                ),
              ),
              Gap(26.h),
              Center(
                child: Text(
                  'Hebrews 13:8 KJV',
                  style: GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,  height: 1.50,
    color: LightAppTheme.white)



                ),
              ),
              Spacer(),

            ],
          )
        ],
      )
    );
  }
}

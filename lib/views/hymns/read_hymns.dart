import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../providers/all_providers.dart';
import '../../themes/app_theme.dart';

class ReadHymns extends ConsumerWidget {
  static const route= 'read hymns';
  const ReadHymns({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hymnController= ref.watch(hymnProvider);
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: LightAppTheme.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: hymnController.isDarkMode?LightAppTheme.white:LightAppTheme.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: false,
          title: Text('General Hymn Book',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: hymnController.isDarkMode?LightAppTheme.white:LightAppTheme.black2))),
      floatingActionButton:GestureDetector(

        onTap: (){
          showModalBottomSheet(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius
                  .only(topRight: Radius.circular(24),topLeft: Radius.circular(24) )),
              context: context, builder: (context){
            return StatefulBuilder(
                builder: (context,state) {
                  return Container(
                    height: 273.h,
                    width: 375.w,

                    decoration: BoxDecoration(
                        color: hymnController.isDarkMode?LightAppTheme.dark2:LightAppTheme.white,
                        borderRadius: BorderRadius
                            .only(topRight: Radius.circular(24),topLeft: Radius.circular(24))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left:35.0.w,right: 35.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  hymnController.changeTheme(false);
                                  state((){});
                                },
                                child: Row(
                                  children: [
                                    Image.asset('assets/light_mode2.png',width:28.w,height:24.h, color: !hymnController.isDarkMode?LightAppTheme.grey8:LightAppTheme.white,),  Gap(10.w),
                                    Text('Light Mode', style: GoogleFonts.inter(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: LightAppTheme.grey8),),
                                  ],
                                ),
                              ),

                              Gap(35.w),
                              Container(
                                height: 66.0,
                                width: 1,
                                color: LightAppTheme.grey4,
                              ),
                              Gap(35.w),
                              GestureDetector(
                                onTap: (){
                                  hymnController.changeTheme(true);
                                  state((){});
                                },
                                child: Row(
                                  children: [
                                    Image.asset('assets/dark_mode.png',width:28.w,height:24.h,color: hymnController.isDarkMode?LightAppTheme.white:null,),  Gap(10.w),
                                    Text('Dark Mode', style: GoogleFonts.inter(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: LightAppTheme.grey8),),
                                  ],
                                ),
                              ),

                              // Gap(61.w),
                            ],
                          ),
                        ),
                        Container(
                          height: 1.0,
                          width: double.infinity,
                          color: LightAppTheme.grey4,
                        ),
                        Gap(20.w),
                        Padding(
                          padding: EdgeInsets.only(left:25.0.w),
                          child: Text('Increase Font Size', style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color:hymnController.isDarkMode?LightAppTheme.white: LightAppTheme.black2),),
                        ),
                        Gap(13.h),
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(25.w), Image.asset('assets/text_decrease.png',width:28.w,height:24.h,color: hymnController.isDarkMode?LightAppTheme.white:null),
                            Gap(25.w),
                            Expanded(
                              child: SliderTheme(
                                data: SliderThemeData(

                                  thumbColor:  hymnController.isDarkMode?LightAppTheme.white:LightAppTheme.primaryColor,
                                  trackHeight: 2,
                                  activeTrackColor: hymnController.isDarkMode?LightAppTheme.white:LightAppTheme.primaryColor,
                                  inactiveTrackColor:hymnController.isDarkMode?LightAppTheme.white:LightAppTheme.primaryColor,
                                ),
                                child: Slider(
                                    min: 10,max: 100,
                                    label: hymnController.slideValue.toString()
                                    ,
                                    value: hymnController.slideValue, onChanged: (value){
                                  hymnController.changeSlideValue(value);
                                  state((){});
                                }),
                              ),
                            ),   Gap(25.w),Image.asset('assets/text_increase.png',width:28.w,height:24.h, color: hymnController.isDarkMode?LightAppTheme.white:null,),
                            Gap(25.w),
                          ],
                        ),
                        Gap(27.h),
                        Container(
                          height: 1.0,
                          width: double.infinity,
                          color: LightAppTheme.grey4,
                        ),
                        Gap(15.h),
                        GestureDetector(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/cancel.png',width:28.w,height:18.h,color:hymnController.isDarkMode?LightAppTheme.white:null),

                                Gap(10.w),

                                Text('Close', style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color:hymnController.isDarkMode?LightAppTheme.white: LightAppTheme.primaryColor),),
                              ],
                            ),
                          ),
                        ),
                        Gap(18.h),
                      ],
                    ),
                  );
                }
            );
          });
        },
        child: Container(
          width: 51,
          height: 51,
          child: Center(child: Image.asset('assets/text_increase2.png',height: 32.h,width: 32.w,)),
          decoration: ShapeDecoration(
            color: Colors.white,

            shape: OvalBorder(),
            shadows: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 20,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
        ),
      ),

      // FloatingActionButton(
      //   backgroundColor: LightAppTheme.white,
      //   onPressed: () {  },
      // child: Text('A+'),),
      backgroundColor: hymnController.isDarkMode?LightAppTheme.dark3:null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(23.h),
            Padding(
              padding: const EdgeInsets.only(left:24.0),
              child: Text('Hymn 24:\n', style: GoogleFonts.inter(
                  color:hymnController.isDarkMode?LightAppTheme.white: LightAppTheme.black2,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),),
            ),

            Padding(
              padding: const EdgeInsets.only(left:24.0),
              child: Text(' "That Wonderful Name, Jesus”', style: GoogleFonts.inter(
                  color:hymnController.isDarkMode?LightAppTheme.white: LightAppTheme.black2,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),),
            ),
            Gap(26.h),
            Container(
              height: 1,
              width: double.infinity,
              color: LightAppTheme.grey4,
            ),
            //Gap(26.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: hymnController.isDarkMode?LightAppTheme.dark:LightAppTheme.white,
          ),


              child: Center(
                child: SizedBox(
                  width: 329,
                  child: Padding(
                    padding: const EdgeInsets.only(left:24.0, right: 22),
                    child: Column(
                      children: [
                        Gap(10),
                        Text('1 That wonderful Name, Jesus!That wonderful Name, Jesus!That wonderful Name, Jesus!There is no other name I know.\n\n2 The Great Redeemer, Jesus!His blood washed me clean, Jesus!And now I am saved, Jesus!There is no other name I know.\n\n3 The Great Physician, Jesus!His stripes healeth me, Jesus!And now I am whole, Jesus!There is no other name I know.\n\n4 The Great Lord of hosts, Jesus!His truth set me free, Jesus!I am free indeed, Jesus!There is no other name I know.\n\n5 The Great Provider, Jesus!He supplies my needs, Jesus!And now I am full, Jesus!There is no other name I know.\n\n6 My Great Companion, Jesus!Always by my side, Jesus!I have a sure Friend, Jesus!There is no other name I know.\n\n7 The soon coming King, Jesus!Coming back for me, Jesus!I will reign with Him, Jesus!There is no other name I know.\n\n8 Let us praise His Name, Jesus!Name above all names, Jesus!Let us shout His Name, Jesus!I will sing I will shout, JESUS!',style: GoogleFonts.inter(
                            color:hymnController.isDarkMode?LightAppTheme.white: LightAppTheme.black2,
                            fontSize: hymnController.slideValue,
                            height: 1.50,
                            fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
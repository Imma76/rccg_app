import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../providers/all_providers.dart';
import '../../themes/app_theme.dart';
import '../hymns/read_hymns.dart';

class ReadManuals extends ConsumerStatefulWidget {
  static const route  ='read manual';

  const ReadManuals({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ReadManualsState();
}

class _ReadManualsState extends ConsumerState<ReadManuals> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(manualProvider);
  }
  @override
  Widget build(BuildContext context) {
    final manualController= ref.watch(manualProvider);
    return Scaffold(
      backgroundColor:manualController.isDarkMode?LightAppTheme.dark3: LightAppTheme.lightBlue,

       appBar: PreferredSize(
           preferredSize: Size.fromHeight(161.0), // here the desired height
           child: Column(
             children: [

               AppBar(
                 elevation: 0.0,
                 backgroundColor:manualController.isDarkMode?LightAppTheme.dark3: LightAppTheme.lightBlue,
                   leading: IconButton(
                     icon: Icon(
                       Icons.arrow_back_ios_rounded,color:manualController.isDarkMode?LightAppTheme.white:LightAppTheme.black
                       ,
                     ),
                     onPressed: () {
                       Navigator.pop(context);
                     },
                   ),
                   title: Text('RCCG Open Heavens Manual',
                       style: GoogleFonts.inter(
                           fontSize: 18.sp,
                           fontWeight: FontWeight.w600,
                           color: manualController.isDarkMode?LightAppTheme.white:LightAppTheme.black))
               ),
               Gap(10.h),
               Center(
                 child: Container(
                   width: 320.w,
                   height: 44.9.h,
                   decoration: BoxDecoration(

                       color: manualController.isDarkMode?LightAppTheme.dark:LightAppTheme.white6,
                       borderRadius: BorderRadius.circular(22)),
                   child: Center(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         manualController.currentIndex == 0
                             ? SizedBox(
                             height: 40.34.h,
                             width: 150.w,
                             child: Card(
                                 color: manualController.isDarkMode?LightAppTheme.dark2:LightAppTheme.white,
                               shape: RoundedRectangleBorder(
                                   borderRadius:
                                   BorderRadius.circular(17)),
                               child: Center(
                                   child: Text(
                                     'Message',
                                     style: GoogleFonts.inter(
                                         fontSize: 16.sp,
                                         fontWeight: FontWeight.w500,
                                         color: manualController.isDarkMode?LightAppTheme.white:LightAppTheme.black3),
                                   )),
                             ))
                             : GestureDetector(
                             onTap: () {

                               manualController.changeCurrentIndex(0);

                             },
                             child: SizedBox(
                                 height: 40.34.h,
                                 width: 150.w,
                                 child: Center(
                                     child: Text(
                                       'Message',
                                       style: GoogleFonts.inter(
                                           fontSize: 16.sp,
                                           fontWeight: FontWeight.w500,
                                           color: manualController.isDarkMode?LightAppTheme.white:LightAppTheme.grey10),
                                     )))),
                         manualController.currentIndex == 1
                             ? SizedBox(
                             height: 40.34.h,
                             width: 150.w,
                             child: Card(
                               color: manualController.isDarkMode?LightAppTheme.dark2:LightAppTheme.white,
                               shape: RoundedRectangleBorder(
                                   borderRadius:
                                   BorderRadius.circular(17)),
                               child: Center(
                                   child: Text(
                                     'Hymn',
                                     style: GoogleFonts.inter(
                                         fontSize: 16.sp,
                                         fontWeight: FontWeight.w600,
                                         color: manualController.isDarkMode?LightAppTheme.white:LightAppTheme.black3),
                                   )),
                             ))
                             : GestureDetector(
                             onTap: () {
                               manualController.changeCurrentIndex(1);
                             },
                             child: SizedBox(
                                 height: 40.34.h,
                                 width: 150.w,
                                 child: Center(
                                     child: Text(
                                       'Hymn',
                                       style: GoogleFonts.inter(
                                           fontSize: 16.sp,
                                           fontWeight: FontWeight.w500,
                                           color: manualController.isDarkMode?LightAppTheme.white:LightAppTheme.grey10),
                                     ))))
                       ],
                     ),
                   ),
                 ),
               ),
               Gap(10.h),
             ],
           ),
       ),
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: LightAppTheme.white,
              child: Image.asset('assets/text.png',height: 18.h,width: 23.w,color: LightAppTheme.primaryColor,),
              onPressed: () {
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
                            color: manualController.isDarkMode?LightAppTheme.dark2:LightAppTheme.white,
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
                                      manualController.changeTheme(false);
                                      state((){});
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset('assets/light_mode2.png',width:28.w,height:24.h, color: !manualController.isDarkMode?LightAppTheme.grey8:LightAppTheme.white,),  Gap(10.w),
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
                                  manualController.changeTheme(true);
                                  state((){});
                                },
                                child: Row(
                                  children: [
                                    Image.asset('assets/dark_mode.png',width:28.w,height:24.h,color: manualController.isDarkMode?LightAppTheme.white:null,),  Gap(10.w),
                                    Text('Dark Mode', style: GoogleFonts.inter(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: LightAppTheme.grey8),)
                                  ],
                                ),
                              )
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
                                  color:  manualController.isDarkMode?LightAppTheme.white:LightAppTheme.black2),),
                            ),
                            Gap(13.h),
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Gap(25.w), Image.asset('assets/text_decrease.png',width:28.w,height:24.h, color: manualController.isDarkMode?LightAppTheme.white:null),
                                Gap(25.w),
                                Expanded(
                                  child: SliderTheme(
                                    data: SliderThemeData(

                                      thumbColor:  manualController.isDarkMode?LightAppTheme.white:LightAppTheme.primaryColor,
                                      trackHeight: 2,
                                      activeTrackColor:  manualController.isDarkMode?LightAppTheme.white:LightAppTheme.primaryColor,
                                      inactiveTrackColor: manualController.isDarkMode?LightAppTheme.white:LightAppTheme.primaryColor,
                                    ),
                                    child: Slider(
                                        min: 10,max: 100,
                                        label: manualController.slideValue.toString()
                                        ,
                                        value: manualController.slideValue, onChanged: (value){
                                        manualController.changeSlideValue(value);
                                         state((){});
                                    }),
                                  ),
                                ),   Gap(25.w),Image.asset('assets/text_increase.png',width:28.w,height:24.h, color:manualController.isDarkMode?LightAppTheme.white:null),
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
                                    Image.asset('assets/cancel.png',width:24.w,height:20.h,color: manualController.isDarkMode?LightAppTheme.white:null),

                                    Gap(10.w),

                                    Text('Close', style: GoogleFonts.inter(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color:  manualController.isDarkMode?LightAppTheme.white:LightAppTheme.primaryColor),),
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
              //  });
                //showBottomSheet(context: context, builder: (context){

              },
              heroTag: null,
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              backgroundColor: LightAppTheme.white,
              child: Image.asset('assets/sound.png',height: 18.h,width: 23.w,color: LightAppTheme.primaryColor,),
              onPressed: () {},
              heroTag: null,
            )
          ]
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: manualController.isDarkMode?LightAppTheme.dark:LightAppTheme.white,borderRadius: BorderRadius.only(topRight:Radius.circular(30),topLeft:Radius.circular(30))),
        child: Padding(
          padding: EdgeInsets.only(left:25.0.w,right: 25.w),
          child: SingleChildScrollView(
            child:manualController.currentIndex==1?ReadHymns(): Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Gap(33.h),
                Center(
                  child: ManualTextHeading(
                    heading: 'Topic',
                    body: 'Who Do You Listen To?',
                  ),
                ),

                Gap(13.h),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: LightAppTheme.grey4,
                ),
                Gap(33.h),
                ManualTextHeading(
                  heading: 'Date',
                  body: '29th March 2023',
                ),
                Gap(33.h),
                ManualTextHeading(
                  heading: 'Memory Verse',
                  body: '“My son, if sinners entice thee, consent thou not.” – Proverbs 1:10 (KJV)',
                ),
                // Gap(33.h),
                // ManualTextHeading(
                //   heading: 'Read',
                //   body: '2 Samuel 13:1-15, 23-28 (KJV)',
                // ),
                Gap(33.h),


                ManualTextHeading(
                  heading: 'Bible Verse',
                  body: '1 Samuel 22-24',
                ),

                Gap(20.h),
                Text('Message:',   style: GoogleFonts.inter(
                    color: manualController.isDarkMode?LightAppTheme.white: LightAppTheme.black2,
                    fontSize:manualController.slideValue,
                    fontWeight: FontWeight.w600),),
                Gap(20.h),
                Text('There is tremendous power in what you allow through your ears into your life. Believe me honestly, what you listen to has the power to shape your beliefs and actions. That is why Romans 10:17 says that faith comes by hearing. Interestingly, fear also comes by hearing. What you hear can determine what you become. This is why you must choose who you listen to carefully. When you notice that there is someone whose words leave your heart worse than it was before you listened to him or her, please stay away from that fellow immediately.',style: GoogleFonts.inter(
                    color:manualController.isDarkMode?LightAppTheme.white: LightAppTheme.black2,
                    fontSize: manualController.slideValue,
                    fontWeight: FontWeight.w400),)
              ],
            ),
          ),
        ),

      ),
    );
  }
}

class ManualTextHeading extends ConsumerWidget {
  final String? heading;
  final String? body;
  const ManualTextHeading({
    Key? key,this.body,this.heading
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final manualController= ref.watch(manualProvider);
    return RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
            text: '$heading: ',
            style: GoogleFonts.inter(
                color: manualController.isDarkMode?LightAppTheme.white: LightAppTheme.black2,
                fontSize:manualController.slideValue,
                fontWeight: FontWeight.w600),
            children: [

              TextSpan(
                  text:
                  '$body',
                  style: GoogleFonts.inter(
                      color: manualController.isDarkMode?LightAppTheme.white: LightAppTheme.black2,
                      fontSize: manualController.slideValue,
                      fontWeight: FontWeight.w400)),
            ]));
  }
}

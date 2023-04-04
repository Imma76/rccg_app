import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/authentication/auth.dart';
import 'package:rccg_app/views/onboarding/welcome_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../themes/app_theme.dart';

class Onboarding extends StatefulWidget {
  static const route = 'onboarding';
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightAppTheme.white,
        // appBar: AppBar(
        //   backgroundColor: LightAppTheme.transparent,
        //   elevation: 0,
        //   leading: Padding(
        //     padding: const EdgeInsets.only(left:20.0),
        //     child: Image.asset("assets/app_logo.png",height: 56.h,width:56.w),
        //   ),
        //   actions: [
        //
        //     GestureDetector(
        //       onTap: (){
        //         Navigator.pushNamedAndRemoveUntil(context, Authentication.route, (route) => false);
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.only(right:25.0),
        //         child: Center(child: Text('Skip',style:GoogleFonts.inter(color: LightAppTheme.primaryColor,fontWeight: FontWeight
        //         .w500))),
        //       ),
        //     )
        //   ],
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(19.h),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: Image.asset("assets/app_logo.png",height: 56.h,width:56.w),
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, Authentication.route, (route) => false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right:25.0),
                    child: Center(child: Text('Skip',style:GoogleFonts.inter(color: LightAppTheme.primaryColor,fontWeight: FontWeight
                        .w500))),
                  ),
                ),
              ],
            ),
            //Gap(10.h),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value){
                  print(value);
                  setState(() {
                    index = value;
                  });
                  if(value == 2){
                    print('here');
                  }
                },
                children: [
                  View1(controller: controller,index: index,),
                  View2(controller: controller,index: index,),
                  View3(controller: controller,index: index,),
                ],
              ),
            ),


            GestureDetector(
              onPanUpdate: (swipe){
                if (swipe.delta.dx > 0) {
                  controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.linear);

                }

                // Swiping in left direction.
                if (swipe.delta.dx < 0) {
                   controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);

                }
                if(index == 0 || index > 0 ){

                }else{
                  if(index == 2 || index < 2){

                  }
                }

              },
              child: Stack(
                children: [
                  Image.asset('assets/curve.png',height: 260,width: double.infinity,fit: BoxFit.fill,),

                  Column(
                    children: [
                      Gap(49.h),
                      index == 0? Center(child: Text('Experience all \n RCCG‘s  Programs',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))):index == 1?Center(child: Text('Connect, Learn \n And Grow',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))): Center(child: Text('Explore more \n Features',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))),


                      Gap(18.h),
                      index == 0?  Center(child: Text('Get access to all RCCG’s Live and previous\n programs  both in audio and video',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w400,color: LightAppTheme.primary2,height: 1.5))):index == 1?Center(child: Text('Stay connected with RCCG’s Manuals, \n Events, Bible, Calendar and  Prayer tracker.',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w400,color: LightAppTheme.primary2,height: 1.5))):Center(child: Text('Enjoy more features such as accommodation,\n christian movies & songs, Dove TV, map and  many more.',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w400,color: LightAppTheme.primary2,height: 1.5))),
                      Gap(14.h),
                      AnimatedSmoothIndicator(
                        activeIndex:  index,
                        count: 3,
                        effect:  ExpandingDotsEffect(
                            dotHeight: 8.h,
                            dotWidth: 8.w,
                            activeDotColor: LightAppTheme.primaryColor,
                            dotColor: LightAppTheme.primary5
                        ),
                      ),
                      Gap(14.h),

                      Padding(
                        padding: const EdgeInsets.only(left:20.0,right: 20),
                        child: AppButton(
                          width:
                          double.infinity,
                          onTap: (){
                            controller.nextPage(duration: Duration(milliseconds: 10), curve: Curves.bounceIn);
                            if(index ==2){
                              Navigator.pushNamed(context, Authentication.route);
                            }
                          },
                          title: 'Next',
                        ),
                      ),

                    ],
                  )
                  //Image.asset('assets/curve.png',height: 227,width: double.infinity,fit: BoxFit.fill,),


                ],
              ),
            ),

            Gap(9.h),
          ],
        ),
      ),
    );
  }
}

class View1 extends StatelessWidget {
  final controller;
  final int? index;
  const View1({
    Key? key,this.controller,this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(60.h),
        Image.asset('assets/onb1.png',width: 257.w,height: 333.h,),
       // Gap(19.h),
        // Stack(
        //   children: [
        //     Image.asset('assets/curve.png',height: 227,width: double.infinity,fit: BoxFit.fill,),
        //
        //     Column(
        //       children: [
        //         Gap(49.h),
        //         index == 0? Center(child: Text('Experience all \n RCCG‘s  Programs',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))):index == 1?Center(child: Text('Connect, Learn And Grow',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))): Center(child: Text('Explore more \n Features',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))),
        //
        //
        //         Gap(18.h),
        //          Center(child: Text('Get access to all RCCG’s Live and previous \n programs  both in audio and video',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w400,color: LightAppTheme.primary2,height: 1.5))),
        //
        //
        //       ],
        //     )
        //
        //   ],
        // ),

      ],
    );
  }
}

class View2 extends StatelessWidget {
  final controller;
  final int? index;
  const View2({
    Key? key,this.controller,this.index
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(60.h),
        Image.asset('assets/onb2.png',width: 257.w,height: 333.h,),

       // Gap(19.h),
        // Stack(
        //   children: [
        //     Image.asset('assets/curve.png',height: 227,width: double.infinity,fit: BoxFit.fill,),
        //
        //     Column(
        //       children: [
        //         Gap(49.h),
        //         index == 0? Center(child: Text('Experience all \n RCCG‘s  Programs',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))):index == 1?Center(child: Text('Connect, Learn \n And Grow',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))): Center(child: Text('Explore more \n Features',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))),
        //
        //
        //         Gap(18.h),
        //        Center(child: Text('Stay connected with RCCG’s Manuals, \n Events, Bible, Calendar and  Prayer tracker.',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w400,color: LightAppTheme.primary2,height: 1.5)))
        //
        //
        //       ],
        //     )
        //
        //   ],
        // ),
      ],
    );
  }
}

class View3 extends StatelessWidget {
  final controller;
  final int? index;
  const View3({
    Key? key,this.controller,this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(60.h),
        Image.asset('assets/onb3.png',width: 257.w,height: 333.h,),

        //Gap(19.h),
        // Stack(
        //   children: [
        //     Image.asset('assets/curve.png',height: 227,width: double.infinity,fit: BoxFit.fill,),
        //
        //     Column(
        //       children: [
        //         Gap(49.h),
        //        Center(child: Text('Explore more \n Features',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))),
        //
        //
        //         Gap(18.h),
        //        Center(child: Text('Enjoy more features such as accommodation, \n christian movies & songs, Dove TV, map and \n many more.',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w400,color: LightAppTheme.primary2,height: 1.5))),
        //
        //
        //       ],
        //     )
        //
        //   ],
        // ),
      ],
    );
  }
}
//
// const double _kCurveHeight = 45;
//
// class ShapesPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final p = Path();
//     p.lineTo(0, size.height - _kCurveHeight);
//     p.relativeQuadraticBezierTo(size.width / 2, 1 * _kCurveHeight, size.width, 1);
//     p.lineTo(size.width, 3);
//     p.close();
//
//     canvas.drawPath(p, Paint()..color = Colors.red);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
//
//
//
// class ClippingClass extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0.0, size.height);
//     var firstEndPoint = Offset(size.width * 0.6, size.height - 30.0);
//     var firstControlPoint = Offset(size.width * 0.23, size.height - 80.0);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);
//     var seccondEndPoint = Offset(size.width, size.height - 67.0);
//     var secondControlPoint = Offset(size.width * .85, size.height - 4);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         seccondEndPoint.dx, seccondEndPoint.dy);
//     path.lineTo(size.width, 0.0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => true;
// }

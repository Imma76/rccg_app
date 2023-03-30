import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/authentication/auth.dart';

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
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left:20.0),
          child: Image.asset("assets/app_logo.png",height: 56.h,width:56.w),
        ),
        actions: [

          GestureDetector(
            onTap: (){
              Navigator.pushNamedAndRemoveUntil(context, Authentication.route, (route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.only(right:25.0),
              child: Center(child: Text('Skip',style:GoogleFonts.inter(color: AppTheme.primaryColor,fontWeight: FontWeight
              .w500))),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                View1(),
                View2(),
                View3(),
              ],
            ),
          ),


          Stack(
            children: [
              Image.asset('assets/curve.png',height: 227,width: double.infinity,fit: BoxFit.fill,),

              Column(
                children: [
                  Gap(49.h),
                 index == 0? Center(child: Text('Experience all \n RCCG‘s  Programs',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))):index == 1?Center(child: Text('Connect, Learn And Grow',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))): Center(child: Text('Explore more \n Features',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))),


                  Gap(18.h),
                index == 0?  Center(child: Text('Get access to all RCCG’s Live and previous programs \n both in audio and video',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppTheme.primary2))):index == 1?Center(child: Text('Stay connected with RCCG’s Manuals, Events, Bible, Calendar and  Prayer tracker.',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppTheme.primary2))):Center(child: Text('Enjoy more features such as accommodation, christian movies & songs, Dove TV, map and  many more.',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppTheme.primary2))),

                  Gap(44.h),
                  ElevatedButton(
                    onPressed: (){
                      controller.nextPage(duration: Duration(milliseconds: 10), curve: Curves.bounceIn);
                      if(index ==2){
                        Navigator.pushNamed(context, Authentication.route);
                      }
                    },
                    child:Text('Next',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 16.sp),),
                    style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                        minimumSize: Size(329.w, 52.h)),),
                ],
              )

            ],
          ),

          Gap(30.h),
        ],
      ),
    );
  }
}

class View1 extends StatelessWidget {
  const View1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Image.asset('assets/onb1.png',width: 257.w,height: 333.h,),
        Gap(20.h),
        // CustomPaint(
        //   painter: ShapesPainter(),
        //   child: Container(height: 50),
        // ),
        // Container(
        //   height: 10,
        //   width: double.infinity,
        //   decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.only(topRight: Radius.circular(200))),
        // ),
        // Stack(
        //   children: [
        //     Image.asset('assets/curve.png',height: 100,width: double.infinity,),
        //
        //     Column(
        //       children: [
        //         Gap(49.h),
        //         Center(child: Text('Experience all \n RCCG‘s  Programs',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))),
        //         Gap(18.h),
        //         Center(child: Text('Get access to all RCCG’s Live and previous programs \n both in audio and video',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppTheme.primary2))),
        //
        //       ],
        //     )
        //
        //   ],
        // ),
       Gap(44.h),
      ],
    );
  }
}

class View2 extends StatelessWidget {
  const View2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/onb2.png',width: 257.w,height: 333.h,),
         Gap(20.h),
        // Center(child: Text('Connect, Learn And Grow',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))),
        // Gap(18.h),
        // Center(child: Text('Stay connected with RCCG’s Manuals, Events, Bible, Calendar and  Prayer tracker.',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppTheme.primary2))),
        // Gap(44.h),
      ],
    );
  }
}

class View3 extends StatelessWidget {
  const View3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Image.asset('assets/onb3.png',width: 257.w,height: 333.h,),
        Gap(20.h),
        // Center(child: Text('Explore more Features',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 28.sp,fontWeight: FontWeight.w700,))),
        // Gap(18.h),
        // Center(child: Text('Enjoy more features such as accommodation, christian movies & songs, Dove TV, map and  many more.',textAlign: TextAlign.center,style:GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppTheme.primary2))),
        // Gap(44.h),
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

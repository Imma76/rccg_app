import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import 'onboarding1.dart';


class Welcome extends StatelessWidget {
  static const route = 'welcome';
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
       height: double.infinity,
        decoration:const BoxDecoration(image: DecorationImage(image: AssetImage('assets/welcome.png', ),fit: BoxFit.fill)),
       child: Center(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Gap(233.h),
             Image.asset('assets/app_logo.png',height: 81.h,width:81.w),
             Gap(127.h),
             Image.asset('assets/welcome_text.png',height: 86.h,width:293.w),
             Gap(23.h),
             Center(child: Text('Hi there!  Welcome to your personalized \n RCCG App, it”s created just to make your \n Rccg membership delightful.',textAlign:TextAlign.center,style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 14.sp,color: AppTheme.white2),)),
             Gap(38.h),
             ElevatedButton(
               onPressed: (){
                 Navigator.pushNamed(context, Onboarding.route);
               },
               child:Text('Get Started'),
               style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                   minimumSize: Size(329.w, 52.h)),),
           ],
         ),
       ),)
    );
  }
}

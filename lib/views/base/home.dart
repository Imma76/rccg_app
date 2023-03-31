import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/widgets/text_fields.dart';

import '../../providers/all_providers.dart';
import '../../themes/app_theme.dart';
import '../authentication/auth.dart';

class Home extends ConsumerStatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left:22.0),
          child: Image.asset('assets/app_logo.png',height: 37.h,width: 37.w,),
        ),
        centerTitle: false,
        actions: [

          Image.asset('assets/search.png',color: AppTheme.black,height: 18.h,width: 18.h,),
          Gap(15),
          Padding(
            padding: const EdgeInsets.only(right:28.0),
            child: Image.asset('assets/notifications.png',color: AppTheme.black,height: 18.h,width: 18.h,),
          )
        ],
        title: Text('Welcome 👋 ',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 18.sp,color: AppTheme.black),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left:27.w,right: 27.w),
          child: Column(
            children: [
              Container(height: 121.h,
                //width: 327.w,

                decoration: BoxDecoration(color:AppTheme.purple2 , borderRadius: BorderRadius
              .circular(10)),
                child: Column(children: [
                  Gap(24.h),
                  Text('Find an RCCG church near you',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 16.sp,color: AppTheme.white)),
               Gap(15.h),
                const Padding(
                  padding: EdgeInsets.only(left:20,right: 20),
                  child: SizedBox(
                      height: 35,
                      child: AppTextField(hintText: 'Enter your location',prefixIcon:Icon(Icons.location_on_outlined,color: AppTheme.grey,),backGroundColor: AppTheme.white,)),
                ),
                ],),),
              Gap(17.h),
              Container(
                height: 72.h,
               // width: 326.w,
                decoration: BoxDecoration(
                  color:AppTheme.lightPurple,borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:21.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(14.h),
                          Text('Go Premium Now 🚀',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.primaryColor)),
                        Text('Access all features',style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12.sp,color: AppTheme.primaryColor))
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right:21.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('View Details',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.primaryColor)),Icon(Icons.arrow_forward_ios_rounded,size: 7,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Gap(27.h),
              Row(
                children: [
                  Text('Features',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.primaryColor)),
                  Spacer(),
                  Text('More',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.primaryColor)),
                  Icon(Icons.arrow_forward_ios_rounded,size: 9,)

                ],
              ),
              Gap(16.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()async {
                        await authController.googleSignIn.disconnect();
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushNamedAndRemoveUntil(context, Authentication.route, (route) => false);

                      },
                      child: Container(

                        height: 70.h,width: 150.w,decoration: BoxDecoration(color:
                      AppTheme.white,borderRadius: BorderRadius.circular(10)),

                        child: Center(
                          child: Row(
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Image.asset('assets/manuals.png',height: 13.h,width: 18.w,),
                            Text('Rccg Manuals',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14.sp,color: AppTheme.primaryColor))
                          ],),
                        ),),
                    ),
                  ),
                  Gap(14.w),
                  Expanded(
                    child: Container(
                      height: 70.h,width: 150.w,decoration: BoxDecoration(color:
                    AppTheme.white,borderRadius: BorderRadius.circular(10)),
                      child: Row(

                        crossAxisAlignment:CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Image.asset('assets/music.png',height: 13.h,width: 18.w,),
                        Text('Rccg Hymns',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14.sp,color: AppTheme.primaryColor))
                      ],),),
                  ),
                ],
              ),
              Gap(15.h),
              Row(
                children: [
                  Expanded(
                    child: Container(

                      child: Center(
                        child: Row(
                          crossAxisAlignment:CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/manuals.png',height: 13.h,width: 18.w,),
                            Text('Rccg Charlets',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14.sp,color: AppTheme.primaryColor))
                          ],),
                      ),
                      height: 70.h,width: 150.w,decoration: BoxDecoration(color:
                    AppTheme.white,borderRadius: BorderRadius.circular(10)),),
                  ),
                  Gap(14.w),
                  Expanded(
                    child: Container(
                      child: Row(

                        crossAxisAlignment:CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/bible.png',height: 13.h,width: 18.w,),
                          Text('My Bible',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14.sp,color: AppTheme.primaryColor))
                        ],),
                      height: 70.h,width: 150.w,decoration: BoxDecoration(color:
                    AppTheme.white,borderRadius: BorderRadius.circular(10)),),
                  ),
                ],
              ),
              Gap(27.h),
              Row(
                children: [
                  Text('Rccg Programs',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: AppTheme.primaryColor)),
                  Spacer(),
                  Text('View all',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppTheme.primaryColor)),


                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}

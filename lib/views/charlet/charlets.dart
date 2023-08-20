import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/charlet/suite_details.dart';

import '../../themes/app_theme.dart';
import '../../widgets/text_fields.dart';
import 'lease_apartment.dart';

class RccgCharlets extends ConsumerStatefulWidget {
  static const route= 'rccg charlets';
  const RccgCharlets({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _RccgCharletsState();
}

class _RccgCharletsState extends ConsumerState<RccgCharlets> {
  @override
  Widget build(BuildContext context) {
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
          title: Text('RCCG Accomodation',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: LightAppTheme.black2))),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 45,
                  width: 326.w,
                  child: AppTextField(
                    hintText: 'Search for accomodation',
                    prefixIcon: Icon(Icons.search, color: LightAppTheme.black),
                    backGroundColor: LightAppTheme.white,
                    borderColor: LightAppTheme.white6,
                  )),
              Gap(10),
              Container(
                height:111.h,
                width:326.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(image: AssetImage('assets/lease.png'))
                ),
                child: Column(
                  children: [
                    Gap(10),
                    Text('Lease your room',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: LightAppTheme.white)),
                    Gap(10),
                    Text('for any important programs on camp',style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 14.sp,color: LightAppTheme.white)),
                Gap(10),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(
                        context, LeaseApartment.route);
                  },
                  child: Container(
                    height:32.h, width: 103.w,
                    decoration: BoxDecoration(color:LightAppTheme.lightPurple2, borderRadius:BorderRadius.circular(31)),
                    child: Center(
                      child: Text('View Details',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: LightAppTheme.primaryColor)),
                    ),),
                )
                  ],
                ),
              ),
          Gap(10),
          ListView.builder(
            itemCount:7,
            shrinkWrap: true,

            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left:28.0, right: 28.0, bottom: 10),
                child: AccomodationCard(),
              );
            }
          )
            ],
          ),
        ),
      ),
    );
  }
}

class AccomodationCard extends StatelessWidget {
  const AccomodationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:165.h,
      width:300.w,
      decoration: BoxDecoration(
          color: LightAppTheme.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Gap(18.w),
        Image.asset('assets/accomodation.png', height: 125.h, width: 100.w,),
        Gap(8.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(22.h),
            Text('RCCG Guest Suites', style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: LightAppTheme.black)),
            Gap(10.h),
            SizedBox(
              height:54.h,
              width: 162.w,
              child: Text('Holiness road,Beside old auditorium centre, Rccg Camp',textAlign: TextAlign.left, style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp,
                  color: LightAppTheme.grey11)),
            ),
            Gap(10.h),
            Row(children: [
              Image.asset('assets/star.png', height: 13.h,width:14.w),
              Text('4.5'), Gap(33.h),   GestureDetector(
                onTap: (){
                  Navigator.pushNamed(
                      context, SuiteDetails.route);
                  showDialog(context: context, builder: (context)=>Dialog(child:Container(
                    height:352.h,
                    width: 324.w,
                    child: Column(
                      children: [
                        Gap(20.h),
                        Image.asset('assets/announcement.png', height:32.h, width: 32.w,),
                        Gap(10.h),
                        Text('Notice',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              color: LightAppTheme.neutralDark,
                              fontSize: 24.sp,)),
                        Gap(10.h),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 276.w,
                            child: Text('Please be informed that the automatic booking feature is under development and coming soon.',textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  color: LightAppTheme.grey11,
                                  fontSize: 14.sp,)),
                          ),
                        ),  Gap(10.h),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 276.w,
                            child: Text('For now, kindly call the provided contact number or visit the venue to book an apartment.',textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  color: LightAppTheme.grey11,
                                  fontSize: 14.sp,)),
                          ),
                        ),
                        Gap(20.h),
                        Center(
                          child: ElevatedButton(
                            onPressed: ()async {
                              // Navigator.pushNamed(context, VerifyEmail.route);
                              // await authController.signUp();
                              Navigator.pop(context);

                            },
                            child:  Text('I Understand', style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              color: LightAppTheme.primaryColor,
                              fontSize: 16.sp,)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: LightAppTheme.white,
                                side: BorderSide(color: LightAppTheme.primaryColor),
                                shape: RoundedRectangleBorder(

                                    borderRadius: BorderRadius.circular(40)),
                                maximumSize: Size(324.w, 352.h)),
                          ),
                        ),
                      ],
                    ),
                  ),));

                },
                child: Container(
                  height:32.h, width: 103.w,
                  decoration: BoxDecoration(color:LightAppTheme.lightPurple2, borderRadius:BorderRadius.circular(31)),
                  child: Center(
                    child: Text('View Details',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: LightAppTheme.primaryColor)),
                  ),),
              )
            ],)
          ],
        )
      ],),

    );
  }
}

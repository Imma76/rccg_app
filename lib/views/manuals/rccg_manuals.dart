import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/manuals/read_manuals.dart';

import '../../themes/app_theme.dart';
import '../../widgets/text_fields.dart';

class RccgManual extends ConsumerStatefulWidget {
  static const route = 'rccg manual';

  const RccgManual({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _RccgManualState();
}

class _RccgManualState extends ConsumerState<RccgManual> {
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
          title: Text('RCCG Manual',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: LightAppTheme.black2))),

      body: Padding(
        padding:  EdgeInsets.only(left:20.0.w,right: 20.w),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: 23.w, right: 23.w),
            child:  SizedBox(
                height: 45,
                child: AppTextField(
                  hintText: 'Search for a RCCG Manual',
                  prefixIcon: Icon(Icons.search, color: LightAppTheme.black),
                  backGroundColor: LightAppTheme.white,
                  borderColor: LightAppTheme.white6,
                )),
          ),
          Gap(45.h),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ManualCard(),
                );
              }
            ),
          ),
        ],),
      ),
    );
  }
}

class ManualCard extends StatelessWidget {
  const ManualCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ReadManuals.route );
      },
      child: Container(
        width:350.w,
        height:120.h,
        padding: EdgeInsets.only(top: 12.h,left: 7.w),
        decoration: BoxDecoration(
            color:LightAppTheme.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 13),
                blurRadius: 25,
                color: Color.fromARGB(14, 14, 14, 0),
              ),
            ],
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Column(children: [
              ClipRRect(
                  borderRadius:BorderRadius.circular(10),
                  child: Image.asset('assets/open_heavens.png',width: 88.w,height:96.h,))
            ],),
            Gap(11.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 173.w,
                        child: Text('RCCG Open Heavens Manual',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: LightAppTheme.primaryColor))),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: LightAppTheme.primaryColor,

                      ),
                      onPressed: () {
                    //    Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Gap(6.h),

              ],
            ),

          ],
        ),
      ),
    );
  }
}

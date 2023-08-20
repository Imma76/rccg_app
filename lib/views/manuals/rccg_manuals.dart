import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rccg_app/views/manuals/read_manuals.dart';

import '../../providers/all_providers.dart';
import '../../themes/app_theme.dart';
import '../../widgets/text_fields.dart';
import '../base/home.dart';

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
          centerTitle: false,
          title: Text('RCCG Manuals',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: LightAppTheme.black2))),

      body: Padding(
        padding:  EdgeInsets.only(left:20.0.w,right: 20.w),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: 23.w, right: 23.w),
            child:  const SizedBox(
                height: 45,
                child: AppTextField(
                  hintText: 'Search for a RCCG Manual',
                  prefixIcon: Icon(Icons.search, color: LightAppTheme.black),
                  backGroundColor: LightAppTheme.white,
                  borderColor: LightAppTheme.white6,
                )),
          ),
          Gap(45.h),
          Padding(
            padding: EdgeInsets.only(left: 07.w, right: 07.w),
            child: SizedBox(
              height: 35.h,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Gap(
                    20.w,
                  ),
                  const ManualChoiceButton(
                    title: 'English',
                    index: 0,
                  ),
                  const Gap(10),
                  const ManualChoiceButton(
                    title: 'Yoruba',
                    index: 1,
                  ),
                  const Gap(10),
                  const ManualChoiceButton(
                    title: 'Igbo',
                    index: 2,
                  ),
                  const Gap(10),
                  const ManualChoiceButton(
                    title: 'Hausa',
                    index: 3,
                  ),

                  Gap(
                    20.w,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context,index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
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

class ManualCard extends ConsumerWidget {
  const ManualCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
      final homeController = ref.watch(homeProvider);
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ReadManuals.route );
      },
      child: Container(
        width:350.w,
        height:65.h,
        padding: EdgeInsets.only(top: 12.h,left: 7.w),
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
          children: [


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Gap(20),
                ClipRRect(
                    borderRadius:BorderRadius.circular(10),
                    child: Image.asset('assets/open_heavens.png',width: 32.w,height:38.h,)),
                Gap(10),
                SizedBox(
                    width: 173.w,
                    child: Text('RCCG Open Heavens',style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14.sp,color: LightAppTheme.black))),

                if(homeController.currentManualChoice==0)
                Container(
                  height:32.h, width: 72.w,
                  decoration: BoxDecoration(color:LightAppTheme.lightPurple2, borderRadius:BorderRadius.circular(31)),
                  child: Center(
                    child: Text('English',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: LightAppTheme.primaryColor)),
                  ),
                ),
                if(homeController.currentManualChoice==1)
                  Container(
                    height:32.h, width: 72.w,
                    decoration: BoxDecoration(color:LightAppTheme.lightPurple2, borderRadius:BorderRadius.circular(31)),
                    child: Center(
                      child: Text('Yoruba',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: LightAppTheme.primaryColor)),
                    ),
                  ),
                if(homeController.currentManualChoice==2)
                  Container(
                    height:32.h, width: 72.w,
                    decoration: BoxDecoration(color:LightAppTheme.lightPurple2, borderRadius:BorderRadius.circular(31)),
                    child: Center(
                      child: Text('Igbo',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: LightAppTheme.primaryColor)),
                    ),
                  ),
                if(homeController.currentManualChoice==3)
                  Container(
                    height:32.h, width: 72.w,
                    decoration: BoxDecoration(color:LightAppTheme.lightPurple2, borderRadius:BorderRadius.circular(31)),
                    child: Center(
                      child: Text('Hausa',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: LightAppTheme.primaryColor)),
                    ),
                  ),
              ],
            ),
            Gap(6.h),

          ],
        ),
      ),
    );
  }
}
class ManualChoiceButton extends ConsumerWidget {
  final String? title;
  final int? index;
  const ManualChoiceButton({Key? key, this.title, this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final homeController = ref.watch(homeProvider);
    final programController = ref.watch(programProvider);
    return GestureDetector(
        onTap: () async {
          homeController.changeCurrentManualChoice(index!);
        },
        child: Container(
          decoration: BoxDecoration(
              color: homeController.currentManualChoice == index
                  ? LightAppTheme.primaryColor
                  : LightAppTheme.white,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: LightAppTheme.primaryColor.withOpacity(0.6))),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, top: 4, bottom: 4),
            child: Center(
              child: Text('$title',
                  style: GoogleFonts.inter(
                      color: homeController.currentManualChoice == index
                          ? LightAppTheme.white
                          : LightAppTheme.primaryColor.withOpacity(0.6))),
            ),
          ),
        ));
  }
}


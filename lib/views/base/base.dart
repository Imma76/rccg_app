import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/app_theme.dart';
import '../tv/dove_tv.dart';
import 'home.dart';

class Base extends ConsumerStatefulWidget {
  static const route = 'base';
  const Base({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _BaseState();
}

class _BaseState extends ConsumerState<Base> {
  int currentIndex = 0;
  List<Widget> widgetList=[
    Home(),
    DoveTv(),
    Home(),
    Home(),
    Home(),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[currentIndex],
      bottomNavigationBar:
          BottomNavigationBar(
            selectedItemColor: LightAppTheme.primaryColor,
              currentIndex: currentIndex,
              onTap: (value){
                setState(() {
                  currentIndex= value;
                });
              },
              type: BottomNavigationBarType.fixed, items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',color: currentIndex==0?LightAppTheme.purple:null,
              height: 19.h,
              width: 19.w,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/tv.png',color: currentIndex==1?LightAppTheme.purple:null, height: 19.h, width: 19.w),
            label: 'Dove Tv'),
        BottomNavigationBarItem(
            icon:  Image.asset('assets/bible.png',color: currentIndex==2?LightAppTheme.purple:null, height: 19.h, width: 19.w),
            label: 'Bible'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search,size: 19,color: currentIndex==2?LightAppTheme.purple:null, ),
            label: 'Discover'),
            BottomNavigationBarItem(
            icon: Image.asset('assets/more.png', color: currentIndex==4?LightAppTheme.purple:null,height: 19.h, width: 19.w,),
            label: 'Profile')
      ]),
    );
  }
}

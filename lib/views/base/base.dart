import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/app_theme.dart';
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

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[currentIndex],
      bottomNavigationBar:
          BottomNavigationBar(
            selectedItemColor: AppTheme.primaryColor,
              currentIndex: currentIndex,
              onTap: (value){
                setState(() {
                  currentIndex= value;
                });
              },
              type: BottomNavigationBarType.fixed, items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',color: currentIndex==0?AppTheme.purple:null,
              height: 19.h,
              width: 19.w,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/tv.png',color: currentIndex==1?AppTheme.purple:null, height: 19.h, width: 19.w),
            label: 'Dove Tv'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              child: Icon(
                Icons.add,color: AppTheme.white,
              ),
              backgroundColor: AppTheme.purple,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Image.asset('assets/bible.png',color: currentIndex==3?AppTheme.purple:null, height: 19.h, width: 19.w),
            label: 'Bible'),
            BottomNavigationBarItem(
            icon: Image.asset('assets/profile.png', color: currentIndex==4?AppTheme.purple:null,height: 19.h, width: 19.w,),
            label: 'Profile')
      ]),
    );
  }
}

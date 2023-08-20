import 'package:flutter/material.dart';


class AppThemeChange extends ChangeNotifier {

  bool light = true;
  var
  appTheme= LightAppTheme();
  changeTheme(){
    if(light == true){
      appTheme=LightAppTheme();
      notifyListeners();
    }else{
      appTheme= DarkAppTheme() as LightAppTheme;
      notifyListeners();
    }
  }


}

class LightAppTheme {
  String theme = 'light';

  changeTheme(String newTheme){
    theme = newTheme;
  }
  static const Color white = Colors.white;
  static const Color dark = Color(0xff1F2937);
  static const Color dark2 = Color(0xff2F394E);
  static const Color dark3 = Color(0xff111827);
  static const Color white2 = Color(0xffBEBEBE);
  static const Color primaryColor = Color(0xff28166F);
  static const Color primary2 = Color(0xff171B2E);
  static const Color lightBlue = Color(0xffF8F9FB);
  static const Color black3 = Color(0xff333333);
  static const Color black4 = Color(0xff1A1A1A);
  static const Color grey = Color(0xff7E8392);
  static const Color white3 = Color(0xffBBC0DB);
  static const Color shadowColor =  Color.fromRGBO(13, 13, 13, 0.05000000074505806);
  static const Color white4 = Color(0xffDADEE3);
  static const Color midGrey = Color(0xffE6E8EC);
  static const Color black = Colors.black;
  static const Color white5 = Color(0xff2C1E5F);
  static const Color primary4 =Color(0xff121F3E);
  static const Color grey2 = Color(0xffEEF3F8);
  static const Color black2 = Color(0xff1A1C1E);
  static const Color grey3 = Color(0xff9CA3AF);
  static const Color purple = Color(0xff5D5FEF);
  static const Color purple2 = Color(0xff261C4B);
  static const Color lightPurple = Color(0xffDBD5F2);
  static const Color grey4 = Color(0xffB9BBBD);
  static const Color white6 =Color(0xffEDEDED);
  static const Color grey5 = Color(0xffEEEFF0);
  static const Color grey6 = Color(0xff818487);
  static const Color grey7 = Color(0xffD2CACA);
  static const Color grey8 = Color(0xff8D98AF);
  static const Color lightBlue2 = Color(0xff33B5E7);
  static const Color primary5 = Color(0xffD6CAFC);
  static const Color purple3 = Color(0xff9783DC);
  static const Color lightPurple2 = Color(0xffF7F5FF);
  static const Color neutralDark = Color(0xff333333);
  static const Color lightPurple3 = Color(0xffEBEEF7);
  static const Color lightGreen = Color(0xffE0F2F4);
  static const Color lightGreen2 = Color(0xffE7F2EC);
  static const Color lightOrange = Color(0xffF4EEF0);
  static const Color darkOrange = Color(0xffFF8801);
  static const Color lightBrown = Color(0xffF1F2EE);
  static const Color grey9 =Color(0xffD1D1D1);
  static const Color darkBrown = Color(0xffDBAD7A);
  static const Color grey10  = Color(0xff858585);
  static const grey11 = Color(0xff555555);
  static const Color transparent = Colors.transparent;




}

class DarkAppTheme {
  String theme = 'light';

  changeTheme(String newTheme){
    theme = newTheme;
  }
  Color white = Colors.black;
  Color white2 =  Color(0xff1A1C1E);
  Color primaryColor = Color(0xff28166F);
  Color primary2 = Color(0xff171B2E);
  Color lightBlue = Color(0xffF8F9FB);
  Color grey = Color(0xff7E8392);
  Color white3 = Color(0xffBBC0DB);
  Color white4 = Color(0xffDADEE3);
  Color midGrey = Color(0xffE6E8EC);
  Color black = Colors.white;
  Color white5 = Color(0xff2C1E5F);
  Color primary4 =Color(0xff121F3E);
  Color grey2 = Color(0xffEEF3F8);
  Color black2 =Color(0xffBEBEBE);
  Color grey3 = Color(0xff9CA3AF);
  Color purple = Color(0xff5D5FEF);
  Color purple2 = Color(0xff261C4B);
  Color lightPurple = Color(0xffDBD5F2);
  Color grey4 = Color(0xffB9BBBD);
  Color white6 =Color(0xffEDEDED);
  Color grey5 = Color(0xffEEEFF0);
  Color grey6 = Color(0xff818487);
  Color grey7 = Color(0xffD2CACA);
  Color grey8 = Color(0xff8D98AF);
  Color transparent = Colors.transparent;


}
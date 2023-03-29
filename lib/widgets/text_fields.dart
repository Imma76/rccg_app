
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/app_theme.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Color? backGroundColor;
  final Widget? prefixIcon;
  const AppTextField({
    Key? key,this.hintText,this.controller,this.backGroundColor,this.prefixIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppTheme.primaryColor,

      decoration: InputDecoration(
        fillColor: backGroundColor,
          filled: backGroundColor!=null?true:false,
          prefixIcon: prefixIcon
          ,
          contentPadding:
          backGroundColor== null?EdgeInsets.symmetric(vertical: 1, horizontal: 10):null,
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
              color: AppTheme.white4,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.white2),
              borderRadius: BorderRadius.circular(28)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.white2),
              borderRadius: BorderRadius.circular(28)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.white2),
              borderRadius: BorderRadius.circular(28))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static const String fontFamily = 'Ag';

  // ===== Overline =====
  static TextStyle agBoldOverline({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    color: color,
  );

  // ===== H1 – H4 =====
  static TextStyle agBoldH1({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );

  static TextStyle agBoldH2({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );

  static TextStyle agBoldH3({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.sp,
    height: 33.h / 20.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );

  static TextStyle agRegularH3({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle agBoldH4({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );

  // ===== Label =====
  static TextStyle agRegularLabel({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    height: 26.h / 16.sp,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle agSemiBoldLabel({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    height: 27.h / 16.sp,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle agBoldLabel({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    height: 26.h / 16.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );

  // ===== Button =====
  static TextStyle agBoldButton({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );

  // ===== Display =====
  static TextStyle agRegularDisplay({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    height: 25.h / 14.sp,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle agSemiBoldDisplay({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    height: 25.h / 16.sp,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle agBoldDisplay({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    height: 25.h / 16.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );

  // ===== Body / Content =====
  static TextStyle agRegularBody({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 13.sp,
    height: 24.h / 13.sp,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle agRegularContent({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    height: 24.h / 14.sp,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle agSemiBoldContent({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    height: 24.h / 14.sp,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle agBoldContent({required Color color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    height: 24.h / 14.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );
}
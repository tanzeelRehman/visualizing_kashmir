import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static Color scaffoldBackgroundColor = const Color(0xff38373d);
  static Color canvasColor = const Color(0xff474649);
  static Color primaryColor = const Color(0xfff99506);
  static Color primaryIsDark = const Color(0xfff97316);

  static TextStyle subtitle1 = const TextStyle(
      fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500);
  static TextStyle subtitle2 =  TextStyle(
      fontSize: 12.sp, color: Colors.grey, fontWeight: FontWeight.w400);

  static TextStyle heading1 = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  static BoxDecoration roundedContainerDecoration = BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(2, 3))
      ],
      borderRadius: BorderRadius.circular(15),
      color: canvasColor);

  static BoxDecoration primaryButtonDecoration = BoxDecoration(
      color: AppTheme.primaryColor, borderRadius: BorderRadius.circular(30));

  static BoxDecoration neumorphaicContainerDecoration = BoxDecoration(
      color: canvasColor,
      borderRadius: BorderRadius.circular(50),
      boxShadow: const [
        // Shadow for top-left corner
        BoxShadow(
          color: Color(0xff3c3c3e),
          offset: Offset(
            5,
            5,
          ),
          blurRadius: 5.5,
          spreadRadius: -1,
        ),
        // Shadow for bottom-right corner
        BoxShadow(
          color: Color(0xff525154),
          offset: Offset(-5, -5),
          blurRadius: 5.5,
          spreadRadius: -1,
        ),
      ]);
}

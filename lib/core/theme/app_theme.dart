import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  //* Light Theme ========================================================>
  //*<!-------------------------------------------------------------------->
  static final lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color(0xffF8F8F8),
      canvasColor: Colors.white,
      cardColor: const Color(0xfff5e0e0),
      primaryColor: const Color(0xffcf0000),
      textTheme: TextTheme(
          titleMedium: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          titleSmall: TextStyle(
              fontSize: 15.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black54),
          bodySmall: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black54)));

  //? Const Decoration ========================================================>
  //?<!------------------------------------------------------------------------>
  static BoxDecoration roundedContainerDecoration = BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Color(0xffefc6c6), blurRadius: 5, offset: Offset(5, 5))
      ],
      borderRadius: BorderRadius.circular(15),
      color: Colors.white);
  static BoxDecoration roundedContainerWithoutShadowDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10), color: const Color(0xfff5e0e0));

  // static BoxDecoration primaryButtonDecoration = BoxDecoration(
  //     color: AppTheme.primaryColor, borderRadius: BorderRadius.circular(30));
}

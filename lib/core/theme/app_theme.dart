import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //* Light Theme ========================================================>
  //*<!-------------------------------------------------------------------->
  static final lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color(0xffF8F8F8),
      canvasColor: Colors.white,
      cardColor: const Color(0xfff5e0e0),
      primaryColor: const Color(0xffcf0000),
      primaryColorDark: const Color(0xff282a41),
      textTheme: TextTheme(
          titleMedium: GoogleFonts.outfit().copyWith(
              color: const Color(0xff424242),
              fontSize: 22.sp,
              fontWeight: FontWeight.bold),
          titleSmall: GoogleFonts.outfit().copyWith(
              color: const Color(0xff424242),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.outfit().copyWith(
              color: const Color(0xff6d6d6d),
              fontSize: 15.sp,
              fontWeight: FontWeight.normal),
          bodySmall: GoogleFonts.outfit().copyWith(
              color: const Color(0xff6d6d6d),
              fontSize: 13.sp,
              fontWeight: FontWeight.normal)));

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

  static BoxDecoration roundedContainerDecorationwithLessShadows =
      BoxDecoration(boxShadow: [
    BoxShadow(
        color: const Color(0xffefc6c6).withOpacity(.3),
        blurRadius: 5,
        offset: const Offset(1, 1))
  ], borderRadius: BorderRadius.circular(15), color: Colors.white);

  static BoxDecoration roundedContainerDecorationwithDarkLessShadows =
      BoxDecoration(boxShadow: [
    BoxShadow(
        color: const Color(0xff6d6d6d).withOpacity(.3),
        blurRadius: 5,
        offset: const Offset(1, 1))
  ], borderRadius: BorderRadius.circular(15), color: Colors.white);

  static BoxDecoration searchCardDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12.r)),
      border:
          Border.all(color: const Color(0xff6d6d6d).withOpacity(.2), width: .5),
      color: Colors.white);
  // static BoxDecoration primaryButtonDecoration = BoxDecoration(
  //     color: AppTheme.primaryColor, borderRadius: BorderRadius.circular(30));
}

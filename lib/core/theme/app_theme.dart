import 'package:flutter/material.dart';

class AppTheme {
  //* Light Theme ========================================================>
  //*<!-------------------------------------------------------------------->
  static final lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color(0xfff3f1fc),
      canvasColor: Colors.white,
      cardColor: const Color(0xff282a41),
      primaryColor: const Color(0xff6245f9),
      textTheme: const TextTheme(
          titleMedium: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black12)));

  //? Const Decoration ========================================================>
  //?<!------------------------------------------------------------------------>
  static BoxDecoration roundedContainerDecoration = BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(2, 3))
      ],
      borderRadius: BorderRadius.circular(15),
      color: const Color(0xfff3f1fc));

  // static BoxDecoration primaryButtonDecoration = BoxDecoration(
  //     color: AppTheme.primaryColor, borderRadius: BorderRadius.circular(30));
}

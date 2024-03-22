import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PrimaryContinueButton extends StatelessWidget {
  String text;
  Function() ontap;
  double? width;
  bool isWhite;
  PrimaryContinueButton({
    super.key,
    this.width,
    required this.text,
    required this.ontap,
    required this.isWhite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        height: 50.h,
        width: width ?? double.infinity,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: isWhite ? Get.theme.canvasColor : Get.theme.primaryColor),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                color: isWhite ? Get.theme.primaryColor : Get.theme.canvasColor,
                fontSize: 20.sp),
          ),
        ),
      ),
    );
  }
}

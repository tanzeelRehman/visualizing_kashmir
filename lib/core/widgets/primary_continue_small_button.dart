import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PrimaryContinueSmallButton extends StatelessWidget {
  final String title;
  final Function() ontap;
  final bool isNext;
  final double? iconSize;
  final EdgeInsets? padding;
  const PrimaryContinueSmallButton({
    super.key,
    required this.title,
    required this.ontap,
    required this.isNext,
    this.iconSize = 20,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Get.theme.primaryColor),
        child: Row(
          children: [
            Text(
              title,
              style: Get.textTheme.bodySmall!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            isNext
                ? Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: iconSize,
                      )
                    ],
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

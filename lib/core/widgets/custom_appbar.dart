import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';

import 'package:visualizing_kashmir/core/widgets/custom_line.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {super.key,
      this.screeData,
      required this.title,
      this.leading,
      this.subTitle,
      this.trailing,
      this.backgroundColor,
      this.focusNode,
      this.onBack});

  MediaQueryData? screeData;
  final String title;
  Widget? trailing;
  Widget? leading;
  String? subTitle;
  Color? backgroundColor;
  Function? onBack;
  FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor ?? Colors.transparent,
      child: SizedBox(
          width: screeData == null
              ? MediaQuery.of(context).size.width
              : screeData!.size.width,
          height: 120.h,
          child: Padding(
            padding:
                EdgeInsetsDirectional.only(start: 12.w, end: 12.w, top: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45.h,
                  width: 40.w,
                  decoration: AppTheme.roundedContainerDecoration
                      .copyWith(color: Colors.white),
                  child: IconButton(
                      iconSize: 55,
                      onPressed: () async {
                        if (focusNode != null) {
                          focusNode!.unfocus();
                          await Future.delayed(
                              const Duration(milliseconds: 200));
                        }

                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 25.sp,
                      )),
                ),
                Text(
                  title.tr,
                  style: Get.theme.textTheme.titleMedium!.copyWith(
                      color: Get.theme.primaryColor,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          )),
    );
  }
}

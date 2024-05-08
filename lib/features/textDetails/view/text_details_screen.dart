// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/helper/getPreferedSizeAppbar.dart';

class TextDetailsScreen extends StatelessWidget {
  const TextDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic args = Get.arguments;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: getPreferedSizeAppbar(
          "",
        ),
        body: Directionality(
          textDirection: Directionality.of(context) == TextDirection.rtl
              ? TextDirection.ltr
              : TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.3,
                      width: Get.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          AppAssets.bookCover,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Text(
                    //   "January 1, 2023",
                    //   style: Get.textTheme.bodyMedium,
                    // ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      args[0]['heading'],
                      style: Get.textTheme.titleSmall,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      args[1]['desc'],
                      style: Get.textTheme.bodySmall,
                    ),
                  ]),
            ),
          ),
        ));
  }
}

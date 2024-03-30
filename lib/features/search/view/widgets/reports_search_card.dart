import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';

class ReportsSearchCard extends StatelessWidget {
  const ReportsSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          children: [
            Container(
              width: Get.width * 0.9,
              height: 180.h,
              decoration: AppTheme.searchCardDecoration,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 120.w, bottom: 20.h),
                    child: SizedBox(
                      height: 130.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Most Spoken Languages",
                            style: Get.textTheme.bodyMedium!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Annual Survey 2019",
                            style: Get.textTheme.bodySmall!,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: Get.width * 0.45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Read More",
                                  style: Get.textTheme.bodySmall!.copyWith(
                                      color: Get.theme.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Positioned(
          bottom: 0,
          left: 20,
          child: Image.asset(
            height: 150.h,
            width: 100.w,
            AppAssets.bookCover,
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}

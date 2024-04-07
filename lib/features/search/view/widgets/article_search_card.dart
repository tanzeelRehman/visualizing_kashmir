import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';

class ArticleSearchCard extends StatelessWidget {
  const ArticleSearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          children: [
            Container(
              width: Get.width * 0.9,
              height: 160.h,
              decoration: AppTheme.searchCardDecoration,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daily Buisness paper",
                        style: Get.textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "By: James Harton",
                        style: Get.textTheme.bodySmall!,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppPages.textDetailsPage);
                        },
                        child: Text(
                          "Read_article".tr,
                          style: Get.textTheme.bodySmall!.copyWith(
                              color: Get.theme.primaryColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: -30,
          right: 30,
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

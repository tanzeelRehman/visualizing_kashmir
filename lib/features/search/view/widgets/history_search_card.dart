import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continue_small_button.dart';

class BooksSearchCard extends StatelessWidget {
  const BooksSearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          height: 160.h,
          width: 100.w,
          AppAssets.bookCover,
          fit: BoxFit.fitHeight,
        ),
        Container(
          width: 220.w,
          height: 120.w,
          decoration: AppTheme.searchCardDecoration.copyWith(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r))),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Secret of getting your job",
                    style: Get.textTheme.bodyMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "By: James Harton",
                    style: Get.textTheme.bodySmall!.copyWith(
                      color: Get.theme.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  PrimaryContinueSmallButton(
                    title: "Open".tr,
                    isNext: false,
                    ontap: () {
                      Get.toNamed(AppPages.textDetailsPage);
                    },
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

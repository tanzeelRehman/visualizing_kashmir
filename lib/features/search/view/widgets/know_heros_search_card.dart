import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continue_small_button.dart';

class KnowHerosSearchCard extends StatelessWidget {
  const KnowHerosSearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: Get.width * 0.75,
              height: 160.h,
              decoration: AppTheme.searchCardDecoration,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Syed Ali Geelani",
                        style: Get.textTheme.titleSmall!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "1992 - 2021",
                        style: Get.textTheme.bodySmall!,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                        width: Get.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            PrimaryContinueSmallButton(
                                title: "Read_more".tr,
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 10.w),
                                ontap: () {},
                                isNext: false),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20.w,
                  )
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: -30,
          left: 0,
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset(
                height: 150.h,
                width: 150.w,
                AppAssets.bookCover,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

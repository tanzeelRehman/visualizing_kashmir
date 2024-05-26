// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/constants/app_url.dart';
import 'package:visualizing_kashmir/core/globle/globle.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';

class ReportsSearchCard extends StatelessWidget {
  final String heading;
  final String description;
  final String imagePath;
  final Function() onread;
  const ReportsSearchCard({
    super.key,
    required this.heading,
    required this.description,
    required this.onread,
    required this.imagePath,
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
              height: 180.h,
              decoration: AppTheme.searchCardDecoration,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 120.w, bottom: 20.h),
                    child: SizedBox(
                      height: 130.h,
                      width: Get.width * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              heading.length > 30
                                  ? '${heading.substring(0, 30)}...'
                                  : heading,
                              style: Get.textTheme.bodyMedium!.copyWith(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            //  width: Get.width * 0.5,
                            // height: 55.h,
                            child: Text(
                              description.length > 80
                                  ? '${description.substring(0, 80)}...'
                                  : description,
                              style: Get.textTheme.bodySmall!
                                  .copyWith(fontSize: 10.sp),
                            ),
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
                                GestureDetector(
                                  onTap: onread,
                                  child: Text(
                                    "Read_more".tr,
                                    style: Get.textTheme.bodySmall!.copyWith(
                                        color: Get.theme.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                  ),
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
            child: CachedNetworkImage(
              height: 150.h,
              width: 100.w,
              fit: BoxFit.cover,
              imageUrl: '${AppUrl.bunnyBaseUrl}$imagePath',
              placeholder: (context, url) => Padding(
                padding: EdgeInsets.all(30.sp),
                child: SizedBox(
                  width: 40.w,
                  height: 60.h,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballPulse,
                    colors: [Get.theme.primaryColor],
                    strokeWidth: 2,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                height: 190.h,
                width: 110.w,
                color: const Color(0xffe9e9e9),
                child: Icon(
                  Icons.image,
                  color: const Color(0xffd3d3d3),
                  size: 55.sp,
                ),
              ),
            )),
      ],
    );
  }
}

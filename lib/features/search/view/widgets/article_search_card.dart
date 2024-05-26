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

class ArticleSearchCard extends StatelessWidget {
  final String heading;
  final String publishedBy;
  final String image;
  final Function() onread;
  const ArticleSearchCard({
    super.key,
    required this.heading,
    required this.publishedBy,
    required this.image,
    required this.onread,
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
                        heading,
                        style: Get.textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "By: $publishedBy",
                        style: Get.textTheme.bodySmall!,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      GestureDetector(
                        onTap: onread,
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
          child: CachedNetworkImage(
            height: 150.h,
            width: 100.w,
            fit: BoxFit.cover,
            imageUrl: '${AppUrl.bunnyBaseUrl}$image',
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
          ),
        ),
      ],
    );
  }
}

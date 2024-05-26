// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/constants/app_url.dart';
import 'package:visualizing_kashmir/core/globle/globle.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continue_small_button.dart';

class BooksSearchCard extends StatelessWidget {
  final String title;
  final String authar;
  final String imagePath;
  final Function() open;
  const BooksSearchCard({
    super.key,
    required this.title,
    required this.authar,
    required this.imagePath,
    required this.open,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          height: 190.h,
          width: 110.w,
          fit: BoxFit.fitHeight,
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
        ),
        Container(
          width: 220.w,
          height: 150.w,
          decoration: AppTheme.searchCardDecoration.copyWith(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r))),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * 0.45,
                    //height: 40.sp,
                    child: Text(
                      title.length > 30
                          ? '${title.substring(0, 30)}...'
                          : title,
                      style: Get.textTheme.bodyMedium!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      //  overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "By: $authar",
                    style: Get.textTheme.bodySmall!.copyWith(
                      color: Get.theme.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  PrimaryContinueSmallButton(
                      title: "Open".tr, isNext: false, ontap: open)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

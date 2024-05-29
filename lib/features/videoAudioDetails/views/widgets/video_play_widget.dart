// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logger/logger.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/app_url.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';

class VideoPlayWidget extends StatelessWidget {
  final String title;
  final Function() ontap;
  final String? videoThumbnil;
  const VideoPlayWidget({
    super.key,
    required this.title,
    required this.ontap,
    required this.videoThumbnil,
  });
  @override
  Widget build(BuildContext context) {
    Logger().i('${AppUrl.bunnyBaseUrl}$videoThumbnil');
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: AppTheme.roundedContainerDecorationwithLessShadows,
        height: 120.h,
        width: Get.width * 0.8,
        child: Row(
          children: [
            SizedBox(
              height: 90.h,
              width: 90.w,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CachedNetworkImage(
                        height: 190.h,
                        width: 110.w,
                        fit: BoxFit.cover,
                        imageUrl: '${AppUrl.bunnyBaseUrl}$videoThumbnil',
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
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        height: 90.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.4),
                          //borderRadius: BorderRadius.circular(45.r),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [
                                Color(0xffd3e6e6),
                                Color(0xff63b0b0)
                              ])),
                          child: Icon(
                            size: 15.sp,
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  width: Get.width * 0.5,
                  child: Text(
                    title,
                    style: Get.textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18.sp,
                  color: const Color(0xff6d6d6d),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

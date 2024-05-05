// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/constants/app_url.dart';
import 'package:visualizing_kashmir/core/globle/globle.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continue_small_button.dart';

class KnowHerosSearchCard extends StatelessWidget {
  final String imageUrl;
  final String dob;
  final String name;
  final String death;
  final Function() ontap;
  const KnowHerosSearchCard({
    super.key,
    required this.imageUrl,
    required this.dob,
    required this.name,
    required this.death,
    required this.ontap,
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
                        name,
                        style: Get.textTheme.titleSmall!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "${dob.substring(0, 4)} - ${death.substring(0, 4)}",
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
                                ontap: ontap,
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
              child: CachedNetworkImage(
                  height: 150.h,
                  width: 150.w,
                  fit: BoxFit.cover,
                  imageUrl: '${AppUrl.bunnyBaseUrl}$imageUrl',
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
                  httpHeaders: {'AccessKey': bunnyAcessKey}),
            ),
          ),
        ),
      ],
    );
  }
}

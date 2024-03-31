import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';

class VideoPlayWidget extends StatelessWidget {
  const VideoPlayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: AppTheme.roundedContainerDecorationwithLessShadows,
      margin: EdgeInsets.symmetric(vertical: 5.h),
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
                    child: Container(
                        height: 90.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45.r),
                        ),
                        child: Image.asset(AppAssets.bookCover)),
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
                              Color(0xfffd7575),
                              Color(0xfff64849)
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
              Text(
                "Video 1",
                style: Get.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Subtitle",
                style: Get.textTheme.bodySmall,
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
                Icons.download,
                size: 35.sp,
                color: const Color(0xff6d6d6d),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';

class PDFWidget extends StatelessWidget {
  const PDFWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: AppTheme.roundedContainerDecorationwithLessShadows,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      height: 80.h,
      width: Get.width * 0.8,
      child: Row(
        children: [
          Container(
            height: 50.h,
            width: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45.r),
                gradient: const LinearGradient(
                    colors: [Color(0xfffd7575), Color(0xfff64849)])),
            child: const Icon(
              Icons.picture_as_pdf_sharp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "PDF Title",
                style: Get.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:visualizing_kashmir/features/detail/controller/media_detail_loader_controller.dart';

class GoToPageDialog extends StatelessWidget {
  const GoToPageDialog({
    super.key,
    required this.cont,
  });

  final MediaDetailLoaderController cont;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.3,
      width: Get.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
      decoration: BoxDecoration(
          color: Get.theme.canvasColor,
          borderRadius: BorderRadius.circular(25.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Icon(
                Icons.close,
                color: Get.theme.primaryColor,
              )
            ],
          ),
          Text(
            'Go to page',
            style: Get.textTheme.displayMedium!.copyWith(
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Page Number',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                height: 35.h,
                width: 60.w,
                padding: EdgeInsets.only(left: 5.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.black, width: 1)),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: cont.pageNoController,
                  style: Get.textTheme.bodySmall,
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.only(top: 5.sp),
                    border: InputBorder.none,
                    hintText: 'Page',
                    hintStyle: Get.textTheme.bodySmall,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              GestureDetector(
                onTap: () {
                  print('tapp');
                  cont.pdfViewerController
                      .jumpToPage(int.parse(cont.pageNoController.text));

                  Navigator.pop(context);
                },
                child: Container(
                  height: 40.h,
                  width: 80.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Get.theme.primaryColor),
                  child: Text(
                    'Done',
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

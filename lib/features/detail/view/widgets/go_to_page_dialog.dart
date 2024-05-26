import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      height: Get.height * 0.35,
      width: Get.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
      decoration: BoxDecoration(
          color: Get.theme.canvasColor,
          borderRadius: BorderRadius.circular(25.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Get.theme.primaryColor,
                ),
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
            height: 8.h,
          ),
          SizedBox(
            width: Get.width * 0.8,
            child: TextField(
              cursorColor: Get.theme.primaryColor,
              keyboardType: TextInputType.number,
              controller: cont.pageNoController,
              style: Get.textTheme.bodySmall,
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.only(top: 5.sp),

                enabled: true,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Get.theme.primaryColor)),
                hintText: 'Enter page number',
                hintStyle: Get.textTheme.bodySmall,
              ),
            ),
          ),
          Row(
            children: [
              Text('${cont.pdfViewerController.pageNumber}'),
              Text('/'),
              Text('${cont.pdfViewerController.pageCount}'),
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

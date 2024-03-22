import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:visualizing_kashmir/features/Language/controller/language_controller.dart';

class selectLanguageCard extends StatelessWidget {
  final String value;
  final String name;
  const selectLanguageCard(
      {super.key, required this.value, required this.name});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: Get.find<LanguageController>(),
        builder: (controller) {
          return GestureDetector(
            child: Container(
              width: 100.w,
              height: 110.h,
              decoration: BoxDecoration(
                  color: Get.theme.canvasColor,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                      color: value == controller.selectedLanguage
                          ? Get.theme.primaryColor
                          : Colors.transparent,
                      width: 2.sp)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Radio.adaptive(
                      focusColor: Get.theme.primaryColor,
                      value: value,
                      groupValue: controller.selectedLanguage,
                      onChanged: (val) {
                        controller.changeLanguage(value);
                      }),
                  Text(
                    name,
                    style: Get.theme.textTheme.titleMedium!
                        .copyWith(color: Get.theme.primaryColor),
                  )
                ],
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:visualizing_kashmir/core/globle/globle.dart';
import 'package:visualizing_kashmir/core/helper/saveLanguageSettings.dart';
import 'package:visualizing_kashmir/features/Language/controller/language_controller.dart';

class SelectLanguageCard extends StatelessWidget {
  final String value;
  final String name;
  const SelectLanguageCard(
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
                      activeColor: Get.theme.primaryColor,
                      focusColor: Get.theme.primaryColor,
                      value: value,
                      groupValue: controller.selectedLanguage,
                      onChanged: (val) {
                        controller.changeLanguage(value);
                        if (value == 'ar') {
                          Get.updateLocale(const Locale('ar', 'UAE'));
                          SaveLanguageSettings.saveLanguage('ar', 'UAE');
                        } else if (value == 'ur') {
                          Get.updateLocale(const Locale('ur', 'PK'));
                          SaveLanguageSettings.saveLanguage('ur', 'PK');
                        } else {
                          Get.updateLocale(const Locale('en', 'US'));
                          SaveLanguageSettings.saveLanguage('en', 'US');
                        }
                        print(value);
                      }),
                  Text(
                    name,
                    style: Get.theme.textTheme.titleMedium!.copyWith(
                        color: Get.theme.primaryColor, fontSize: 20.sp),
                  )
                ],
              ),
            ),
          );
        });
  }
}

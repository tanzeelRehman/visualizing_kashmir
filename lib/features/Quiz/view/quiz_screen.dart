// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';

import 'package:visualizing_kashmir/core/helper/getPreferedSizeAppbar.dart';
import 'package:visualizing_kashmir/core/widgets/custom_line.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continue_small_button.dart';
import 'package:visualizing_kashmir/features/Quiz/view/widgets/quiz_option.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: getPreferedSizeAppbar(
          "Quiz",
        ),
        body: Directionality(
          textDirection: Directionality.of(context) == TextDirection.rtl
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Get.height * 0.8,
                        width: Get.width * 0.85,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: Get.theme.canvasColor,
                            borderRadius: BorderRadius.circular(18.r)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("QUESTION".tr),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  "1".tr,
                                  style: Get.textTheme.bodySmall!
                                      .copyWith(fontSize: 35.sp),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                const Text("/5"),
                              ],
                            ),
                            const CustomLine(),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. Tortor massa non odio etiam nunc sed fringilla. Mi vitae et tempor nibh dui egestas nis?",
                              style: Get.textTheme.bodyMedium!.copyWith(
                                color: Get.theme.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            const QuizOption(
                                state: "simple", value: "Option 1"),
                            const QuizOption(
                                state: "sucess", value: "Option 2"),
                            const QuizOption(
                                state: "simple", value: "Option 3"),
                            const QuizOption(state: "wrong", value: "Option 4"),
                            const Spacer(),
                            SizedBox(
                              width: 90.w,
                              child: PrimaryContinueSmallButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 10.h),
                                  title: "Next".tr,
                                  ontap: () {},
                                  isNext: true),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continuebutton.dart';

import 'package:visualizing_kashmir/features/Language/view/widgets/select_Language_card.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: Directionality.of(context) == TextDirection.rtl
            ? TextDirection.ltr
            : TextDirection.ltr,
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Select_Language".tr,
              style: Get.theme.textTheme.titleMedium,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectLanguageCard(value: "en", name: "English"),
                SelectLanguageCard(value: "ur", name: "اردو"),
                SelectLanguageCard(value: "ar", name: "عربي"),
              ],
            ),
            PrimaryContinueButton(
              text: "Select".tr,
              ontap: () {
                Get.toNamed(AppPages.homePage);
              },
              isWhite: false,
              width: Get.width * 0.85,
            )
          ],
        )),
      ),
    );
  }
}

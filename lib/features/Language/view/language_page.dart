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
      body: SafeArea(
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
              selectLanguageCard(value: "EN", name: "English"),
              selectLanguageCard(value: "UR", name: "اردو"),
              selectLanguageCard(value: "AR", name: "عربي"),
            ],
          ),
          PrimaryContinueButton(
            text: "Conform",
            ontap: () {
              Get.toNamed(AppPages.homePage);
            },
            isWhite: false,
            width: Get.width * 0.85,
          )
        ],
      )),
    );
  }
}

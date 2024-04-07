import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/helper/saveLanguageSettings.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continuebutton.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 2));
      bool isOpended = await SaveLanguageSettings.isOpenedFirstTime();
      if (isOpended == true) {
        print('checkk this');
        print(SaveLanguageSettings.isOpenedFirstTime());
        Get.offNamed(AppPages.homePage);
      } else {
        print('checkk this');
        print(isOpended);
        Get.offNamed(AppPages.languagePage);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Get.theme.canvasColor,
              height: Get.height * 0.5,
            ),
            PrimaryContinueButton(
              width: Get.width * 0.85,
              text: "Proceed".tr,
              ontap: () async {
                bool isOpended = await SaveLanguageSettings.isOpenedFirstTime();
                if (isOpended == true) {
                  print('checkk this');
                  print(SaveLanguageSettings.isOpenedFirstTime());
                  Get.offNamed(AppPages.homePage);
                } else {
                  Get.offNamed(AppPages.languagePage);
                }
              },
              isWhite: true,
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController seatController = TextEditingController();

  // EmployeeListController employeeListController =
  //     Get.put(EmployeeListController()); // Register the controller here
  // AuthController authController = Get.find<AuthController>();
  @override
  void initState() {
    super.initState();
    call();
  }

  void call() async {
    Logger().i("CALLING SHIT");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homeNavBar(),
              SizedBox(
                height: 20.h,
              ),
              newsBanner(context),
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
                decoration: AppTheme.roundedContainerWithoutShadowDecoration,
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Help us with our cause!",
                            style: Get.textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          donateButton(),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Subscribe!",
                            style: Get.textTheme.titleSmall!.copyWith(
                              color: Get.theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kashmir",
                        style: Get.textTheme.titleMedium,
                      ),
                      Text(
                        "Saturday, 17 July",
                        style: Get.textTheme.titleSmall!
                            .copyWith(color: Get.theme.primaryColor),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 35.w,
                            decoration: AppTheme.roundedContainerDecoration
                                .copyWith(color: Colors.white),
                            child: const Icon(Icons.telegram),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            '12 Celsius',
                            style: Get.textTheme.bodyMedium,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 35.w,
                            decoration: AppTheme.roundedContainerDecoration
                                .copyWith(color: Colors.white),
                            child: const Icon(Icons.telegram),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            '02:23 PM',
                            style: Get.textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //* <---------- WIDGETS --------------------------------------->
//* ==============================================================

  Row homeNavBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 45.h,
          width: 40.w,
          decoration:
              AppTheme.roundedContainerDecoration.copyWith(color: Colors.white),
          child: const Icon(Icons.language_rounded),
        ),
        Text(
          "Home",
          style: Get.theme.textTheme.titleMedium!.copyWith(
              color: Get.theme.primaryColor,
              decoration: TextDecoration.underline),
        ),
      ],
    );
  }

  Container newsBanner(BuildContext context) {
    return Container(
      height: 55.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      width: MediaQuery.of(context).size.width,
      decoration: AppTheme.roundedContainerWithoutShadowDecoration
          .copyWith(color: Get.theme.cardColor),
      child: Row(
        children: [
          Container(
            height: 43.h,
            width: 40.w,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
            child: Icon(
              Icons.network_wifi_3_bar,
              color: Get.theme.primaryColor,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            "This is demo text",
            style: Get.textTheme.bodyMedium,
          )
        ],
      ),
    );
  }

  Container donateButton() {
    return Container(
      height: 42.h,
      width: 120.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(55.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Donate",
            style: Get.textTheme.bodyMedium!.copyWith(color: Colors.black),
          ),
          const Icon(
            Icons.arrow_forward,
          )
        ],
      ),
    );
  }
}

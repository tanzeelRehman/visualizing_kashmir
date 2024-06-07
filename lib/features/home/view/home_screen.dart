// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logger/logger.dart';

import 'package:marquee/marquee.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/constants/app_url.dart';
import 'package:visualizing_kashmir/core/constants/data_type_enum.dart';
import 'package:visualizing_kashmir/core/constants/multimedia_enum.dart';
import 'package:visualizing_kashmir/core/constants/search_enum.dart';
import 'package:visualizing_kashmir/core/services/local_notification_service.dart';
import 'package:visualizing_kashmir/core/services/push_notification_service.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/core/widgets/Custom%20Routes/Popups/show_pop_up.dart';
import 'package:visualizing_kashmir/features/home/controller/home_controller.dart';
import 'package:visualizing_kashmir/features/home/view/widgets/image_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    FirebasePushNotificationService.messageOnBackgroundState(context);
    LocalNotificationService.initialize(context);
    FirebasePushNotificationService.messageOnForegroundState();
    FirebasePushNotificationService.messageOnTerminatedState();
    super.initState();
  }

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    Logger().e('rebuilding widget tree');
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

              GetBuilder<HomeController>(
                init: homeController,
                builder: (controller) {
                  if (controller.showTodayHeadline) {
                    return Column(
                      children: [
                        newsBanner(
                            context,
                            controller.getHeadLineResponseModel?.data.first
                                    .heading ??
                                '',
                            controller.getHeadLineResponseModel?.data.first
                                    .description ??
                                '',
                            controller
                                .getHeadLineResponseModel?.data.first.gallery),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),

              //* Scrollable content start  -------------------------->
              //* a method in controller to only update this builder with the id 5
              GetBuilder(
                id: 5,
                init: homeController,
                builder: (controller) {
                  return SizedBox(
                    height: homeController.showTodayHeadline
                        ? Get.height * 0.72 - 55.h
                        : Get.height * 0.75,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          temperatureAndMap(),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              optionCard(
                                title: "History".tr,
                                pngPath: AppAssets.history,
                                ontap: () {
                                  Get.toNamed(AppPages.historySubPage,
                                      arguments: "History");
                                },
                              ),
                              optionCard(
                                title: "Articles".tr,
                                pngPath: AppAssets.articlesPng,
                                isPng: true,
                                ontap: () {
                                  // Get.toNamed(AppPages.searchPage,
                                  //     arguments: DataType.article.name);
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              optionCard(
                                title: "Reports".tr,
                                pngPath: AppAssets.reports,
                                ontap: () {
                                  Get.toNamed(AppPages.searchPage,
                                      arguments: DataType.report.name);
                                },
                              ),
                              optionCard(
                                title: "Know_Your_Heros".tr,
                                pngPath: AppAssets.know_heros,
                                ontap: () {
                                  Get.toNamed(AppPages.searchPage,
                                      arguments: DataType.heros.name);
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              optionCard(
                                title: "Videos".tr,
                                pngPath: AppAssets.videos_audios,
                                ontap: () {
                                  Get.toNamed(
                                      AppPages.multiMediaSearchDisplayPage,
                                      arguments: MultiMediaType.Videos.name);
                                },
                              ),
                              optionCard(
                                title: "Audios".tr,
                                pngPath: AppAssets.audio,
                                ontap: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          GetBuilder<HomeController>(
                            init: homeController,
                            builder: (controller) {
                              Logger().i(homeController.showTodayHistory);
                              if (homeController.showTodayHistory) {
                                return historyCard(
                                    homeController.getTodayHistoryResponseModel!
                                            .data.first.heading ??
                                        'Null',
                                    homeController.getTodayHistoryResponseModel!
                                            .data.first.description ??
                                        'Null',
                                    homeController.getTodayHistoryResponseModel!
                                            .data.first.heading1 ??
                                        'Null');
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),

              //! Scrollable content End  -------------------------->
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Reach_us_at".tr,
                          style: Get.textTheme.bodySmall!.copyWith(
                              color: Get.theme.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.find<HomeController>()
                                    .launchTheUrl(AppUrl.fblink);
                              },
                              child: SizedBox(
                                  height: 30.h,
                                  child: SvgPicture.asset(AppAssets.fb_icon)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.find<HomeController>()
                                    .launchTheUrl(AppUrl.iglink);
                              },
                              child: SizedBox(
                                  height: 30.h,
                                  child: SvgPicture.asset(AppAssets.ig_icon)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.find<HomeController>()
                                    .launchTheUrl(AppUrl.ytlink);
                              },
                              child: SizedBox(
                                  height: 30.h,
                                  child: SvgPicture.asset(AppAssets.yt_icon)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.find<HomeController>()
                                    .launchTheUrl(AppUrl.tiktoklink);
                              },
                              child: SizedBox(
                                  height: 30.h,
                                  child: SvgPicture.asset(AppAssets.tk_icon)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.find<HomeController>().sendEmail();
                              },
                              child: SizedBox(
                                  height: 30.h,
                                  child: SvgPicture.asset(AppAssets.gm_icon)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//* <---------- WIDGETS ------------------------------------------->
//* ================================================================

  Widget donateCard() {
    return Directionality(
      textDirection: Directionality.of(context) == TextDirection.rtl
          ? TextDirection.ltr
          : TextDirection.ltr,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        decoration: AppTheme.roundedContainerWithoutShadowDecoration
            .copyWith(borderRadius: BorderRadius.circular(25.r)),
        child: Stack(
          children: [
            Positioned(
                left: 0,
                bottom: 8,
                //  right: -6,
                child: Image.asset(
                  height: 130,
                  AppAssets.bloodSplash,
                  fit: BoxFit.cover,
                )),
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Help_us".tr,
                        style: Get.textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      donateButton(),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.sp),
                        child: Text(
                          "subscribe".tr,
                          style: Get.textTheme.titleSmall!.copyWith(
                              color: Get.theme.primaryColor, fontSize: 15.sp),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget historyCard(String shortDesc, String longdesc, String title) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppPages.todayInHistoryPage,
        );
      },
      child: Container(
        //  height: 120.h,
        width: Get.width * 0.85,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        decoration: AppTheme.roundedContainerDecorationwithLessShadows
            .copyWith(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today_in_history".tr,
                  style: Get.textTheme.titleSmall,
                ),
                Image.asset(
                  AppAssets.historyClockPng,
                  height: 40.h,
                )
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              shortDesc,
              style: Get.textTheme.bodySmall,
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              title,
              style: Get.textTheme.bodySmall!.copyWith(
                  color: Get.theme.primaryColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget optionCard({
    required String title,
    required String pngPath,
    required Function() ontap,
    bool isPng = false,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: Stack(
          children: [
            Container(
              decoration: AppTheme.roundedContainerWithoutShadowDecoration
                  .copyWith(borderRadius: BorderRadius.circular(25.r)),
              height: 145.h,
              width: 155.w,
              padding: EdgeInsets.only(top: 10.sp, left: 12.sp, right: 8.sp),
              child: Text(
                title,
                style: Get.textTheme.titleSmall!.copyWith(fontSize: 15.sp),
              ),
            ),
            Positioned(
              right: -20,
              bottom: -20,
              child: Container(
                decoration: AppTheme.roundedContainerWithoutShadowDecoration
                    .copyWith(
                        borderRadius: BorderRadius.circular(25.r),
                        color: AppTheme.cardColorDark),
                height: 110.h,
                width: 110.w,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Padding(
                  padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
                  child: isPng == false
                      ? SvgPicture.asset(
                          pngPath,
                        )
                      : Image.asset(
                          pngPath,
                          width: 15.w,
                          height: 15.h,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget temperatureAndMap() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GetBuilder<HomeController>(
          init: Get.find<HomeController>(),
          builder: (controller) {
            if (controller.fetchingData) {
              return SizedBox(
                width: Get.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Get.theme.primaryColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              if (controller.getWeatherResponseModel == null) {
                return Text('Network_Error'.tr);
              } else {
                return Padding(
                  padding: EdgeInsets.only(right: 6.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Srinagar".tr,
                        style: Get.textTheme.titleMedium,
                      ),
                      Text(
                        controller.getTodayDate(),
                        style: Get.textTheme.titleSmall!.copyWith(
                            color: Get.theme.primaryColor, fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 35.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            decoration: AppTheme.roundedContainerDecoration
                                .copyWith(color: Colors.white),
                            child: Image.asset(AppAssets.temperaturePng),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            '${controller.getKashmirTermperature().ceil().toStringAsFixed(0)} Celsius',
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            decoration: AppTheme.roundedContainerDecoration
                                .copyWith(color: Colors.white),
                            child: Image.asset(AppAssets.timePng),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            controller.getKashmirTime(),
                            style: Get.textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }
            }
          },
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(right: 5.5.sp),
                decoration: AppTheme.roundedContainerDecoration,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.asset(
                      fit: BoxFit.cover,
                      height: 150.h,
                      width: 150.w,
                      AppAssets.mapPng),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) => const ImageDialog(
                            imagePath: AppAssets.mapPng,
                          ));
                },
                child: CircleAvatar(
                  backgroundColor: Get.theme.primaryColor,
                  radius: 15.r,
                  child: Icon(
                    Icons.zoom_out_map,
                    size: 15.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget homeNavBar() {
    return Directionality(
      textDirection: Directionality.of(context) == TextDirection.rtl
          ? TextDirection.ltr
          : TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 45.h,
            width: 40.w,
            decoration: AppTheme.roundedContainerDecoration
                .copyWith(color: Colors.white),
            child: IconButton(
                splashColor: Colors.transparent,
                iconSize: 55,
                onPressed: () {
                  Get.toNamed(AppPages.languagePage);
                },
                icon: SvgPicture.asset(
                  width: 55.w,
                  height: 55.h,
                  AppAssets.language,
                )),
          ),
          GestureDetector(
            onTap: () {
              homeController.onInit();
              homeController.updateScreen();

              //* When headline news come and go main listview height chnages, This function will update the changes
              homeController.updateScreenListViewWithId5();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: AppTheme.roundedContainerDecoration.copyWith(
                  boxShadow: [
                    BoxShadow(
                        color: AppTheme.cardColorLight.withOpacity(.5),
                        blurRadius: 5,
                        offset: Offset(5, 5))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              height: 30.sp,
              width: 80.w,
              child: Text(
                "Refresh".tr,
                style: TextStyle(fontSize: 13.sp),
              ),
            ),
          ),
          Text(
            "Home".tr,
            style: Get.theme.textTheme.titleMedium!.copyWith(
                color: Get.theme.primaryColor,
                decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }

  Widget newsBanner(BuildContext context, String title, String desc,
      List<String?>? imageUrl) {
    return Directionality(
      textDirection: Directionality.of(context) == TextDirection.rtl
          ? TextDirection.ltr
          : TextDirection.ltr,
      child: GestureDetector(
        onTap: () {
          if (imageUrl == null) {
            Get.toNamed(AppPages.headLinePage, arguments: [
              {"heading": title},
              {"description": desc},
              {"imageUrl": null},
            ]);
            return;
          }
          if (imageUrl.isEmpty) {
            Get.toNamed(AppPages.headLinePage, arguments: [
              {"heading": title},
              {"description": desc},
              {"imageUrl": null},
            ]);
          } else {
            Get.toNamed(AppPages.headLinePage, arguments: [
              {"heading": title},
              {"description": desc},
              {"imageUrl": imageUrl?.first},
            ]);
          }
        },
        child: Container(
          height: 55.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          width: MediaQuery.of(context).size.width,
          decoration: AppTheme.roundedContainerWithoutShadowDecoration
              .copyWith(color: const Color(0xffaed4d4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 43.h,
                width: 40.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Image.asset(AppAssets.wifi),
              ),
              SizedBox(
                width: 8.w,
              ),
              SizedBox(
                height: 25.h,
                width: Get.width * 0.7,
                child: Marquee(
                  text: " $title",
                  style: Get.textTheme.bodyMedium,
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //blankSpace: 20.0,
                  velocity: 100.0,
                  pauseAfterRound: const Duration(seconds: 1),
                  startPadding: 0.0,
                  accelerationDuration: const Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: const Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget donateButton() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppPages.quizPage);
      },
      child: Container(
        height: 42.h,
        width: 120.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(55.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "donate".tr,
              style: Get.textTheme.bodyMedium!.copyWith(color: Colors.black),
            ),
            const Icon(
              Icons.arrow_forward,
            )
          ],
        ),
      ),
    );
  }
}

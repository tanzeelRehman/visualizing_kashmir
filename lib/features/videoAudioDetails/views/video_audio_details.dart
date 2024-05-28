// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/search_enum.dart';
import 'package:visualizing_kashmir/core/helper/getPreferedSizeAppbar.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/core/widgets/custom_text_formfield.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continue_small_button.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continuebutton.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/article_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/books_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/know_heros_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/reports_search_card.dart';
import 'package:visualizing_kashmir/features/videoAudioDetails/views/widgets/audio_play_widget.dart';
import 'package:visualizing_kashmir/features/videoAudioDetails/views/widgets/pdf_widget.dart';
import 'package:visualizing_kashmir/features/videoAudioDetails/views/widgets/video_play_widget.dart';

class VideoAudioSearch extends StatelessWidget {
  const VideoAudioSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.primaryColorDark,
        resizeToAvoidBottomInset: false,
        body: Directionality(
          textDirection: Directionality.of(context) == TextDirection.rtl
              ? TextDirection.ltr
              : TextDirection.ltr,
          child: Stack(
            children: [
              SafeArea(
                child: Column(children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  backButton(),
                  SizedBox(
                    height: 35.h,
                  ),
                  const Spacer(),
                  Container(
                    color: Get.theme.scaffoldBackgroundColor,
                    height: Get.height * 0.64,
                    width: Get.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35.h,
                        ),
                        Text(
                          "Title here",
                          style: Get.textTheme.titleSmall,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          style: Get.textTheme.bodySmall,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //! TABS WIDGET START HERE ------------------------------->
                        //!=======================================================>
                        DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              TabBar(
                                indicatorWeight: 2,
                                labelStyle: Get.textTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                                indicatorColor: Get.theme.primaryColor,
                                dividerColor: Colors.transparent,
                                unselectedLabelStyle: Get.textTheme.bodySmall,
                                indicatorSize: TabBarIndicatorSize.label,
                                tabs: [
                                  Tab(
                                    text: "Audios".tr,
                                  ),
                                  Tab(text: "Videos".tr),
                                  Tab(text: "PDF".tr),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              SizedBox(
                                height: Get.height * 0.35,
                                child: TabBarView(
                                  children: [
                                    //* Audio Widget =============================
                                    ListView.builder(
                                      itemCount: 8,
                                      itemBuilder: (context, index) {
                                        return const AudioPlayWidget();
                                      },
                                    ),
                                    //* Video Widget =============================
                                    // ListView.builder(
                                    //   itemCount: 8,
                                    //   itemBuilder: (context, index) {
                                    //     return VideoPlayWidget(
                                    //       ontap: () {},
                                    //       title: 'title 1',
                                    //     );
                                    //   },
                                    // ),
                                    //* PDF Widget =============================
                                    ListView.builder(
                                      itemCount: 8,
                                      itemBuilder: (context, index) {
                                        return const PDFWidget();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        //! TABS WIDGET END HERE ------------------------------->
                        //!=======================================================>
                      ],
                    ),
                  )
                ]),
              ),
              //? IMAGE AND TITLE WIDGET START ----------------------------------->
              Positioned(
                top: Get.height * 0.16,
                child: Container(
                    padding: EdgeInsets.only(left: 30.w),
                    width: Get.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.asset(
                                fit: BoxFit.fitHeight,
                                height: 180.h,
                                width: 120.w,
                                AppAssets.bookCover),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Title will be here",
                                  style: Get.textTheme.titleSmall!
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  "Subtitle will be here",
                                  style: Get.textTheme.bodySmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            actionButton()
                          ],
                        )
                      ],
                    )),
              )
            ],
            //? IMAGE AND TITLE WIDGET END ----------------------------------->
          ),
        ));
  }
  //* WIDGETS ------------------------------------------------------------------>
  //*===========================================================================>

  Container actionButton() {
    return Container(
      height: 35.h,
      margin: EdgeInsets.only(top: 90.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.r),
          gradient: const LinearGradient(
              colors: [Color(0xfffd7575), Color(0xfff64849)])),
      width: 140.w,
      child: Text(
        "Action",
        style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
      ),
    );
  }

  Widget backButton() {
    return Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40.h,
            width: 35.w,
            alignment: Alignment.center,
            decoration: AppTheme.roundedContainerWithoutShadowDecoration
                .copyWith(color: Colors.white),
            child: IconButton(
                iconSize: 45.sp,
                onPressed: () async {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 20.sp,
                )),
          ),
        ],
      ),
    );
  }
}

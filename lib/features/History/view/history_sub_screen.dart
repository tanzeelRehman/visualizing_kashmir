// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/constants/data_type_enum.dart';
import 'package:visualizing_kashmir/core/constants/multimedia_enum.dart';
import 'package:visualizing_kashmir/core/constants/search_enum.dart';
import 'package:visualizing_kashmir/core/helper/getPreferedSizeAppbar.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/core/widgets/custom_text_formfield.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continue_small_button.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continuebutton.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/article_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/history_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/know_heros_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/reports_search_card.dart';

class HistorySubScreen extends StatelessWidget {
  HistorySubScreen({super.key});

  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: getPreferedSizeAppbar("History", focusNode: searchFocusNode),
        body: Directionality(
          textDirection: Directionality.of(context) == TextDirection.rtl
              ? TextDirection.ltr
              : TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SubMenuCard(
                    title: "Books",
                    imagePath: AppAssets.booksSubscreen,
                    ontap: () {
                      Get.toNamed(AppPages.searchPage,
                          arguments: DataType.book.name);
                    },
                  ),
                  SubMenuCard(
                    title: "Articles",
                    imagePath: AppAssets.articleSubscreen,
                    ontap: () {
                      Get.toNamed(AppPages.searchPage,
                          arguments: DataType.article.name);
                    },
                  ),
                  SubMenuCard(
                    title: "Videos",
                    imagePath: AppAssets.videosSubscreen,
                    ontap: () {
                      Get.toNamed(AppPages.multiMediaSearchDisplayPage,
                          arguments: MultiMediaType.Videos.name);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SubMenuCard(
                    title: "Images",
                    imagePath: AppAssets.imagesSubscreen,
                    ontap: () {
                      // Get.toNamed(AppPages.multiMediaSearchDisplayPage,
                      //     arguments: MultiMediaType.Images.name);
                    },
                  ),
                  SubMenuCard(
                    title: "Audios",
                    imagePath: AppAssets.audiosSubscreen,
                    ontap: () {
                      Get.toNamed(AppPages.multiMediaSearchDisplayPage,
                          arguments: MultiMediaType.Audios.name);
                    },
                  ),
                  SubMenuCard(
                    title: "Infographics",
                    imagePath: AppAssets.infographicsSubscreen,
                    ontap: () {
                      // Get.toNamed(AppPages.multiMediaSearchDisplayPage,
                      //     arguments: MultiMediaType.InfoGraphics.name);
                    },
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}

class SubMenuCard extends StatelessWidget {
  String title;
  String imagePath;
  Function() ontap;
  SubMenuCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.ontap,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            height: 105.h,
            width: 90.w,
            decoration: BoxDecoration(
                border: Border.all(color: Get.theme.primaryColor, width: .5),
                borderRadius: BorderRadius.circular(12.r)),
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Image.asset(imagePath),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          title.tr,
          style: Get.textTheme.titleSmall!.copyWith(
            color: Get.theme.primaryColor,
            decoration: TextDecoration.underline,
          ),
        )
      ],
    );
  }
}

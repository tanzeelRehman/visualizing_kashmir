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
import 'package:visualizing_kashmir/features/search/view/widgets/history_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/know_heros_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/reports_search_card.dart';

class KnowYourHeroDetail extends StatelessWidget {
  const KnowYourHeroDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: getPreferedSizeAppbar(
          "Know_Your_Heros".tr,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: Get.height * 0.3,
                width: Get.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    AppAssets.geelani,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                "Syed Ali Shah Geelani",
                style: Get.textTheme.titleMedium,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "29 September 1929 - 1 September 2021",
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "was ancIslamist,cPro-Pakistan Kashmiri-separatist leader in the Indian-administered Jammu and Kashmir, regarded as the father of the Kashmiri jihad. Geelani helped found the All Parties Hurriyat Conference (APHC) in 1993 and served as its chairman from 1998 to 2000. In 2003, he formed his own faction of which he was later elected as the lifetime chairman.",
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(
                height: 25.h,
              ),
              ExpansionTile(
                childrenPadding: EdgeInsets.symmetric(vertical: 5.h),
                collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r)),
                title: Text(
                  "Early Life",
                  style: Get.textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15.sp),
                ),
                collapsedBackgroundColor: Get.theme.cardColor,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width * 0.55,
                            child: Text(
                              'Syed Ali Geelani was born in 1929 in a village called the Zurimanj , in the Bandipora tehsil, in the Baramulla district of North Kashmir. He was the son of a landless labourer in the canals ',
                              style: Get.textTheme.bodySmall!
                                  .copyWith(height: 1.5),
                            ),
                          ),
                          Image.asset(AppAssets.geelani2)
                        ],
                      ),
                      Text(
                        'department. Geelani was educated partly in Sopore and the rest in Lahore. He studied in a madrasa attached to the Masjid Wazir Khan and later enrolled in the Oriental College. He completed Adib Alim, a course in Islamic theology.',
                        style: Get.textTheme.bodySmall!.copyWith(height: 1.5),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              ExpansionTile(
                childrenPadding: EdgeInsets.symmetric(vertical: 5.h),
                collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r)),
                title: Text(
                  "Electrocal Politics",
                  style: Get.textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15.sp),
                ),
                collapsedBackgroundColor: Get.theme.cardColor,
                children: [
                  Column(
                    children: [
                      Text(
                        'Geelani entered into electoral politics ahead of the 1971 Indian general election. Geelani had claimed that the Jamaat-e-Islami wanted to use it as an opportunity to spread its ideology, keep the Kashmir issue in prominence and protect basic and fundamental rights of the people.[citation needed] Geelani contested as an independent candidate but lost to Syed Ahmed Aga, with the Jamaat alleging ballot rigging.',
                        style: Get.textTheme.bodySmall!.copyWith(height: 1.5),
                      )
                    ],
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}

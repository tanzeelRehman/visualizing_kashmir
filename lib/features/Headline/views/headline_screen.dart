// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/app_url.dart';
import 'package:visualizing_kashmir/core/constants/search_enum.dart';
import 'package:visualizing_kashmir/core/helper/getPreferedSizeAppbar.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/core/widgets/custom_text_formfield.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continue_small_button.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continuebutton.dart';
import 'package:visualizing_kashmir/features/home/controller/home_controller.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/article_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/books_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/know_heros_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/reports_search_card.dart';

class HeadLineScreen extends StatelessWidget {
  dynamic args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: getPreferedSizeAppbar(
          "Headline",
        ),
        body: Directionality(
          textDirection: Directionality.of(context) == TextDirection.rtl
              ? TextDirection.ltr
              : TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    args[2]['imageUrl'] != null
                        ? CachedNetworkImage(
                            height: 250.h,
                            width: Get.width * 0.9,
                            fit: BoxFit.cover,
                            imageUrl:
                                '${AppUrl.bunnyBaseUrl}${args[2]['imageUrl']}',
                            placeholder: (context, url) => Padding(
                              padding: EdgeInsets.all(30.sp),
                              child: SizedBox(
                                width: 40.w,
                                height: 60.h,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.ballPulse,
                                  colors: [Get.theme.primaryColor],
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 190.h,
                              width: 110.w,
                              color: const Color(0xffe9e9e9),
                              child: Icon(
                                Icons.image,
                                color: const Color(0xffd3d3d3),
                                size: 55.sp,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      args[0]['heading'] ?? 'Null',
                      style: Get.textTheme.titleSmall!
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      args[1]['description'] ?? 'Null',
                      style: Get.textTheme.bodySmall,
                    ),
                  ]),
            ),
          ),
        ));
  }
}

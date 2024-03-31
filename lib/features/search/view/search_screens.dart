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

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String searchType = Get.arguments ?? '';
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: getPreferedSizeAppbar(searchType, focusNode: searchFocusNode),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(children: [
            CustomTextFormField(
              controller: searchController,
              focusNode: searchFocusNode,
              hintText: "Search",
              height: 55.h,
              suffixIcon: const Icon(
                Icons.search,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            //* REPORT Search -------------------------------->
            if (searchType == SearchType.Reports.name)
              SizedBox(
                height: Get.height * 0.72,
                child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 35.h),
                      child: const ReportsSearchCard(),
                    );
                  },
                ),
              ),
            //* ARTICLES Search -------------------------------->
            if (searchType == SearchType.Articles.name)
              SizedBox(
                height: Get.height * 0.72,
                child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 55.h),
                      child: const ArticleSearchCard(),
                    );
                  },
                ),
              ),
            //* HISTORY Search -------------------------------->
            if (searchType == SearchType.History.name)
              SizedBox(
                height: Get.height * 0.72,
                child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 35.h),
                      child: const HistorySearchCard(),
                    );
                  },
                ),
              ),
            //* KNOW HEROS Search -------------------------------->
            if (searchType == SearchType.Know_Your_Heros.name)
              SizedBox(
                height: Get.height * 0.72,
                child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 55.h),
                      child: const KnowHerosSearchCard(),
                    );
                  },
                ),
              ),
          ]),
        ));
  }
}

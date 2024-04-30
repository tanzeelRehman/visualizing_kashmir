// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:logger/logger.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/data_type_enum.dart';
import 'package:visualizing_kashmir/core/constants/search_enum.dart';
import 'package:visualizing_kashmir/core/helper/getPreferedSizeAppbar.dart';
import 'package:visualizing_kashmir/core/model/get_articles_response_model.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/core/widgets/custom_text_formfield.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continue_small_button.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continuebutton.dart';
import 'package:visualizing_kashmir/features/search/controller/search_controller.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/article_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/books_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/know_heros_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/reports_search_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode searchFocusNode = FocusNode();

  final TextEditingController searchController = TextEditingController();

  final String searchType = Get.arguments ?? '';

  late final DataSearchController datSearchController =
      Get.put(DataSearchController());

  @override
  void initState() {
    datSearchController.callApis(searchType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: getPreferedSizeAppbar(searchType, focusNode: searchFocusNode),
        body: Directionality(
          textDirection: Directionality.of(context) == TextDirection.rtl
              ? TextDirection.ltr
              : TextDirection.ltr,
          child: Container(
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
              if (searchType == DataType.report.name)
                GetBuilder<DataSearchController>(
                  builder: (_) {
                    return SizedBox(
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
                    );
                  },
                ),
              //* ARTICLES Search -------------------------------->
              if (searchType == DataType.article.name)
                GetBuilder<DataSearchController>(
                  builder: (_) {
                    return SizedBox(
                      height: Get.height * 0.72,
                      child: ListView.builder(
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 35.h),
                            child: const ArticleSearchCard(),
                          );
                        },
                      ),
                    );
                  },
                ),
              // //* HISTORY Search -------------------------------->
              if (searchType == DataType.book.name)
                GetBuilder<DataSearchController>(
                  builder: (_) {
                    if (_.fetchingData) {
                      return SizedBox(
                          height: Get.height * 0.72,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [CircularProgressIndicator.adaptive()],
                          ));
                    } else {
                      if (datSearchController.getBooksResponseModel == null) {
                        return const SizedBox.shrink();
                      } else {
                        return SizedBox(
                          height: Get.height * 0.72,
                          child: ListView.builder(
                            itemCount: datSearchController
                                .getBooksResponseModel!.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: BooksSearchCard(
                                  title: datSearchController
                                      .getBooksResponseModel!
                                      .data[index]
                                      .heading,
                                  authar: datSearchController
                                      .getBooksResponseModel!
                                      .data[index]
                                      .publishBy,
                                  imagePath: datSearchController
                                      .getBooksResponseModel!
                                      .data[index]
                                      .thumbnail,
                                  open: () {},
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                  },
                ),
              //* KNOW HEROS Search -------------------------------->
              if (searchType == SearchType.Know_Your_Heros.name)
                GetBuilder<DataSearchController>(
                  builder: (_) {
                    return SizedBox(
                      height: Get.height * 0.72,
                      child: ListView.builder(
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 35.h),
                            child: const KnowHerosSearchCard(),
                          );
                        },
                      ),
                    );
                  },
                ),
            ]),
          ),
        ));
  }
}

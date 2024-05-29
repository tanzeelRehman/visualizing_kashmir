// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/constants/data_type_enum.dart';
import 'package:visualizing_kashmir/core/constants/search_enum.dart';
import 'package:visualizing_kashmir/core/helper/getPreferedSizeAppbar.dart';
import 'package:visualizing_kashmir/core/model/get_articles_response_model.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/core/widgets/custom_text_formfield.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continue_small_button.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continuebutton.dart';
import 'package:visualizing_kashmir/features/detail/controller/media_detail_loader_controller.dart';
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

  final DataSearchController datSearchController =
      Get.put(DataSearchController());
  final MediaDetailLoaderController mediaDetailLoaderController =
      Get.find<MediaDetailLoaderController>();

  @override
  void initState() {
    datSearchController.callApis(searchType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: getPreferedSizeAppbar(
            searchType == DataType.book.name
                ? 'Books'
                : searchType == DataType.article.name
                    ? 'Articles'
                    : searchType.capitalize!,
            focusNode: searchFocusNode),
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
                onChanged: (value) {
                  datSearchController.searchData(searchType, value);
                },
                hintText: "Search",
                height: 55.h,
                suffixIcon: const Icon(
                  Icons.search,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              //*=================================================================================>
              //* REPORTS Search card
              //*=================================================================================>

              if (searchType == DataType.report.name)
                GetBuilder<DataSearchController>(
                  builder: (_) {
                    if (_.fetchingData) {
                      return SizedBox(
                          height: Get.height * 0.72,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60.h,
                                width: 60.w,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.lineScale,
                                  colors: [Get.theme.primaryColor],
                                  strokeWidth: 2,
                                ),
                              )
                            ],
                          ));
                    } else {
                      if (datSearchController.getReportsResponseModel == null) {
                        return const SizedBox.shrink();
                      } else {
                        if (datSearchController.getReportsSearchResponseModel ==
                                null ||
                            datSearchController
                                .getReportsSearchResponseModel!.isEmpty) {
                          return SizedBox(
                            height: Get.height * 0.72,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20.sp),
                                  child: Lottie.asset(
                                    'assets/images/lottie/no_data_lottie.json',
                                    height: 250.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  'No Reports found',
                                  style: Get.textTheme.titleMedium,
                                )
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: Get.height * 0.72,
                            child: ListView.builder(
                              itemCount: datSearchController
                                  .getReportsSearchResponseModel!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: EdgeInsets.only(top: 35.h),
                                    child: ReportsSearchCard(
                                        heading: datSearchController
                                            .getReportsSearchResponseModel![
                                                index]
                                            .heading,
                                        description: datSearchController
                                            .getReportsSearchResponseModel![
                                                index]
                                            .description,
                                        onread: () {
                                          Get.toNamed(AppPages.pdfDetailPage,
                                              arguments: datSearchController
                                                  .getReportsSearchResponseModel![
                                                      index]
                                                  .heading);
                                          mediaDetailLoaderController.loadPDF(
                                              datSearchController
                                                  .getReportsSearchResponseModel![
                                                      index]
                                                  .gallery);
                                        },
                                        imagePath: datSearchController
                                            .getReportsSearchResponseModel![
                                                index]
                                            .thumbnail));
                              },
                            ),
                          );
                        }
                      }
                    }
                  },
                ),
              //*=================================================================================>
              //* ARTICLES Search card
              //*=================================================================================>

              if (searchType == DataType.article.name)
                GetBuilder<DataSearchController>(
                  builder: (_) {
                    if (_.fetchingData) {
                      return SizedBox(
                          height: Get.height * 0.72,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60.h,
                                width: 60.w,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.lineScale,
                                  colors: [Get.theme.primaryColor],
                                  strokeWidth: 2,
                                ),
                              )
                            ],
                          ));
                    } else {
                      if (datSearchController.getArticlesResponseModel ==
                          null) {
                        return const SizedBox.shrink();
                      } else {
                        if (datSearchController
                                    .getArticlesSearchResponseModel ==
                                null ||
                            datSearchController
                                .getArticlesSearchResponseModel!.isEmpty) {
                          return SizedBox(
                            height: Get.height * 0.72,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20.sp),
                                  child: Lottie.asset(
                                    'assets/images/lottie/no_data_lottie.json',
                                    height: 250.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  'No Articles found',
                                  style: Get.textTheme.titleMedium,
                                )
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: Get.height * 0.72,
                            child: ListView.builder(
                              itemCount: datSearchController
                                  .getArticlesSearchResponseModel!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: EdgeInsets.only(top: 35.h),
                                    child: ArticleSearchCard(
                                        heading: datSearchController
                                            .getArticlesSearchResponseModel![
                                                index]
                                            .heading,
                                        publishedBy: datSearchController
                                            .getArticlesSearchResponseModel![
                                                index]
                                            .publishBy,
                                        image: datSearchController
                                            .getArticlesSearchResponseModel![
                                                index]
                                            .thumbnail,
                                        onread: (() {
                                          Get.toNamed(AppPages.textDetailsPage,
                                              arguments: [
                                                {
                                                  "heading": datSearchController
                                                      .getArticlesSearchResponseModel![
                                                          index]
                                                      .heading
                                                },
                                                {
                                                  "desc": datSearchController
                                                      .getArticlesSearchResponseModel![
                                                          index]
                                                      .description
                                                },
                                              ]);
                                        })));
                              },
                            ),
                          );
                        }
                      }
                    }
                  },
                ),

              //*=================================================================================>
              //* HISTORY BOOKS Search card
              //*=================================================================================>

              if (searchType == DataType.book.name)
                GetBuilder<DataSearchController>(
                  builder: (_) {
                    if (_.fetchingData) {
                      return SizedBox(
                          height: Get.height * 0.72,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60.h,
                                width: 60.w,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.lineScale,
                                  colors: [Get.theme.primaryColor],
                                  strokeWidth: 2,
                                ),
                              )
                            ],
                          ));
                    } else {
                      if (datSearchController.getBooksResponseModel == null) {
                        return const SizedBox.shrink();
                      } else {
                        if (datSearchController.getBooksSearchResponseModel ==
                                null ||
                            datSearchController
                                .getBooksSearchResponseModel!.isEmpty) {
                          return SizedBox(
                            height: Get.height * 0.72,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20.sp),
                                  child: Lottie.asset(
                                    'assets/images/lottie/no_data_lottie.json',
                                    height: 250.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  'No books found',
                                  style: Get.textTheme.titleMedium,
                                )
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: Get.height * 0.72,
                            child: ListView.builder(
                              itemCount: datSearchController
                                  .getBooksSearchResponseModel!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 35.h),
                                  child: BooksSearchCard(
                                    title: datSearchController
                                        .getBooksSearchResponseModel![index]
                                        .heading,
                                    authar: datSearchController
                                        .getBooksSearchResponseModel![index]
                                        .publishBy,
                                    imagePath: datSearchController
                                        .getBooksSearchResponseModel![index]
                                        .thumbnail,
                                    open: () {
                                      Get.toNamed(AppPages.pdfDetailPage,
                                          arguments: datSearchController
                                              .getBooksSearchResponseModel![
                                                  index]
                                              .heading);
                                      mediaDetailLoaderController.loadPDF(
                                          datSearchController
                                              .getBooksSearchResponseModel![
                                                  index]
                                              .gallery);
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }
                    }
                  },
                ),

              //*=================================================================================>
              //* KNOW HEROS Search card
              //*=================================================================================>

              if (searchType == DataType.heros.name)
                GetBuilder<DataSearchController>(
                  builder: (_) {
                    if (_.fetchingData) {
                      return SizedBox(
                          height: Get.height * 0.72,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60.h,
                                width: 60.w,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.lineScale,
                                  colors: [Get.theme.primaryColor],
                                  strokeWidth: 2,
                                ),
                              )
                            ],
                          ));
                    } else {
                      if (datSearchController.getKnowYourHerosResponseModel ==
                          null) {
                        return const SizedBox.shrink();
                      } else {
                        if (datSearchController
                                    .getKnowYourHerosSearchResponseModel ==
                                null ||
                            datSearchController
                                .getKnowYourHerosSearchResponseModel!.isEmpty) {
                          return SizedBox(
                            height: Get.height * 0.72,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20.sp),
                                  child: Lottie.asset(
                                    'assets/images/lottie/no_data_lottie.json',
                                    height: 250.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  'No Heros found',
                                  style: Get.textTheme.titleMedium,
                                )
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: Get.height * 0.72,
                            child: ListView.builder(
                              itemCount: datSearchController
                                  .getKnowYourHerosSearchResponseModel!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: EdgeInsets.only(top: 35.h),
                                    child: KnowHerosSearchCard(
                                        imageUrl: datSearchController
                                            .getKnowYourHerosSearchResponseModel![
                                                index]
                                            .profile,
                                        dob: datSearchController
                                            .getKnowYourHerosSearchResponseModel![
                                                index]
                                            .birth,
                                        name: datSearchController
                                            .getKnowYourHerosSearchResponseModel![
                                                index]
                                            .name,
                                        death: datSearchController
                                            .getKnowYourHerosSearchResponseModel![
                                                index]
                                            .death,
                                        ontap: () {
                                          Get.toNamed(AppPages.heroWebViewPage,
                                              arguments: [
                                                {
                                                  "url": datSearchController
                                                      .getKnowYourHerosSearchResponseModel![
                                                          index]
                                                      .link
                                                },
                                                {
                                                  "name": datSearchController
                                                      .getKnowYourHerosSearchResponseModel![
                                                          index]
                                                      .name
                                                },
                                              ]);
                                        }));
                              },
                            ),
                          );
                        }
                      }
                    }
                  },
                ),
            ]),
          ),
        ));
  }
}

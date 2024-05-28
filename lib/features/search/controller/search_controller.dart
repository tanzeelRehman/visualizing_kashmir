// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:visualizing_kashmir/core/constants/data_type_enum.dart';
import 'package:visualizing_kashmir/core/constants/search_enum.dart';
import 'package:visualizing_kashmir/core/data/app_data_source.dart';
import 'package:visualizing_kashmir/core/data/media_data_source.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/model/get_articles_response_model.dart';
import 'package:visualizing_kashmir/core/model/get_books_response_model.dart';
import 'package:visualizing_kashmir/core/model/get_know_your_heros_response_model.dart';
import 'package:visualizing_kashmir/core/model/get_reports_response_model.dart';
import 'package:visualizing_kashmir/core/network/network_info.dart';

class DataSearchController extends GetxController {
  //! External variables
  AppDataSource appDataSource = Get.find<AppDataSource>();
  MediaDataSource mediaDataSource = Get.find<MediaDataSource>();
  NetworkInfo networkInfo = Get.find<NetworkInfo>();

  //! Model variables
  GetBooksResponseModel? getBooksResponseModel;
  GetArticlesResponseModel? getArticlesResponseModel;
  GetReportsResponseModel? getReportsResponseModel;
  GetKnowYourHerosResponseModel? getKnowYourHerosResponseModel;
  //- SEARCH
  List<BooksData>? getBooksSearchResponseModel;
  List<HerosData>? getKnowYourHerosSearchResponseModel;
  List<ArticlesData>? getArticlesSearchResponseModel;
  List<ReportsData>? getReportsSearchResponseModel;

  //! Class variables
  bool fetchingData = false;
  ByteData? openedPdfByteData;

  //! Constructor

  //? API CALLS STARTS --------------------------------------------------------------------------->
  //?=============================================================================================>
  //- GET BOOKS
  Future<void> getBooks() async {
    startMainScreenLoader();
    var response = await appDataSource.getData(DataType.book);
    if (response is Failure) {
      handleError(response);
      startMainScreenLoader();
    } else {
      getBooksResponseModel = response;
      getBooksSearchResponseModel = getBooksResponseModel!.data;
      Logger().i(getBooksResponseModel!.toJson());
      startMainScreenLoader();
    }
  }

  //- GET ARTICLES
  Future<void> getArticles() async {
    Logger().e('caling articles');
    startMainScreenLoader();
    var response = await appDataSource.getData(DataType.article);
    if (response is Failure) {
      handleError(response);
      startMainScreenLoader();
    } else {
      getArticlesResponseModel = response;
      getArticlesSearchResponseModel = getArticlesResponseModel!.data;
      Logger().i(getArticlesResponseModel!.toJson());
      startMainScreenLoader();
    }
  }

  //- GET REPORTS
  Future<void> getReports() async {
    startMainScreenLoader();
    Logger().e('caling reports');
    var response = await appDataSource.getData(DataType.report);
    if (response is Failure) {
      handleError(response);
      startMainScreenLoader();
    } else {
      getReportsResponseModel = response;
      getReportsSearchResponseModel = getReportsResponseModel!.data;
      Logger().i(getReportsResponseModel!.toJson());
      startMainScreenLoader();
    }
  }

  //- GET HEROS
  Future<void> getKnowYourHeros() async {
    startMainScreenLoader();
    Logger().e('caling heros');
    var response = await appDataSource.getKnowYourHeros();
    if (response is Failure) {
      handleError(response);
      startMainScreenLoader();
    } else {
      getKnowYourHerosResponseModel = response;
      getKnowYourHerosSearchResponseModel = getKnowYourHerosResponseModel!.data;

      startMainScreenLoader();
    }
  }

  Future<void> searchData(String searchType, String? query) async {
    if (searchType == DataType.report.name) {
      if (query == '' || query == null) {
        getReportsSearchResponseModel = getReportsResponseModel!.data;
      } else {
        getReportsSearchResponseModel = getReportsResponseModel!.data
            .where((item) => item.heading.contains(query))
            .toList();
      }
    }
    if (searchType == DataType.book.name) {
      if (query == '' || query == null) {
        getBooksSearchResponseModel = getBooksResponseModel!.data;
      } else {
        getBooksSearchResponseModel = getBooksResponseModel!.data
            .where((item) => item.heading.contains(query))
            .toList();
      }
    }

    if (searchType == DataType.heros.name) {
      if (query == '' || query == null) {
        getKnowYourHerosSearchResponseModel =
            getKnowYourHerosResponseModel!.data;
      } else {
        getKnowYourHerosSearchResponseModel = getKnowYourHerosResponseModel!
            .data
            .where((item) => item.name.contains(query))
            .toList();
      }
    }
    if (searchType == DataType.article.name) {
      if (query == '' || query == null) {
        getArticlesSearchResponseModel = getArticlesResponseModel!.data;
      } else {
        getArticlesSearchResponseModel = getArticlesResponseModel!.data
            .where((item) => item.heading.contains(query))
            .toList();
      }
    }

    update();
  }

  //? API CALLS END --------------------------------------------------------------------------->
  //?===========================================================================================>

  //! Business Logic ---------------------------------------------------------->
  void callApis(String searchType) async {
    Logger().i(searchType);
    if (searchType == DataType.report.name) {
      getReports();
    } else if (searchType == DataType.article.name) {
      getArticles();
    } else if (searchType == DataType.book.name) {
      getBooks();
    } else if (searchType == DataType.heros.name) {
      getKnowYourHeros();
    }
  }

  //* Util functions ------------------------------------------------------------>
  void handleError(Failure failure) {
    Get.snackbar(
      "Error",
      failure.message,
      snackPosition: SnackPosition.TOP,
    );
  }

  Future<bool> isInternetAvalible() async {
    return await networkInfo.isConnected;
  }

  void handleSuccess(String sucess) {
    Get.snackbar(
      "Success",
      sucess,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  // This loader will be used for fetching dara
  void startMainScreenLoader() {
    fetchingData = !fetchingData;
    update();
  }

  //* State Functions ---------------------------------------------------------->

  @override
  void onInit() {
    // Get called when controller is created

    super.onInit();
  }

  @override
  void onReady() {
    // Get called after widget is rendered on the screen

    super.onReady();
  }

  @override
  void onClose() {
    //Get called when controller is removed from memory
    super.onClose();
  }
}

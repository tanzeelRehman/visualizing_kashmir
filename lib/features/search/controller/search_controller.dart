// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:visualizing_kashmir/core/constants/data_type_enum.dart';
import 'package:visualizing_kashmir/core/constants/search_enum.dart';
import 'package:visualizing_kashmir/core/data/app_data_source.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/model/get_articles_response_model.dart';
import 'package:visualizing_kashmir/core/model/get_books_response_model.dart';
import 'package:visualizing_kashmir/core/model/get_reports_response_model.dart';
import 'package:visualizing_kashmir/core/network/network_info.dart';

class DataSearchController extends GetxController {
  //! External variables

  AppDataSource appDataSource = Get.find<AppDataSource>();

  //! Model variables
  GetBooksResponseModel? getBooksResponseModel;
  GetArticlesResponseModel? getArticlesResponseModel;
  GetReportsResponseModel? getReportsResponseModel;

  //! Class variables
  bool fetchingData = false;

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
      Logger().i(getArticlesResponseModel!.toJson());
      startMainScreenLoader();
    }
  }

  //- GET ARTICLES
  Future<void> getReports() async {
    startMainScreenLoader();
    Logger().e('caling reports');
    var response = await appDataSource.getData(DataType.report);
    if (response is Failure) {
      handleError(response);
      startMainScreenLoader();
    } else {
      getReportsResponseModel = response;
      Logger().i(getReportsResponseModel!.toJson());
      startMainScreenLoader();
    }
  }
  //? API CALLS END --------------------------------------------------------------------------->
  //?===========================================================================================>

  //! Business Logic ---------------------------------------------------------->
  void callApis(String searchType) async {
    if (searchType == DataType.report.name) {
      getReports();
    } else if (searchType == DataType.article.name) {
      getArticles();
    } else if (searchType == DataType.book.name) {
      getBooks();
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

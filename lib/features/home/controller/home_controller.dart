import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/constants/data_type_enum.dart';
import 'package:visualizing_kashmir/core/data/app_data_source.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/model/get_headline_response_model.dart';
import 'package:visualizing_kashmir/core/model/get_today_history_response_model.dart';
import 'package:visualizing_kashmir/core/network/network_info.dart';
import 'package:visualizing_kashmir/core/data/home_datasource.dart';
import 'package:visualizing_kashmir/core/services/local_notification_service.dart';
import 'package:visualizing_kashmir/core/services/push_notification_service.dart';
import 'package:visualizing_kashmir/features/home/model/get_weather_response.dart';

class HomeController extends GetxController {
  //! External variables
  NetworkInfo networkInfo = Get.find<NetworkInfo>();
  HomeDataSource homeDataSource = Get.find<HomeDataSource>();
  AppDataSource appDataSource = Get.find<AppDataSource>();

  //! Model variables
  late GetWeatherResponseModel? getWeatherResponseModel;
  late GetTodayHistoryResponseModel? getTodayHistoryResponseModel;
  late GetHeadLineResponseModel? getHeadLineResponseModel;

  //! Class variables
  bool fetchingData = false;
  bool showTodayHistory = false;
  bool showTodayHeadline = false;

  //? API CALLS STARTS --------------------------------------------------------------------------->
  //?=============================================================================================>
  //- GET TODAY WEATHER
  Future<void> getWeather() async {
    startMainScreenLoader();
    var response = await homeDataSource.getWeather();
    if (response is Failure) {
      handleError(response);
      startMainScreenLoader();
    } else {
      getWeatherResponseModel = response;

      startMainScreenLoader();
    }
  }

  //- GET TODAY HISTORY
  Future<void> getTodayHistory() async {
    var response = await appDataSource.getData(DataType.today);
    if (response is Failure) {
    } else {
      getTodayHistoryResponseModel = response;

      if (getTodayHistoryResponseModel!.data.isNotEmpty) {
        showTodayHistory = true;
        update();
      }
    }
  }

  //- GET TODAY HEADLINE
  Future<void> getTodayHeadline() async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    Logger().e(formattedDate);
    var response = await homeDataSource.getHeadLine(formattedDate);
    if (response is Failure) {
    } else {
      getHeadLineResponseModel = response;
      Logger().i(getHeadLineResponseModel!.toJson());

      if (getHeadLineResponseModel!.data.isNotEmpty) {
        showTodayHeadline = true;
        update();
      }
    }
  }
  //? API CALLS END --------------------------------------------------------------------------->
  //?===========================================================================================>

  //! Business Logic ---------------------------------------------------------->

  double getKashmirTermperature() {
    if (getWeatherResponseModel!.main.temp != 0.0) {
      getKashmirTime();
      return getWeatherResponseModel!.main.temp - 273.15;
    } else {
      return 0.0;
    }
  }

  String getKashmirTime() {
    DateTime now = DateTime.now();

    Duration offset = const Duration(minutes: 30);

    DateTime gmt530Time = now.add(offset);

    String formattedTime = DateFormat.Hm().format(gmt530Time);

    return formattedTime;
  }

  String getTodayDate() {
    return DateFormat.MMMMEEEEd().format(DateTime.now()).toString();
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
    getWeather();

    getTodayHistory();

    getTodayHeadline();

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

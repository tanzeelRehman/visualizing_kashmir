import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/network/network_info.dart';
import 'package:visualizing_kashmir/features/home/data/home_datasource.dart';
import 'package:visualizing_kashmir/features/home/model/get_all_employees.dart';
import 'package:visualizing_kashmir/features/home/model/get_weather_response.dart';

import 'package:timezone/timezone.dart' as tz;

class HomeController extends GetxController {
  //! External variables
  NetworkInfo networkInfo = Get.find<NetworkInfo>();
  HomeDataSource homeDataSource = Get.find<HomeDataSource>();

  //! Model variables
  late GetWeatherResponse getWeatherResponseModel;

  //! Class variables
  String selectedEmployeeName = '';
  int selectedEmployeeID = 0;
  bool fetchingData = false;

  //? API CALLS STARTS --------------------------------------------------------------------------->
  //?=============================================================================================>
  //- GET ALL EMPLOYEES
  Future<void> getWeather() async {
    startMainScreenLoader();
    var response = await homeDataSource.getWeather();
    if (response is Failure) {
      handleError(response);
      startMainScreenLoader();
    } else {
      getWeatherResponseModel = response;
      Logger().i(getWeatherResponseModel.toJson());
      startMainScreenLoader();
    }
  }
  //? API CALLS END --------------------------------------------------------------------------->
  //?===========================================================================================>

  //! Business Logic ---------------------------------------------------------->

  double getKashmirTermperature() {
    if (getWeatherResponseModel.main.temp != 0.0) {
      getKashmirTime();
      return getWeatherResponseModel.main.temp! - 273.15;
    } else {
      return 0.0;
    }
  }

  String getKashmirTime() {
    DateTime now = DateTime.now();

    Duration offset = const Duration(minutes: 30);

    DateTime gmt530Time = now.add(offset);

    String formattedTime = DateFormat.Hm().format(gmt530Time);

    Logger().e('Current time in GMT+5:30: $formattedTime');
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

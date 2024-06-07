import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
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
  GetWeatherResponseModel? getWeatherResponseModel;
  GetTodayHistoryResponseModel? getTodayHistoryResponseModel;
  late GetHeadLineResponseModel? getHeadLineResponseModel;

  //! Class variables
  bool fetchingData = false;
  bool showTodayHistory = false;
  bool showTodayHeadline = false;
  bool lodaingTodayHistory = false;

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
    showTodayHistory = false;
    lodaingTodayHistory = true;
    update();
    var response = await appDataSource.getData(DataType.today);
    if (response is Failure) {
    } else {
      getTodayHistoryResponseModel = response;
      Logger().i(getTodayHistoryResponseModel!.toJson());

      if (getTodayHistoryResponseModel == null) {
        return;
      }

      if (getTodayHistoryResponseModel!.data.isNotEmpty) {
        showTodayHistory = true;
        lodaingTodayHistory = false;
        update();
      }
    }
  }

  //- GET TODAY HEADLINE
  Future<void> getTodayHeadline() async {
    showTodayHeadline = false;
    update();
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    var response = await homeDataSource.getHeadLine(formattedDate);
    Logger().e(showTodayHeadline);

    if (response is Failure) {
      handleError(Failure('Error loading headlines'));
    } else {
      getHeadLineResponseModel = response;
      Logger().i(getHeadLineResponseModel!.toJson());

      if (getHeadLineResponseModel!.data.isNotEmpty) {
        showTodayHeadline = true;
        update();
        Logger().e(showTodayHeadline);
      }
    }
  }

  void toggleGettingHeadline() {
    showTodayHistory = !showTodayHistory;
    Logger().e(showTodayHistory);
    update();
  }

  //? API CALLS END --------------------------------------------------------------------------->
  //?===========================================================================================>

  //! Business Logic ---------------------------------------------------------->

  double getKashmirTermperature() {
    if (getWeatherResponseModel == null) {
      return 0.0;
    }
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

    String formattedTime = DateFormat.jm().format(gmt530Time);

    return formattedTime;
  }

  String getTodayDate() {
    return DateFormat.MMMMEEEEd().format(DateTime.now()).toString();
  }

  //* Util functions ------------------------------------------------------------>
  void updateScreenListViewWithId5() {
    update([5]);
  }

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

  void launchTheUrl(String mediaLink) async {
    final Uri url = Uri.parse(mediaLink);
    if (!await launchUrl(url)) {
      handleError(const Failure('Canot open the link'));
    }
  }

  void sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'visualizingkashmir@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Visualizing Kashmir mobile application!',
      }),
    );
    if (!await launchUrl(emailUri)) {
      handleError(const Failure('Canot send email'));
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void updateScreen() {
    showTodayHeadline = !showTodayHeadline;
    update();
  }

  Future<bool> isInternetAvalible() async {
    return await networkInfo.isConnected;
  }

  //* State Functions ---------------------------------------------------------->

  @override
  void onInit() async {
    bool netAvaliblity = await isInternetAvalible();
    if (!netAvaliblity) {
      handleError(Failure('No internet connection found'));
      return;
    }
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

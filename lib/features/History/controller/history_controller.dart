import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/constants/data_type_enum.dart';
import 'package:visualizing_kashmir/core/data/app_data_source.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/model/get_books_response_model.dart';
import 'package:visualizing_kashmir/core/network/network_info.dart';

class HistoryController extends GetxController {
  //! External variables
  NetworkInfo networkInfo = Get.find<NetworkInfo>();
  AppDataSource appDataSource = Get.find<AppDataSource>();

  //! Model variables

  //! Class variables

  bool fetchingData = false;

  //? API CALLS STARTS --------------------------------------------------------------------------->
  //?=============================================================================================>

  //? API CALLS END --------------------------------------------------------------------------->
  //?===========================================================================================>

  //! Business Logic ---------------------------------------------------------->

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

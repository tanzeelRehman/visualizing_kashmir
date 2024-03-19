import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/network/network_info.dart';
import 'package:visualizing_kashmir/features/home/data/home_datasource.dart';
import 'package:visualizing_kashmir/features/home/model/get_all_employees.dart';

class EmployeeListController extends GetxController {
  //! External variables
  NetworkInfo networkInfo = Get.find<NetworkInfo>();
  HomeDataSource homeDataSource = Get.find<HomeDataSource>();

  //! Model variables
  late GetAllEmployeesResponseModel getAllEmployeesResponseModel;

  //! Class variables

  String selectedEmployeeName = '';
  int selectedEmployeeID = 0;
  bool fetchingData = false;

  // assets
  int laptopCount = 0;
  int mobileCount = 0;
  int internetDeviceCount = 0;

  //* API CALLS --------------------------------------------------------------------------->
  //- GET ALL EMPLOYEES
  Future<void> getAllEmployees() async {
    var response = await homeDataSource.getAllEmployees();
    if (response is Failure) {
      handleError(response);
    } else {
      getAllEmployeesResponseModel = response;
      Logger().i(getAllEmployeesResponseModel.toJson());
    }
  }

  //* Business Logic ---------------------------------------------------------->

  // This loader will be used for fetching all assigned and unassigned employees data
  void toggleFetchingEmployeeDataLoader() {
    fetchingData = !fetchingData;
    update();
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
}

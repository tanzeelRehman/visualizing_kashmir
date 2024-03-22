import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetsController extends GetxController {
  //* Widget State variables
  List<Map> addNewAssetsRecordData = [];

  //* Widget List
  var addAssetsWidgetList = <Widget>[];

  //! Business logic

  void handleError(String failure) {
    Get.snackbar(
      "Error",
      failure,
      colorText: Colors.white,
      borderColor: Colors.red,
      borderWidth: 1,
      snackPosition: SnackPosition.TOP,
    );
  }

  void handleSuccess(String failure) {
    Get.snackbar(
      "Success",
      failure,
      colorText: Colors.white,
      borderColor: Colors.green,
      borderWidth: 1,
      snackPosition: SnackPosition.TOP,
    );
  }

  //- CONSTANT DATA --------------------------------------------------------------------------------->
}

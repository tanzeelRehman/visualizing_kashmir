
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:visualizing_kashmir/core/theme/app_theme.dart';

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

  List<PopupMenuItem<String>> assetsList = [
    PopupMenuItem(
      value: 'Laptop',
      child: Text(
        "Laptop",
        style: AppTheme.subtitle1.copyWith(color: Colors.white),
      ),
    ),
    PopupMenuItem(
      value: 'Mobile',
      child: Text(
        "Mobile",
        style: AppTheme.subtitle1.copyWith(color: Colors.white),
      ),
    ),
    PopupMenuItem(
      value: 'Internet Device',
      child: Text(
        "Internet Device",
        style: AppTheme.subtitle1.copyWith(color: Colors.white),
      ),
    ),
  ];
  List<PopupMenuItem<String>> locationList = [
    PopupMenuItem(
      value: 'Islamabad',
      child: Text(
        "Islamabad",
        style: AppTheme.subtitle1.copyWith(color: Colors.white),
      ),
    ),
    PopupMenuItem(
      value: 'lahore',
      child: Text(
        "Lahore",
        style: AppTheme.subtitle1.copyWith(color: Colors.white),
      ),
    ),
    PopupMenuItem(
      value: 'Karachi',
      child: Text(
        "Karachi",
        style: AppTheme.subtitle1.copyWith(color: Colors.white),
      ),
    ),
  ];
}

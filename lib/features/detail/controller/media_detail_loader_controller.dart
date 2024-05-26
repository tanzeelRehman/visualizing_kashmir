// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/constants/app_url.dart';

import 'package:visualizing_kashmir/core/data/media_data_source.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/globle/globle.dart';

class MediaDetailLoaderController extends GetxController {
  //! External variables
  MediaDataSource mediaDataSource = Get.find<MediaDataSource>();
  final permission = Permission.storage;
  Dio dio = Get.find<Dio>();

  //! Class variables
  bool fetchingPdf = false;
  Uint8List? openedPdfByteData;
  late PdfViewerController pdfViewerController;
  TextEditingController pageNoController = TextEditingController();
  String? pdfEndpointLocalVariable;

  //? API CALLS STARTS --------------------------------------------------------------------------->
  //?=============================================================================================>

  //- LOAD PDF
  Future<void> loadPDF(String pdfEndPoint) async {
    pdfEndpointLocalVariable = null;
    pdfEndpointLocalVariable = pdfEndPoint;
    openedPdfByteData = null;
    startPDFScreenLoader();

    Logger().e('caling reports');
    var response = await mediaDataSource.loadPDF(pdfEndPoint);
    if (response is Failure) {
      handleError(response);
    } else {
      openedPdfByteData = response;
      pdfViewerController = PdfViewerController();
      startPDFScreenLoader();
    }
  }
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

  // This loader will be used for fetching dara on pdf detail screen
  void startPDFScreenLoader() {
    fetchingPdf = !fetchingPdf;
    update();
  }

  Future<void> requestStoragePermission() async {
    if (await permission.isDenied) {
      await permission.request();
    }
  }

  Future<bool> checkPermissionStatus() async {
    return await permission.status.isGranted;
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

  //! FILE DOWNLAOD FUNCTION====================================

  Future downloadFile({
    required Uint8List? data,
    required String filename,
  }) async {
    try {
      requestStoragePermission();
      final bool isGranted = await checkPermissionStatus();
      if (!isGranted) {
        handleError(const Failure('Permission denied to download the file'));
        return;
      }

      if (data == null) {
        handleError(const Failure('File download failed'));
        return;
      }

      Directory downloadDirectory;

      if (Platform.isIOS) {
        downloadDirectory = await getApplicationDocumentsDirectory();
      } else {
        downloadDirectory = (await getDownloadsDirectory())!;
        // if (!await downloadDirectory.exists()) {
        //   downloadDirectory = (await getExternalStorageDirectory())!;
        // }
      }

      String filePathName = "${downloadDirectory.path}/$filename.pdf";
      File savedFile = File(filePathName);
      savedFile.writeAsBytes(data);
      Logger().e(savedFile.path);
      handleSuccess('File downloaded sucessfully');
    } catch (error) {
      handleError(const Failure('File download failed'));
    }
  }
}

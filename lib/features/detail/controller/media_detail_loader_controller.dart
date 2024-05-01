// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:visualizing_kashmir/core/constants/app_pages.dart';

import 'package:visualizing_kashmir/core/data/media_data_source.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';

class MediaDetailLoaderController extends GetxController {
  //! External variables
  MediaDataSource mediaDataSource = Get.find<MediaDataSource>();

  //! Class variables
  bool fetchingPdf = false;
  Uint8List? openedPdfByteData;
  late PdfViewerController pdfViewerController;

  //? API CALLS STARTS --------------------------------------------------------------------------->
  //?=============================================================================================>

  //- LOAD PDF
  Future<void> loadPDF(String pdfEndPoint) async {
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
  downloadPDF(String pdfname) {
    downloadFile(data: openedPdfByteData, filename: pdfname);
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

  // This loader will be used for fetching dara on pdf detail screen
  void startPDFScreenLoader() {
    fetchingPdf = !fetchingPdf;
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

  //! FILE DOWNLAOD FUNCTION====================================
  Future downloadFile({
    required Uint8List? data,
    required String filename,
  }) async {
    try {
      if (data == null) {
        handleError(const Failure('File download failed'));
        return;
      }

      Directory downloadDirectory;

      if (Platform.isIOS) {
        downloadDirectory = await getApplicationDocumentsDirectory();
      } else {
        downloadDirectory = (await getExternalStorageDirectory())!;
        if (!await downloadDirectory.exists()) {
          downloadDirectory = (await getExternalStorageDirectory())!;
        }
      }

      String filePathName = "${downloadDirectory.path}/$filename";
      File savedFile = File(filePathName);
      savedFile.writeAsBytes(data);
      handleSuccess('File downloaded sucessfully');
    } catch (error) {
      handleError(const Failure('File download failed'));
    }
  }
}

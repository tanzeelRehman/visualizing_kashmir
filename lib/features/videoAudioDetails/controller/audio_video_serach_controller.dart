// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:video_player/video_player.dart';

import 'package:visualizing_kashmir/core/constants/app_url.dart';

import 'package:visualizing_kashmir/core/data/app_data_source.dart';
import 'package:visualizing_kashmir/core/data/media_data_source.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/globle/globle.dart';

import 'package:visualizing_kashmir/core/model/get_videos_response_model.dart';

class AudioVideoSearchController extends GetxController {
  //! External variables
  MediaDataSource mediaDataSource = Get.find<MediaDataSource>();
  AppDataSource appDataSource = Get.find<AppDataSource>();
  Dio dio = Get.find<Dio>();

  //! Model variables
  GetVideosResponseModel? getVideosResponseModel;

  //- SEARCH
  List<VideosData>? getVideosSearchResponseModel;

  //! Class variables
  bool fetchingData = false;
  bool loadingVideo = false;
  bool showControls = false;
  late final VideoPlayerController controller;
  late final ChewieController chewieController;

  //? API CALLS STARTS --------------------------------------------------------------------------->
  //?=============================================================================================>
  //- GET VIDEOS
  Future<void> getVideos() async {
    startMainScreenLoader();
    var response = await appDataSource.getVideos();
    if (response is Failure) {
      handleError(response);
      startMainScreenLoader();
    } else {
      getVideosResponseModel = response;
      getVideosSearchResponseModel = getVideosResponseModel!.data;
      Logger().i(getVideosResponseModel!.toJson());
      startMainScreenLoader();
    }
  }

  // Future<void> searchData(String searchType, String? query) async {
  //   if (searchType == DataType.report.name) {
  //     if (query == '' || query == null) {
  //       getReportsSearchResponseModel = getReportsResponseModel;
  //     } else {}
  //   }
  //   if (searchType == DataType.book.name) {
  //     if (query == '' || query == null) {
  //       getBooksSearchResponseModel = getBooksResponseModel!.data;
  //     } else {
  //       getBooksSearchResponseModel = getBooksResponseModel!.data
  //           .where((item) => item.heading.contains(query))
  //           .toList();
  //     }
  //   }

  //   update();
  // }

  //? API CALLS END --------------------------------------------------------------------------->
  //?===========================================================================================>

  //! Business Logic ---------------------------------------------------------->
  void initilizeVideplayer(String endUrl) async {
    String url = AppUrl.bunnyBaseUrl + endUrl;
    Logger().e(url);
   
    // if (controller != null) {
    //   controller!.dispose();
    // }
    startVideoLoader();
    // controller = VideoPlayerController.networkUrl(
    //   Uri.parse('https://storage.bunnycdn.com/visualizekashmir/videos/14.mp4'),
    //   httpHeaders: {
    //     'AccessKey': 'Bearer 98b54066-8625-477b-9b484f2e6dc8-c55a-4bde'
    //   },
    // )..initialize().then((value) {
    //     startMainScreenLoader();
    //     controller!.play();
    //   });

    controller =
        VideoPlayerController.networkUrl(Uri.parse(url),);

    await controller.initialize();
    chewieController = ChewieController(
      videoPlayerController: controller,
      allowFullScreen: true,
      materialProgressColors: ChewieProgressColors(handleColor: Get.theme.primaryColor),
      cupertinoProgressColors: ChewieProgressColors(handleColor: Get.theme.primaryColor),
      
      allowMuting: true,

    );
     startVideoLoader();
  }

  void showVideoControls() {
    showControls = true;
    update();
    Future.delayed(const Duration(seconds: 3), () {
      showControls = false;
      update();
    });
  }

  void playVideo() {
    controller.play();
    update();
  }

  void pauseVideo() {
    controller.pause();
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

  // This loader will be used for fetching dara
  void startMainScreenLoader() {
    fetchingData = !fetchingData;
    update();
  }

  // This loader will be used for laoding video data
  void startVideoLoader() {
    loadingVideo = !loadingVideo;
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

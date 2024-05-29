// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:video_player/video_player.dart';

import 'package:visualizing_kashmir/core/constants/app_url.dart';

import 'package:visualizing_kashmir/core/data/app_data_source.dart';
import 'package:visualizing_kashmir/core/data/media_data_source.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/globle/globle.dart';

import 'package:visualizing_kashmir/core/model/get_videos_response_model.dart';
import 'package:visualizing_kashmir/core/network/network_info.dart';

class AudioVideoSearchController extends GetxController {
  //! External variables
  MediaDataSource mediaDataSource = Get.find<MediaDataSource>();
  AppDataSource appDataSource = Get.find<AppDataSource>();
  Dio dio = Get.find<Dio>();
  NetworkInfo networkInfo = Get.find<NetworkInfo>();

  //! Model variables
  GetVideosResponseModel? getVideosResponseModel;

  //- SEARCH
  List<VideosData>? getVideosSearchResponseModel;

  //! Class variables
  bool fetchingData = false;
  bool loadingVideo = true;

  VideoPlayerController? controller;
  ChewieController? chewieController;

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
      // Logger().i(getVideosResponseModel!.toJson());
      startMainScreenLoader();
    }
  }

  Future<void> searchVideos(String? query) async {
    if (query == '' || query == null) {
      getVideosSearchResponseModel = getVideosResponseModel!.data;
    } else {
      getVideosSearchResponseModel = getVideosResponseModel!.data
          .where((item) => item.title.contains(query))
          .toList();
    }

    update();
  }

  //? API CALLS END --------------------------------------------------------------------------->
  //?===========================================================================================>

  //! Business Logic ---------------------------------------------------------->
  void initilizeVideplayer(String endUrl) async {
    String url = AppUrl.bunnyBaseUrl + endUrl;
    Logger().e(url);
    bool netAvaliblity = await isInternetAvalible();
    if (!netAvaliblity) {
      return handleError(Failure('No internet connection found'));
    }

    try {
      controller = VideoPlayerController.networkUrl(
        Uri.parse(url),
      );

      await controller!.initialize();

      chewieController = await ChewieController(
        videoPlayerController: controller!,
        allowFullScreen: true,
        autoPlay: true,
        useRootNavigator: true,
        errorBuilder: (context, errorMessage) {
          return SizedBox(
            height: Get.height * 0.9,
            width: Get.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Error Loading video',
                  style: Get.textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                    onTap: () {
                      if (controller != null) {
                        controller!.dispose();
                      }

                      Get.close(2);
                    },
                    child: Text(
                      'Go Back',
                      style: Get.textTheme.titleMedium!
                          .copyWith(color: Get.theme.primaryColor),
                    ))
              ],
            ),
          );
        },
        materialProgressColors: ChewieProgressColors(
            handleColor: Get.theme.primaryColor,
            playedColor: Get.theme.primaryColor,
            bufferedColor: Color(0xffd3e6e6)),
        cupertinoProgressColors:
            ChewieProgressColors(handleColor: Get.theme.primaryColor),
        allowMuting: true,
      );
      Future.delayed(Duration(seconds: 2));
      startVideoLoader();
    } catch (e) {
      handleError(Failure('Video source is not avalible'));
      startVideoLoader();
    }
  }

  void updateScreen() {
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

  Future<bool> isInternetAvalible() async {
    return await networkInfo.isConnected;
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

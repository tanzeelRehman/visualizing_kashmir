import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:visualizing_kashmir/core/api/app_interceptors.dart';
import 'package:visualizing_kashmir/core/data/app_data_source.dart';
import 'package:visualizing_kashmir/core/data/media_data_source.dart';
import 'package:visualizing_kashmir/core/helper/saveLanguageSettings.dart';
import 'package:visualizing_kashmir/core/network/network_info.dart';
import 'package:visualizing_kashmir/features/Language/controller/language_controller.dart';
import 'package:visualizing_kashmir/features/detail/controller/media_detail_loader_controller.dart';

import 'package:visualizing_kashmir/features/home/controller/home_controller.dart';
import 'package:visualizing_kashmir/core/data/home_datasource.dart';
import 'package:visualizing_kashmir/features/videoAudioDetails/controller/audio_video_serach_controller.dart';

Future<void> init() async {
  //fenix: true means controllers will remain in the memory, If you dont add this paraeter their value will get deleted automaticaly
  //! GETX CONTROLLERS --------------->
  Get.lazyPut(() => HomeController());
  Get.lazyPut<LanguageController>(() => LanguageController(), fenix: true);
  Get.lazyPut<MediaDetailLoaderController>(() => MediaDetailLoaderController(),
      fenix: true);
  Get.lazyPut<AudioVideoSearchController>(() => AudioVideoSearchController(),
      fenix: true);

  //! Data Sources
  Get.lazyPut(() => HomeDataSource(), fenix: true);
  Get.lazyPut(() => AppDataSource(), fenix: true);
  Get.lazyPut(() => MediaDataSource(), fenix: true);

  //! External ------------------->
  //* DIO Configurationsd
  Get.lazyPut<Dio>(
      () => Dio(
            BaseOptions(
              receiveTimeout: const Duration(seconds: 15),
              connectTimeout: const Duration(seconds: 15),
              sendTimeout: const Duration(seconds: 15),
            ),
          )..interceptors.add(AppInterceptors()),
      fenix: true);
  Get.lazyPut<InternetConnectionChecker>(() => InternetConnectionChecker(),
      fenix: true);

  //! Core ------------------------>
  Get.lazyPut<NetworkInfo>(
      () => NetworkInfoImpl(Get.find<InternetConnectionChecker>()),
      fenix: true);
  //Get.lazyPut(() => NetworkInfo());

  //! Getting Language Data ------------------------------>
  SaveLanguageSettings.getLanguageCode();
  SaveLanguageSettings.getLanguageCountry();
}

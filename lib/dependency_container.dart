import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:visualizing_kashmir/core/helper/saveLanguageSettings.dart';
import 'package:visualizing_kashmir/core/network/network_info.dart';
import 'package:visualizing_kashmir/features/Language/controller/language_controller.dart';

import 'package:visualizing_kashmir/features/home/controller/employee_list_controller.dart';
import 'package:visualizing_kashmir/features/home/data/home_datasource.dart';

Future<void> init() async {
  //! GETX CONTROLLERS --------------->
  Get.lazyPut(() => EmployeeListController());
  Get.lazyPut<LanguageController>(() => LanguageController(), fenix: true);

  //! Data Sources
  Get.lazyPut(() => HomeDataSource());

  //! External ------------------->
  //* DIO Configurations
  Get.lazyPut<Dio>(() => Dio(
        BaseOptions(
          receiveTimeout: const Duration(seconds: 5),
          connectTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
        ),
      ));
  //..interceptors.add(AppInterceptors()));
  Get.lazyPut<InternetConnectionChecker>(() => InternetConnectionChecker());

  //! Core ------------------------>
  Get.lazyPut<NetworkInfo>(
      () => NetworkInfoImpl(Get.find<InternetConnectionChecker>()));

  //! Getting Language Data ------------------------------>
  SaveLanguageSettings.getLanguageCode();
  SaveLanguageSettings.getLanguageCountry();
}

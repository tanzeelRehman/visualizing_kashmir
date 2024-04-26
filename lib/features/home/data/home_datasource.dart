import 'package:dio/dio.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/constants/app_url.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/globle/globle.dart';
import 'package:visualizing_kashmir/features/home/model/get_all_employees.dart';
import 'package:visualizing_kashmir/features/home/model/get_weather_response.dart';

class HomeDataSource {
  //! Instenses
  Dio dio = Get.find<Dio>();

  //* API CALLS ------------------------------------------------------------------->

  //- GET EMPLOYEES
  Future<dynamic> getAllEmployees() async {
    String url = AppUrl.baseUrl + AppUrl.getAllEmployees;
    Logger().i("get All employees url $url");
    try {
      final response = await dio.get(url);
      Logger().i(response.statusCode);
      if (response.statusCode == 200) {
        var object = GetAllEmployeesResponseModel.fromJson(response.data);
        return object;
      }

      return const Failure('Something went wrong');
    } on Exception catch (e) {
      return Failure(e.toString());
    }
  }

  //?- GET WEATHER INFO
  Future<dynamic> getWeather() async {
    String url =
        '${AppUrl.weatherBaseUrl}/weather?lat=$kashmirLat&lon=$kashmirLong&appid=$weatheAppId';
    Logger().i("get All employees url $url");
    try {
      final response = await dio.get(url);
      Logger().i(response.statusCode);
      if (response.statusCode == 200) {
        var object = GetWeatherResponse.fromJson(response.data);
        return object;
      }

      return const Failure('Something went wrong');
    } on Exception catch (e) {
      return Failure(e.toString());
    }
  }
}

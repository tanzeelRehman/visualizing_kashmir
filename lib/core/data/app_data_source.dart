import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/constants/app_url.dart';
import 'package:visualizing_kashmir/core/constants/data_type_enum.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/model/get_articles_response_model.dart';
import 'package:visualizing_kashmir/core/model/get_books_response_model.dart';
import 'package:visualizing_kashmir/core/model/get_know_your_heros_response_model.dart';
import 'package:visualizing_kashmir/core/model/get_reports_response_model.dart';
import 'package:visualizing_kashmir/core/model/get_videos_response_model.dart';
import 'package:visualizing_kashmir/core/network/network_info.dart';

class AppDataSource {
  //! Instenses
  Dio dio = Get.find<Dio>();
  NetworkInfo networkInfo = Get.find<NetworkInfo>();

  //* FOR ARTICLE / REPORTS / BOOKS DATA
  Future<dynamic> getData(DataType dataType) async {
    bool netAvaliblity = await isInternetAvalible();
    if (!netAvaliblity) {
      return const Failure('No internet connection found');
    }
    String url =
        '${AppUrl.baseUrl}${AppUrl.getData}page=null&type=${dataType.name}&search=null';
    Logger().i("get data url $url");

    try {
      final response = await dio.get(url);
      Logger().i(response.statusCode);

      //? GET BOOKS DATA
      if (dataType.name == DataType.book.name) {
        if (response.statusCode == 200) {
          var object = GetBooksResponseModel.fromJson(response.data);
          return object;
        }

        return const Failure('Something went wrong');
      }

      //? GET ARTICLE DATA
      if (dataType.name == DataType.article.name) {
        if (response.statusCode == 200) {
          var object = GetArticlesResponseModel.fromJson(response.data);
          return object;
        }

        return const Failure('Something went wrong');
      }

      //? GET REPORT DATA
      if (dataType.name == DataType.report.name) {
        if (response.statusCode == 200) {
          var object = GetReportsResponseModel.fromJson(response.data);
          return object;
        }

        return const Failure('Something went wrong');
      }
    } on Exception catch (e) {
      return Failure(e.toString());
    }
  }

  //* FOR VIDEOS DATA
  Future<dynamic> getVideos() async {
    bool netAvaliblity = await isInternetAvalible();
    if (!netAvaliblity) {
      return const Failure('No internet connection found');
    }
    String url = '${AppUrl.baseUrl}${AppUrl.getVideos}';
    Logger().i("get video url $url");

    try {
      final response = await dio.get(url);
      Logger().i(response.statusCode);

      if (response.statusCode == 200) {
        var object = GetVideosResponseModel.fromJson(response.data);
        return object;
      }
    } on Exception catch (e) {
      return Failure(e.toString());
    }
  }

  //* FOR KNOW YOUR HEROS DATA
  Future<dynamic> getKnowYourHeros() async {
    bool netAvaliblity = await isInternetAvalible();
    if (!netAvaliblity) {
      return const Failure('No internet connection found');
    }
    String url = '${AppUrl.baseUrl}${AppUrl.getKnowYourHeros}';
    Logger().i("get hero url $url");

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        var object = GetKnowYourHerosResponseModel.fromJson(response.data);
        Logger().e(object.toJson());
        return object;
      }
    } on Exception catch (e) {
      return Failure(e.toString());
    }
  }

  //* UTALITY FUNCTIONS ------------------------------------------------->
  //*====================================================================>
  Future<bool> isInternetAvalible() async {
    return await networkInfo.isConnected;
  }

  void handleNoIntenrtError() {
    Get.snackbar(
      "No Internet Connection",
      "Please check your connection and try again",
      snackPosition: SnackPosition.TOP,
    );
  }
}

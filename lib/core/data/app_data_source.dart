import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/constants/app_url.dart';
import 'package:visualizing_kashmir/core/constants/data_type_enum.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/model/get_articles_response_model.dart';
import 'package:visualizing_kashmir/core/model/get_books_response_model.dart';
import 'package:visualizing_kashmir/core/model/get_reports_response_model.dart';

class AppDataSource {
  //! Instenses
  Dio dio = Get.find<Dio>();

  Future<dynamic> getData(DataType dataType) async {
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
}

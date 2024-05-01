import 'package:dio/dio.dart' as dioo;

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/constants/app_url.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';

import 'package:visualizing_kashmir/core/globle/globle.dart';

class MediaDataSource {
  //! Instenses
  dioo.Dio dio = Get.find<dioo.Dio>();

  Future<dynamic> loadPDF(String pdfEndpoint) async {
    String url = '${AppUrl.bunnyBaseUrl}$pdfEndpoint';

    Map<String, String> headers = {
      'AccessKey': bunnyAcessKey,
    };

    try {
      dioo.Response response = await dio.get(url,
          options: dioo.Options(
              headers: headers, responseType: dioo.ResponseType.bytes));
      Logger().e(response.statusCode);
      if (response.statusCode == 200) {
        var object = response.data;
        return object;
      }

      return const Failure('Something went wrong');
    } on Exception catch (e) {
      return Failure(e.toString());
    }
  }
}

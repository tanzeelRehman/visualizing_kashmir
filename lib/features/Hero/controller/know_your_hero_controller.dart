import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KnowYourHeroController extends GetxController {
  late final WebViewController? webViewController;

  bool loadingWebview = false;
  void initilizeWebView(String url) {
    //toggleLoader();
    webViewController ??= WebViewController();

    webViewController!.setJavaScriptMode(JavaScriptMode.unrestricted);

    webViewController!.loadRequest(Uri.parse(url));
  }

  void toggleLoader() {
    loadingWebview = !loadingWebview;
    update();
  }

  void handleError(Failure failure) {
    Get.snackbar(
      "Error",
      failure.message,
      snackPosition: SnackPosition.TOP,
    );
  }
}

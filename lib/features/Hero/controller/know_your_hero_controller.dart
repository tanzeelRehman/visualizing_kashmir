import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/error/failures.dart';
import 'package:visualizing_kashmir/core/network/network_info.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KnowYourHeroController extends GetxController {
  late final WebViewController? webViewController;
  NetworkInfo networkInfo = Get.find<NetworkInfo>();

  bool loadingWebview = false;
  void initilizeWebView(String url) async {
    webViewController!.setJavaScriptMode(JavaScriptMode.unrestricted);

    webViewController!.loadRequest(Uri.parse(url));
  }

  Future<void> clearAlldata() async {
    await webViewController!.clearCache();
    await webViewController!.clearLocalStorage();
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

  Future<bool> isInternetAvalible() async {
    return await networkInfo.isConnected;
  }

  @override
  void onInit() {
    // Get called when controller is created
    webViewController = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {},
        onPageFinished: (url) {},
      ));

    super.onInit();
  }
}

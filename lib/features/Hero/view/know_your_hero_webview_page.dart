import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/widgets/custom_appbar.dart';
import 'package:visualizing_kashmir/features/Hero/controller/know_your_hero_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KnowHeroWebViewPage extends StatefulWidget {
  const KnowHeroWebViewPage({super.key});

  @override
  State<KnowHeroWebViewPage> createState() => _KnowHeroWebViewPageState();
}

class _KnowHeroWebViewPageState extends State<KnowHeroWebViewPage> {
  KnowYourHeroController knowYourHeroController =
      Get.find<KnowYourHeroController>();
  dynamic args = Get.arguments;

  @override
  void initState() {
    super.initState();
    Logger().e(args[0]['url']);
    Logger().e(args[1]['name']);
    knowYourHeroController.initilizeWebView(args[0]['url']);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    knowYourHeroController.webViewController = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<KnowYourHeroController>(
        builder: (controller) {
          if (controller.loadingWebview) {
            return SizedBox(
              width: Get.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.h,
                    width: 60.w,
                    child: LoadingIndicator(
                      indicatorType: Indicator.lineScale,
                      colors: [Get.theme.primaryColor],
                      strokeWidth: 2,
                    ),
                  )
                ],
              ),
            );
          } else {
            return SafeArea(
              child: Column(
                children: [
                  CustomAppBar(
                    title: args[1]['name'],
                    height: 80,
                  ),
                  SizedBox(
                    height: Get.height - 110,
                    child: WebViewWidget(
                        controller: knowYourHeroController.webViewController!),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:visualizing_kashmir/core/widgets/Custom%20Routes/Popups/show_pop_up.dart';
import 'package:visualizing_kashmir/core/widgets/custom_appbar.dart';
import 'package:visualizing_kashmir/features/detail/controller/media_detail_loader_controller.dart';

class PDFDetailPage extends StatelessWidget {
  const PDFDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String pdfName = Get.arguments ?? '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        title: Text(
          pdfName,
          style: Get.textTheme.bodySmall!.copyWith(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return
              //   },
              // );
            },
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          PopupMenuButton<int>(
            iconColor: Colors.white,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                // row has two child icon and text
                child: Row(
                  children: [
                    Icon(
                      Icons.pages,
                      color: Get.theme.primaryColor,
                    ),
                    const SizedBox(
                      // sized box with width 10
                      width: 10,
                    ),
                    const Text("Go to first page")
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                // row has two child icon and text
                child: Row(
                  children: [
                    Icon(
                      Icons.pages,
                      color: Get.theme.primaryColor,
                    ),
                    const SizedBox(
                      // sized box with width 10
                      width: 10,
                    ),
                    const Text("Go to last page")
                  ],
                ),
              ),
            ],
            offset: const Offset(0, 50),
            color: Get.theme.cardColor,
            elevation: 2,
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: GetBuilder<MediaDetailLoaderController>(
        builder: (mediaController) {
          if (mediaController.fetchingPdf) {
            return Stack(
              children: [
                SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60.h,
                          width: 60.w,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballSpinFadeLoader,
                            colors: [Get.theme.primaryColor],
                            strokeWidth: 2,
                          ),
                        ),
                      ],
                    )),
              ],
            );
          } else {
            return Stack(
              children: [
                SfPdfViewer.memory(
                  mediaController.openedPdfByteData!,
                  canShowScrollHead: true,
                  canShowScrollStatus: true,
                  canShowPaginationDialog: true,
                  controller: mediaController.pdfViewerController,
                ),
                Positioned(
                  bottom: 20.h,
                  child: SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            mediaController.downloadPDF(pdfName);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 55.h,
                            width: Get.width * 0.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: Get.theme.primaryColor),
                            child: Text(
                              'Download',
                              style: Get.textTheme.titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

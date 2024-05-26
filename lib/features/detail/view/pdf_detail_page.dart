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
import 'package:visualizing_kashmir/features/detail/view/widgets/go_to_page_dialog.dart';

class PDFDetailPage extends StatelessWidget {
  PDFDetailPage({super.key});

  final MediaDetailLoaderController cont =
      Get.find<MediaDetailLoaderController>();

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
              showDialog(
                //  barrierDismissible: false,
                context: context,
                builder: (context) {
                  return Dialog(
                    child: GoToPageDialog(cont: cont),
                  );
                },
              );
            },
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10.w,
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
                  enableHyperlinkNavigation: true,
                  onTextSelectionChanged: (details) {},
                  controller: mediaController.pdfViewerController,
                  onPageChanged: (details) {
                    print(details.newPageNumber);
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

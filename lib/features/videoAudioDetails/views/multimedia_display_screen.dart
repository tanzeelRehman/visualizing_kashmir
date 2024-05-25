import 'package:flutter/material.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';

import 'package:visualizing_kashmir/core/constants/app_assets.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/constants/multimedia_enum.dart';
import 'package:visualizing_kashmir/core/constants/search_enum.dart';
import 'package:visualizing_kashmir/core/helper/getPreferedSizeAppbar.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/core/widgets/custom_text_formfield.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continue_small_button.dart';
import 'package:visualizing_kashmir/core/widgets/primary_continuebutton.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/article_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/books_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/know_heros_search_card.dart';
import 'package:visualizing_kashmir/features/search/view/widgets/reports_search_card.dart';
import 'package:visualizing_kashmir/features/videoAudioDetails/controller/audio_video_serach_controller.dart';
import 'package:visualizing_kashmir/features/videoAudioDetails/views/widgets/audio_play_widget.dart';
import 'package:visualizing_kashmir/features/videoAudioDetails/views/widgets/video_play_widget.dart';

class MultiMediaDisplayScreen extends StatefulWidget {
  const MultiMediaDisplayScreen({super.key});

  @override
  State<MultiMediaDisplayScreen> createState() =>
      _MultiMediaDisplayScreenState();
}

class _MultiMediaDisplayScreenState extends State<MultiMediaDisplayScreen> {
  final FocusNode searchFocusNode = FocusNode();

  final TextEditingController searchController = TextEditingController();

  final AudioVideoSearchController audioVideoSearchController =
      Get.find<AudioVideoSearchController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      audioVideoSearchController.getVideos();
      // Add Your Code here.
    });
  }

  @override
  void dispose() {
    if (audioVideoSearchController.chewieController != null) {
      audioVideoSearchController.chewieController!.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String searchType = Get.arguments ?? '';
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: getPreferedSizeAppbar(searchType, focusNode: searchFocusNode),
        body: Directionality(
          textDirection: Directionality.of(context) == TextDirection.rtl
              ? TextDirection.ltr
              : TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Column(children: [
              CustomTextFormField(
                controller: searchController,
                focusNode: searchFocusNode,
                onChanged: (value) {
                  audioVideoSearchController.searchVideos(value);
                },
                hintText: "Search",
                height: 55.h,
                suffixIcon: const Icon(
                  Icons.search,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              //* Audio Search -------------------------------->
              // if (searchType == MultiMediaType.Audios.name)
              //   SizedBox(
              //     height: Get.height * 0.72,
              //     child: ListView.builder(
              //       itemCount: 9,
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding: EdgeInsets.only(top: 15.h),
              //           child: const AudioPlayWidget(),
              //         );
              //       },
              //     ),
              //   ),
              //* VIDEOS Search -------------------------------->
              if (searchType == MultiMediaType.Videos.name)
                GetBuilder<AudioVideoSearchController>(
                  builder: (_) {
                    if (_.fetchingData) {
                      return SizedBox(
                          height: Get.height * 0.72,
                          child: Column(
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
                          ));
                    } else {
                      if (audioVideoSearchController.getVideosResponseModel ==
                          null) {
                        return const SizedBox.shrink();
                      } else {
                        if (audioVideoSearchController
                                    .getVideosSearchResponseModel ==
                                null ||
                            audioVideoSearchController
                                .getVideosSearchResponseModel!.isEmpty) {
                          return SizedBox(
                            height: Get.height * 0.72,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20.sp),
                                  child: Lottie.asset(
                                    'assets/images/lottie/no_data_lottie.json',
                                    height: 250.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  'No Videos found',
                                  style: Get.textTheme.titleMedium,
                                )
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: Get.height * 0.72,
                            child: ListView.builder(
                              itemCount: audioVideoSearchController
                                  .getVideosSearchResponseModel!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: EdgeInsets.only(top: 15.h),
                                    child: VideoPlayWidget(
                                      ontap: () {
                                        Get.toNamed(AppPages.videoPlayerPage,
                                            arguments: audioVideoSearchController
                                                .getVideosSearchResponseModel![
                                                    index]
                                                .file);
                                      },
                                      title: audioVideoSearchController
                                          .getVideosSearchResponseModel![index]
                                          .title,
                                    ));
                              },
                            ),
                          );
                        }
                      }
                    }
                  },
                ),
            ]),
          ),
        ));
  }
}

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:video_player/video_player.dart';
import 'package:visualizing_kashmir/core/widgets/custom_appbar.dart';
import 'package:visualizing_kashmir/features/videoAudioDetails/controller/audio_video_serach_controller.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  AudioVideoSearchController audioVideoSearchController =
      Get.find<AudioVideoSearchController>();
  final String videoEndUrl = Get.arguments ?? '';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      audioVideoSearchController.initilizeVideplayer(videoEndUrl);
      // Add Your Code here.
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    audioVideoSearchController.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        //  CustomAppBar(title: '', ),
          GetBuilder<AudioVideoSearchController>(
            builder: (controller) {
              if (audioVideoSearchController.loadingVideo) {
                return  Padding(
                  padding:  EdgeInsets.only(top: 30.h),
                  child: SizedBox(
                                  height: 60.h,
                                  width: 60.w,
                                  child: LoadingIndicator(
                                    indicatorType: Indicator.lineScale,
                                    colors: [Get.theme.primaryColor],
                                    strokeWidth: 2,
                                  ),
                                ),
                );
              } else {
                return SizedBox(
                  height: Get.height*0.6,
                  child: Chewie(
                  
                  
                                controller:
                                    audioVideoSearchController.chewieController),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

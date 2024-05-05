import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          CustomAppBar(title: ''),
          GetBuilder<AudioVideoSearchController>(
            builder: (controller) {
              if (audioVideoSearchController.loadingVideo) {
                return const SizedBox.shrink();
              } else {
                return GestureDetector(
                  onTap: () {
                    audioVideoSearchController.showVideoControls();
                  },
                  child: Stack(
                    children: [
                      audioVideoSearchController.controller.value.isInitialized
                          ? Chewie(
                              controller:
                                  audioVideoSearchController.chewieController)
                          : Container(),
                      if (audioVideoSearchController.showControls)
                        Expanded(
                          child: Container(
                            color: Colors.black54,
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  audioVideoSearchController
                                          .controller.value.isPlaying
                                      ? audioVideoSearchController.pauseVideo()
                                      : audioVideoSearchController.playVideo();
                                },
                                icon: Icon(
                                  audioVideoSearchController
                                          .controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

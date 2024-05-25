import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:video_player/video_player.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';
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
      audioVideoSearchController.loadingVideo = true;
    if (audioVideoSearchController.controller!=null) {
       audioVideoSearchController.controller!.dispose();
  
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
          audioVideoSearchController.loadingVideo = true;
         if (audioVideoSearchController.controller!=null) {
         audioVideoSearchController.controller!.dispose();
  
    }
      },
      child: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
      
            GetBuilder<AudioVideoSearchController>(
              builder: (controller) {
                if (audioVideoSearchController.loadingVideo ) {
                  return  SizedBox(
                    height: Get.height*0.9,
                    width: Get.width*0.9,
                    child: Column(
                      
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                                        height: 60.h,
                                        width: 60.w,
                                        child: LoadingIndicator(
                                          indicatorType: Indicator.lineScale,
                                          colors: [Get.theme.primaryColor],
                                          strokeWidth: 2,
                                        ),
                                      ),
                      ],
                    ),
                  );
                } else {
                  if (controller.controller==null) {
                    return  SizedBox(
                    height: Get.height*0.9,
                    width: Get.width*0.9,
                    child: Column(
                      
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       Text('Error Loading video' , style: Get.textTheme.bodyMedium,),
                       SizedBox(height: 8.h,),
                       GestureDetector(
                        onTap: () {
                          if (audioVideoSearchController.controller!=null) {
                            audioVideoSearchController.controller!.dispose();
                          }
                            
                          Get.close(2);
                        },
                        child: Text('Go Back' , style: Get.textTheme.titleMedium!.copyWith(color: Get.theme.primaryColor),))
                      ],
                    ),
                  );
                  } else{
                    if (   audioVideoSearchController.chewieController==null) {
                      return SizedBox.shrink();
                    }else{
                  return SizedBox(
                    height: Get.height*0.95,
                    child: Stack(
                      children: [
                    
                        Chewie(
                      
                        
                                      controller:
                                          audioVideoSearchController.chewieController!),
                                           Positioned(
                                            top: 8.sp,
                                            left: 12.sp,
                                            child: GestureDetector(
                                              onTap: () {
                                           //   audioVideoSearchController.controller!.dispose();
                                              audioVideoSearchController.loadingVideo = true;
                                                Get.close(1);
                                              },
                                              child: Icon(Icons.arrow_back, color: Colors.white,))),
                      ],
                    ),
                  );
               
                  
                    }
                  }
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}

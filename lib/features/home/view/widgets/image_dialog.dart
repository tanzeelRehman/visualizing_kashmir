import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ImageDialog extends StatelessWidget {
  final String imagePath;
  const ImageDialog({
    super.key,
    required this.imagePath,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: GlobalKey(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Stack(
          children: [
            Container(
              width: Get.width * 0.85,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(imagePath), fit: BoxFit.cover)),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: Get.theme.primaryColor,
                  radius: 15.r,
                  child: Icon(
                    Icons.zoom_in_map,
                    size: 15.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Get.theme.primaryColor.withOpacity(.5),
      width: double.infinity,
    );
  }
}

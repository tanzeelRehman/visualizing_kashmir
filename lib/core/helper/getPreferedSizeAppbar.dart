import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visualizing_kashmir/core/widgets/custom_appbar.dart';

PreferredSize getPreferedSizeAppbar(String title, {Function? onBack}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(120.h),
      child: CustomAppBar(
        title: title,
        onBack: onBack,
      ));
}

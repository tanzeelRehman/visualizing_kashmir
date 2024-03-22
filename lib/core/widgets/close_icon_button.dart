import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CloseIconButton extends StatelessWidget {
  Color? bgColor;
  Function()? ontap;
  CloseIconButton(
      {super.key, this.bgColor = Colors.black, this.ontap, iconSize});

  double? iconSize = 16.sp;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2.0.sp),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(15.r)),
        child: GestureDetector(
          onTap: ontap,
          child: Icon(
            Icons.close,
            size: 14.sp,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ));
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class QuizOption extends StatefulWidget {
  final String state;
  final String value;

  const QuizOption({super.key, required this.state, required this.value});

  @override
  State<QuizOption> createState() => _QuizOptionState();
}

class _QuizOptionState extends State<QuizOption> {
  bool showValues = false;

  Color mainColor = Colors.grey;
  IconData mainIcon = Icons.abc;

  void determineColor() {
    print(widget.state);
    if (widget.state == 'simple') {
      mainColor = Colors.grey;
    } else if (widget.state == 'sucess') {
      if (showValues) {
        mainColor = Colors.green;
      }
    } else if (widget.state == 'wrong') {
      if (showValues) {
        mainColor = Colors.red;
      }
    }

    setState(() {});
  }

  void determinIcon() {
    if (showValues) {
      if (widget.state == 'sucess') {
        mainIcon = Icons.check_circle;
      } else if (widget.state == 'wrong') {
        mainIcon = Icons.close_rounded;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('taping');
        setState(() {
          showValues = true;
        });
        determineColor();
        determinIcon();
      },
      child: Container(
        height: 50.h,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
            color: Get.theme.canvasColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: mainColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.value,
              style: Get.textTheme.bodySmall,
            ),
            showValues
                ? widget.state == 'simple'
                    ? const SizedBox.shrink()
                    : Icon(
                        mainIcon,
                        color: mainColor,
                      )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

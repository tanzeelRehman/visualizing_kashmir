import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obsecure;
  bool isPassword;
  double height;
  double width;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  Function(String value)? onChanged;
  EdgeInsetsGeometry? contentPadding;
  Function()? ontapped;
  bool readonly;
  CustomTextFormField(
      {super.key,
      required this.controller,
      this.hintText = "Input here",
      this.height = 55,
      this.width = double.infinity,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      this.onChanged,
      this.obsecure = false,
      this.isPassword = false,
      this.contentPadding,
      this.ontapped,
      this.readonly = false,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 8.sp),
      decoration: AppTheme.roundedContainerDecorationwithLessShadows
          .copyWith(color: Colors.white),
      child: TextFormField(
        textInputAction: widget.textInputAction,
        onTap: widget.ontapped,
        obscureText: widget.obsecure,
        readOnly: widget.readonly,
        obscuringCharacter: "*",
        style: Theme.of(context).textTheme.bodyMedium,
        cursorColor: Get.theme.primaryColor,
        onChanged: widget.onChanged ?? (value) {},
        controller: widget.controller,
        keyboardType: widget.textInputType,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding:
                widget.contentPadding ?? EdgeInsets.symmetric(vertical: 15.sp),
            hintStyle: Theme.of(context).textTheme.bodySmall,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: (() {
                      setState(() {
                        widget.obsecure = !widget.obsecure;
                      });
                    }),
                    icon: Icon(
                      color: Theme.of(context).primaryColor,
                      widget.obsecure ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : widget.suffixIcon ?? const SizedBox.shrink(),
            border: InputBorder.none),
      ),
    );
  }
}

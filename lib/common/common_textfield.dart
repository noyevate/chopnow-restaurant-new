import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
      this.keyboardType,
      this.controller,
      this.onEditingComplete,
      this.obscureText,
      this.suffixIcon,
      this.validator,
      this.prefixIcon,
      this.hintText, this.maxLines});

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 6.h),
      decoration: BoxDecoration(
          border: Border.all(color: Tcolor.primary, width: 1.5),
          borderRadius: BorderRadius.circular(20.r)),
      child: TextFormField(
        maxLines: maxLines??5,
        keyboardType: keyboardType,
        controller: controller,
        onEditingComplete: onEditingComplete,
        obscureText: obscureText ?? false,
        cursorHeight: 50.h,
        style: TextStyle(
            fontSize: 11, color: Tcolor.Text, fontWeight: FontWeight.normal),
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
              fontSize: 40.h, color: Tcolor.Text, fontWeight: FontWeight.normal),
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          isDense: true,
        ),
      ),
    );
  }
}

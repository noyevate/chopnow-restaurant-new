import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, this.onEditingComplete, this.keyboardType, this.initialValue, this.controller, this.hintText, this.prefixIcon});

  final void Function()?onEditingComplete;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Tcolor.Text,
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType?? TextInputType.emailAddress,
      initialValue: initialValue,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter valid data";
        } else {
          return null;
        }
      },
      style: TextStyle(
        fontSize: 24.h,
        color: Tcolor.Text,
        fontWeight: FontWeight.normal
      ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        isDense: true,
        contentPadding: EdgeInsets.all(15.r),
        hintStyle: TextStyle(fontSize: 24.h, color: Tcolor.gray, fontWeight: FontWeight.normal),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Tcolor.red,
            width: .5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(24.r))
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Tcolor.primary,
            width: .5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(18.r))
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Tcolor.red,
            width: .5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(24.r))
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Tcolor.gray,
            width: .5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(24.r))
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Tcolor.purplr,
            width: .5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(24.r))
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Tcolor.primary,
            width: .5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(24.r),)
        )
      ),
    );
  }
}
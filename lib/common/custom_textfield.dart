
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.keyboardType,
      this.controller,
      this.onEditingComplete,
      this.obscureText,
      this.suffixIcon,
      
      this.prefixIcon,
      this.hintText, this.maxLines});

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  
  final String? hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: width,
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 6.h),
      child: TextFormField(
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          controller: controller,
          
          onEditingComplete: onEditingComplete,
          obscureText: obscureText ?? false,
          cursorHeight: 50.h,
          style: TextStyle(
              fontSize: 11, color: Tcolor.Text, fontWeight: FontWeight.normal),
          validator: (value) {
            if(value == null || value.isEmpty) {
              return "Please enter dome text";
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.r),
              borderSide: BorderSide(color: Tcolor.primary, width: 2.w)
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.r),
              borderSide: BorderSide(color: Tcolor.red,width: 2.w)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.r),
              borderSide: BorderSide(color: Tcolor.primary,width: 2.w)
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.r),
              borderSide: BorderSide(color: Tcolor.red,width: 2.w
            ),),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.r),
              borderSide: BorderSide(color: Tcolor.gray,width: 2.w)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.r),
              borderSide: BorderSide(color: Tcolor.Secondary,width: 2.w)
            ),
            hintStyle: TextStyle(
                fontSize: 40.h, color: Tcolor.placeHolder, fontWeight: FontWeight.normal),
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
            horizontal: 6.h, // Adjust as needed
            vertical: 30.h,
            ) 
          ),
      ),
    );
    
  }
}

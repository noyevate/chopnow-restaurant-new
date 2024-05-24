import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      this.btnWidth,
      this.btnHeight,
      this.btnColor,
      this.raduis,
      required this.title});
  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final Color? btnColor;
  final double? raduis;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? width,
        height: btnHeight ?? 56.h,
        decoration: BoxDecoration(
          color: btnColor ?? Tcolor.primary,
          borderRadius: BorderRadius.circular(raduis ?? 18.r),
        ),
        child: Center(
          child: ReuseableText(
              title: title,
              style: TextStyle(
                  fontSize: 25.h,
                  color: Tcolor.white,
                  fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

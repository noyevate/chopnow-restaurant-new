import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashbordTextWidget extends StatelessWidget {
  const DashbordTextWidget({super.key, required this.first, required this.second, this.textAlign});

  final String first;
  final String second;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      ReuseableText(
         title: first,
         style: TextStyle(
             color: Tcolor.gray,
             fontSize: 25.sp,
             fontWeight: FontWeight.w500)),
     ReuseableText(
         title: second,
         style: TextStyle(
             color: Tcolor.gray,
             fontSize: 25.sp,
             fontWeight: FontWeight.w500)),
    ],
            );
  }
}

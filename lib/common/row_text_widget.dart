
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    required this.first,
    required this.second, this.textAlign,
  });
  final String first;
  final String second;
  final TextAlign? textAlign;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReuseableText(
          title: first,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w500,
            color: Tcolor.gray,
            
          ),
        ),
        ReuseableText(
          title: second,
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w500,
            color: Tcolor.gray,
            
          ),
        ),

      ],
    );
  }
}

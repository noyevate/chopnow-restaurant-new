
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.title, this.onTap, this.more});

  final String title;
  final Function()? onTap;
  final bool? more;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.only(top: 12.h),
          child: 
            ReuseableText(title: title, style: TextStyle(fontSize: 16, color: Tcolor.Text, fontWeight: FontWeight.w700),
            ),
            ),
            more == null ? GestureDetector(
              onTap: onTap,
              child: Icon(
                AntDesign.appstore1,
                color: Tcolor.primary,
                size: 30.sp,
              ),
            ) :
            const SizedBox.shrink()
        ],
      ),
    );
  }
}
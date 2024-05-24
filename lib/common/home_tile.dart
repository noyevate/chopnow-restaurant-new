
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({super.key, this.onTap, required this.title, required this.iconPath});
  final void Function()? onTap;
  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [

          SvgPicture.asset(iconPath, height: 80.h, width: 80.w,),
          ReuseableText(
              title: title,
              style: TextStyle(
                  fontSize: 24.h,
                  color: Tcolor.gray,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}

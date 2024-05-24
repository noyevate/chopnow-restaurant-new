import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PlaceholderAppBar extends StatelessWidget {
  const PlaceholderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      color: Tcolor.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35.r,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(
                  "assets/img/chef-svgrepo-com (1).svg",
                  width: 35.r * 2,
                  height: 35.r * 2,
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReuseableText(
                    title: "Welcome to Chop Now Restaurant App",
                    style: TextStyle(
                      color: Tcolor.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ReuseableText(
                    title: "Please click on the Restaurant icon to create your restaurant",
                    style: TextStyle(
                      color: Tcolor.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

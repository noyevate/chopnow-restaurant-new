// ignore_for_file: must_be_immutable

import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({super.key, required this.containerContent, this.color});

  Widget containerContent;

  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      //width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        // ignore: sized_box_for_whitespace
        child: Container(
          width: width,
          // color: color ?? Tcolor.white,
          child: SingleChildScrollView(
            child: containerContent,
          ),
        ),
        ),
    );
  }
} 
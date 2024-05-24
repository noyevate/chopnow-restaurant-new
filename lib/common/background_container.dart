import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key, required this.child,  this.color});

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.r),
        topRight: Radius.circular(40.r)
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? Tcolor.Lightwhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r)
          ),
          image: const DecorationImage(image: 
          AssetImage("assets/img/splash_bg.png"),
          fit: BoxFit.cover,
          opacity: .7,
          
      
          )
        ),
        child: child,
      ),
    );
  }
}
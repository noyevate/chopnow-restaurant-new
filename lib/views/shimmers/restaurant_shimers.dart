import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantShimmer extends StatelessWidget {
  const RestaurantShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h, // Specify the height here
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3, // Set the itemCount to 3
        itemBuilder: (context, index) {
          return Container(
            width: width,
            height: 500.h,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.white,
            child: Shimmer.fromColors(
              baseColor: Colors.white!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    color: Colors.white,
                  ),
                  // const SizedBox(height: 8),
                  // Container(
                  //   width: 100.h,
                  //   height: 150.h,
                  //   color: Colors.white,
                  // ),
                  // const SizedBox(height: 4),
                  // Container(
                  //   width: 100.h,
                  //   height: 150.h,
                  //   color: Colors.white,
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/models/food_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food});
  final FoodResponseModel food;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: Container(
        height: 152.h,
        decoration: BoxDecoration(
          color: Tcolor.placeHolder,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: SizedBox(
                    width: 124.w,
                    height: 124.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: Image.network(
                        food.imageUrl[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReuseableText(
                      title: food.title,
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: Tcolor.Text),
                    ),
                    ReuseableText(
                      title: "Delivery time: ${food.time}",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Tcolor.Text),
                    ),
                    SizedBox(
                      height: 36.h,
                      width: width * 0.7,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: food.additive.length,
                          itemBuilder: (context, i) {
                            var additives = food.additive[i];
                            return Container(
                              margin: EdgeInsets.only(right: 10.w),
                              decoration: BoxDecoration(
                                  color: Tcolor.purplr,
                                  borderRadius: BorderRadius.circular(18.r)),
                              child: Center(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: ReuseableText(
                                    title: additives.title,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Tcolor.Text),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                )
              ],
            ),
            Positioned(
              right: 10.w,
              top: 10.h,
              child: Container(
                height: 38.h,
                width: 150.w,
                decoration: BoxDecoration(
                    color: Tcolor.Secondary,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Center(
                  child: ReuseableText(
                    title: "\u20A6 ${food.price.toString()}",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Tcolor.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

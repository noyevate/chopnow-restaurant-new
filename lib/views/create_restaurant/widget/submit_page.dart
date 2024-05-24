
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/custom_button.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/restaurant_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RestaurantController());
    return SizedBox(
      height: height,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 32.w, top: 24.h, bottom: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseableText(
                  title: "Upload Images",
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Tcolor.gray,
                      fontWeight: FontWeight.w600),
                ),
                ReuseableText(
                  title:
                      "create Restaurant",
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Tcolor.gray,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Center(
            child: CustomButton(title: "C R E A T E    R E S T U R A N T", onTap: () {
              //RestaurantModel model = RestaurantModel(title: Resturant, time: time, imageUrl: imageUrl, code: code, logoUrl: logoUrl, coords: coords);
              //String data = restaurantModelToJson(model);
               //     controller.createRestaurant(data);
                  },)
          )
        ]
      ));
  }
}
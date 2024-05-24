
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/custom_button.dart';
import 'package:chopnow_restaurant_2/common/custom_textfield.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    super.key,
    required this.next,
    required this.title,
    required this.time,
    required this.phone, required this.owner,
  });

  final Function next;

  final TextEditingController title;
  final TextEditingController time;
  final TextEditingController owner;
  //final TextEditingController price;
  final TextEditingController phone;
  //final TextEditingController types;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
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
                  title: "Add Restaurant Details",
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Tcolor.gray,
                      fontWeight: FontWeight.w600),
                ),
                ReuseableText(
                  title:
                      "You're required to fill all neccesary infomation to proceed.",
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Tcolor.gray,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: title,
                  hintText: "Restaurant Name.",
                  prefixIcon: const Icon(Icons.keyboard_sharp),
                ),
                SizedBox(
                  height: 35.h,
                ),
                CustomTextField(
                  controller: time,
                  hintText: "9am - 7pm",
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  prefixIcon: const Icon(Icons.timelapse),
                ),
                SizedBox(
                  height: 35.h,
                ),
                CustomTextField(
                  controller: phone,
                  keyboardType: const TextInputType.numberWithOptions(),
                  hintText: "+234 80 7465 948",
                  prefixIcon: const Icon(Icons.phone),
                ),
                SizedBox(
                  height: 35.h,
                ),
                CustomTextField(
                  controller: owner,
                  hintText: "Manger's name",
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  prefixIcon: const Icon(Icons.timelapse),
                ),
                SizedBox(
                  height: 35.h,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                    title: "Next",
                    btnColor: Tcolor.Secondary,
                    onTap: () {
                      if (time.text.isEmpty &&
                          title.text.isEmpty &&
                          phone.text.isEmpty && owner.text.isEmpty) {
                        Get.snackbar("Complete all information", "You're required to fill all thre nformation before proceeding",
                            colorText: Tcolor.white,
                            duration: const Duration(seconds: 3),
                            backgroundColor: Tcolor.Secondary,
                            icon: const Icon(Icons.error_outline));
                      } else {
                         next();
                      }
                      
                    },
                    btnWidth: width / 2.3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

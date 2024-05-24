
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/custom_button.dart';
import 'package:chopnow_restaurant_2/common/custom_textfield.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodInfo extends StatelessWidget {
  const FoodInfo(
      {super.key,
      required this.back,
      required this.next,
      required this.title,
      required this.description,
      required this.price,
      required this.preparation,
      required this.types});
  final Function back;
  final Function next;

  final TextEditingController title;
  final TextEditingController description;
  final TextEditingController price;
  final TextEditingController preparation;
  final TextEditingController types;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 32.w, top: 24.h, bottom: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReuseableText(
                title: "Add Details",
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
                hintText: "Title.",
                prefixIcon: const Icon(Icons.keyboard_sharp),
              ),
              SizedBox(
                height: 35.h,
              ),
              CustomTextField(
                controller: description,
                hintText: "Add food description.",
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                prefixIcon: const Icon(Icons.keyboard_sharp),
              ),
              SizedBox(
                height: 35.h,
              ),
              CustomTextField(
                controller: preparation,
                hintText: "Food preparation time, e.g 10min..",
                prefixIcon: const Icon(Icons.keyboard_sharp),
              ),
              SizedBox(
                height: 35.h,
              ),
              CustomTextField(
                controller: price,
                hintText: "Price",
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.money_sharp),
              ),
              SizedBox(
                height: 35.h,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 32.w, top: 24.h, bottom: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReuseableText(
                title: "Add Food Tags",
                style: TextStyle(
                    fontSize: 24.sp,
                    color: Tcolor.gray,
                    fontWeight: FontWeight.w600),
              ),
              ReuseableText(
                title:
                    "Fill required info accurately; food tags help in search.",
                style: TextStyle(
                    fontSize: 24.sp,
                    color: Tcolor.gray,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Obx(
            () => Column(
              children: [
                CustomTextField(
                  controller: types,
                  hintText:
                      "Breakfast / Lunch / Dinner / Owanbe / Snacks / Beverage",
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(Icons.fastfood_sharp),
                ),
                SizedBox(
                  height: 25.h,
                ),
                controller.types.isNotEmpty
                    ? Row(
                        children: List.generate(controller.types.length, (i) {
                          return Container(
                            margin: EdgeInsets.only(right: 10.w),
                            decoration: BoxDecoration(
                              color: Tcolor.Secondary,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.w),
                                child: ReuseableText(
                                  title: controller.types[i],
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      color: Tcolor.white,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  title: "Add food Type",
                  onTap: () {
                    controller.setTypes = types.text;
                    types.text = "";
                  },
                  raduis: 12.r,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                title: "Back",
                btnColor: Tcolor.Secondary,
                onTap: () {
                  back();
                },
                btnWidth: width / 2.3,
              ),
              CustomButton(
                  title: "Next",
                  btnColor: Tcolor.Secondary,
                  onTap: () {
                    next();
                  },
                  btnWidth: width / 2.3),
            ],
          ),
        ),
        
      ],
      
    );
  }
}

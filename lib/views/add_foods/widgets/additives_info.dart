
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/custom_button.dart';
import 'package:chopnow_restaurant_2/common/custom_textfield.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/food_controller.dart';
import 'package:chopnow_restaurant_2/models/additive_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdditiveInfo extends StatelessWidget {
  const AdditiveInfo(
      {super.key, required this.additiveTitle, required this.additivePrice, required this.back, required this.onSubmit});

      final Function back;
  final Function onSubmit;
  

  final TextEditingController additiveTitle;
  final TextEditingController additivePrice;

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
                  title: "Add Additive Info",
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Tcolor.gray,
                      fontWeight: FontWeight.w600),
                ),
                ReuseableText(
                  title:
                      "You're required additive infomation of your food, if there are any",
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Tcolor.gray,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomTextField(
                    controller: additiveTitle,
                    hintText: "Additive title",
                    prefixIcon: const Icon(Icons.badge_rounded),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextField(
                    controller: additivePrice,
                    hintText: "Additive price",
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    prefixIcon: const Icon(Icons.badge_rounded),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Obx(
                    () => controller.additiveList.isNotEmpty
                        ? Column(
                            children: List.generate(
                                controller.additiveList.length, (i) {
                              final additive = controller.additiveList[i];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                                    decoration: BoxDecoration(
                                      color: Tcolor.additiveHolder,
                                      
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                                          child: ReuseableText(
                                            title: additive.title,
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                color: Tcolor.white,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                                          child: ReuseableText(
                                            title: "\u20A6 ${additive.price.toString()}",
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                color: Tcolor.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            }),
                          )
                        : const SizedBox.shrink(),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomButton(
                    title: "A D D     A D D I T I V E S",
                    btnColor: Tcolor.Secondary,
                    onTap: () {
                      if (additivePrice.text.isNotEmpty &&
                          additiveTitle.text.isNotEmpty) {
                        AdditiveModel additive = AdditiveModel(
                            id: controller.generateId(),
                            title: additiveTitle.text,
                            price: additivePrice.text);

                        controller.addAdditive = additive;
                        additivePrice.text = "";
                        additiveTitle.text = "";
                      } else {
                        Get.snackbar(
                            colorText: Tcolor.white,
                            backgroundColor: Tcolor.Secondary,
                            "Something went wrong",
                            "please fill all fields");
                      }
                    },
                    btnWidth: width,
                  ),

                  SizedBox(
                      height: 50.h,
                    ),

                  Row(
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
                            title: "Submit",
                            btnColor: Tcolor.Secondary,
                            onTap: () {
                              
                              onSubmit();
                              
                            },
                            btnWidth: width / 2.3),
                      ],
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

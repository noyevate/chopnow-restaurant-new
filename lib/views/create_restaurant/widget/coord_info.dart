import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/custom_button.dart';
import 'package:chopnow_restaurant_2/common/custom_textfield.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/location_controller.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CoordInfo extends StatelessWidget {
  const CoordInfo(
      {super.key,
      required this.coordLatitude,
      required this.coordLongitude,
      required this.address,
      required this.coordTitle,
      required this.back,
      required this.onSubmit, required this.onClosePageView});

  final TextEditingController coordTitle;
  final TextEditingController coordLatitude;
  final TextEditingController coordLongitude;
  final TextEditingController address;

  final Function back;
  final Function onSubmit;
  final Function onClosePageView;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocationController());
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
                  title: "Add Cordinate Information",
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Tcolor.gray,
                      fontWeight: FontWeight.w600),
                ),
                ReuseableText(
                  title: "Please Submit the required information",
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
                    controller: coordTitle,
                    hintText: "Restaurant name",
                    prefixIcon: const Icon(Icons.badge_rounded),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextField(
                    controller: coordLatitude,
                    hintText: "Latitude",
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    prefixIcon: const Icon(Icons.badge_rounded),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextField(
                    controller: coordLongitude,
                    hintText: "Longitude",
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    prefixIcon: const Icon(Icons.badge_rounded),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextField(
                    controller: address,
                    hintText: "Restaurant Address",
                    prefixIcon: const Icon(Icons.approval_rounded),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        title: "Back",
                        onTap: () {
                          back();
                        },
                        btnWidth: width / 2.3,
                        btnColor: Tcolor.Secondary,
                      ),
                      CustomButton(
                        title: "Submit",
                        btnColor: Tcolor.Secondary,
                        onTap: () {
                          onSubmit();
                          onClosePageView();
                        },
                        btnWidth: width / 2.3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/custom_button.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/uploader_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurantImage extends StatelessWidget {
  const RestaurantImage({super.key, required this.back, required this.next});
  final Function back;
  final Function next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploaderController());
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
                      "You're required to upload at least two images to proceed",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Image 1
                      GestureDetector(
                        onTap: () {
                          controller.pickImage("one");
                        },
                        child: Obx(
                          () => Container(
                            height: 240.h,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(color: Tcolor.secondaryText),
                            ),
                            child: controller.imageOneUrl == ''
                                ? Center(
                                    child: ReuseableText(
                                        title: "Upload Restaurant Image",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 32.sp,
                                            color: Tcolor.secondaryText,
                                            fontWeight: FontWeight.w600)),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: Image.network(
                                      controller.imageOneUrl,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                          ),
                        ),
                      ),

                      //image 2
                      GestureDetector(
                        onTap: () {
                          controller.pickImage("two");
                        },
                        child: Obx(
                          () => Container(
                            height: 240.h,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(color: Tcolor.secondaryText),
                            ),
                            child: controller.imageTwoUrl == ''
                                ? Center(
                                  
                                    child: ReuseableText(
                                        title: "Upload Restaurant Logo",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 32.sp,
                                            color: Tcolor.secondaryText,
                                            fontWeight: FontWeight.w600, ),
                                            ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: Image.network(
                                      controller.imageTwoUrl,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48.h,
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
                          title: "Next",
                          btnColor: Tcolor.Secondary,
                          onTap: () {
                            if (controller.images.length >= 2) {
                              next();
                            } else {
                              Get.snackbar("Upload the required images",
                                  "Please upload at least two images",
                                  colorText: Tcolor.white,
                                  backgroundColor: Tcolor.Secondary,
                                  snackPosition: SnackPosition.TOP);
                            }
                            next();
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

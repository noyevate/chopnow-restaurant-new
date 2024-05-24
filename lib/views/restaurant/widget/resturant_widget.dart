
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/custom_button.dart';
import 'package:chopnow_restaurant_2/common/dashboard_text.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/row_text_widget.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/models/restaurant_respons_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ResturantWidget extends StatelessWidget {
  ResturantWidget({
    super.key,
    required this.restaurant,
  });

  List<RestaurantResponsModel> restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      restaurant[0].title,
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: Tcolor.Text,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h, right: 10.w),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300.r),
                        child: Container(
                          color: Tcolor.white,
                          child: Padding(
                            padding: EdgeInsets.all(2.h),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: Image.network(
                                restaurant[0].logoUrl,
                                fit: BoxFit.cover,
                                width: 50.w,
                                height: 50.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 30.h,
          ),
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashbordTextWidget(
                    first: "0",
                    second: "Total Orders",
                  ),
                  DashbordTextWidget(
                    first: "0",
                    second: "Processed Orders",
                  ),
                  DashbordTextWidget(
                    first: "0",
                    second: "Cancelled Orders",
                  ),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 30.h,
          ),
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashbordTextWidget(
                    first: "0",
                    second: "Total Deliveries",
                  ),
                  DashbordTextWidget(
                    first: "0",
                    second: "Processed Orders",
                  ),
                  DashbordTextWidget(
                    first: "0",
                    second: "Cancelled Orders",
                  ),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 30.h,
          ),
          RowText(first: "RestaurantId", second: restaurant[0].id),
          SizedBox(
            height: 30.h,
          ),
          RowText(first: "Manager Id", second: restaurant[0].userId),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ReuseableText(
                title: "Restaurant Address                    ",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w500,
                  color: Tcolor.gray,
                ),
              ),
              Expanded(
                child: Text(
                   restaurant[0].coords.address,
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                    color: Tcolor.gray,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          RowText(first: "Restaurant Manager", second: restaurant[0].owner),
          SizedBox(
            height: 30.h,
          ),
          RowText(first: "Working hours", second: restaurant[0].time),
          const Divider(
            thickness: 1,
          ),
          CustomButton(
            title: "Edit Restaurant",
            btnHeight: 50.h,
            btnWidth: width,
            onTap: () {
              Get.snackbar(
                "Edit Restaurant",
                "message",
                backgroundColor: Tcolor.Secondary,
                colorText: Tcolor.white,
              );
            },
          ),
        ],
      ),
    );
  }
}

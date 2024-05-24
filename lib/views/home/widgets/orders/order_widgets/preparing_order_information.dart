
import 'package:chopnow_restaurant_2/common/background_container.dart';
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/custom_button.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/row_text_widget.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/order_controller.dart';
import 'package:chopnow_restaurant_2/models/food_byId_model.dart';
import 'package:chopnow_restaurant_2/models/order_request_model.dart';
import 'package:chopnow_restaurant_2/views/order/widget/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PreparingOrderInformation extends StatelessWidget {
  const PreparingOrderInformation(
      {super.key, required this.order, required this.singleFood});
  final OrderResponseModel order;
  final FoodByIdModel singleFood;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ReuseableText(
            title: order.id,
            style: TextStyle(
                color: Tcolor.gray,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold)),
      ),
      body: BackgroundContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(children: [
            SizedBox(height: 20.h),
            OrderDetailsTile(
              order: order,
            ),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              height: 750.h,
              decoration: BoxDecoration(
                color: Tcolor.placeHolder,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReuseableText(
                        title: singleFood.title,
                        style: TextStyle(
                            fontSize: 30.sp,
                            color: Tcolor.gray,
                            fontWeight: FontWeight.bold),
                      ),
                      CircleAvatar(
                        radius: 35.r,
                        backgroundColor: Tcolor.white,
                        backgroundImage: NetworkImage(singleFood.imageUrl[0]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  RowText(first: "Order Status", second: order.orderStatus),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const RowText(
                      first: "Distance from Restaurant", second: "3 km"),
                  SizedBox(
                    height: 15.h,
                  ),
                  const RowText(
                      first: "Estimated time to delivery", second: "30 mins"),
                  SizedBox(
                    height: 15.h,
                  ),
                  RowText(
                      first: "Quantity",
                      second: order.orderItems[0].quantity.toString()),
                  SizedBox(
                    height: 15.h,
                  ),
                  RowText(
                      first: "Recipient Address",
                      second: order.deliveryAddress,),
                  SizedBox(
                    height: 15.h,
                  ),
                  RowText(
                      first: "Order Grand Total",
                      second: "\u20A6 ${order.grandTotal + 1500}"),
                  const Divider(
                    thickness: 1,
                  ),
                  ReuseableText(
                    title: "Additives",
                    style: TextStyle(
                        fontSize: 40.sp,
                        color: Tcolor.gray,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: width,
                    height: 40.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: order.orderItems[0].additives.length,
                        itemBuilder: (context, i) {
                          var additives = order.orderItems[0].additives[i];
                          return Container(
                            margin: EdgeInsets.only(right: 10.w),
                            decoration: BoxDecoration(
                              color: Tcolor.placeHolder,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.r),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5.h),
                                child: ReuseableText(
                                  title: additives,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Tcolor.primary,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        title: "Food is Ready",
                        btnWidth: width / 2.5,
                        onTap: () {
                          controller.updateOrderStatus(
                              order.id, "Ready");
                        },
                      ),
                      CustomButton(
                        title: "Self Delivery",
                        btnWidth: width / 2.5,
                        btnColor: Tcolor.red,
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

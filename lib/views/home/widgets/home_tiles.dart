// ignore_for_file: file_names


import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/home_tile.dart';
import 'package:chopnow_restaurant_2/views/add_foods/add_foods.dart';
import 'package:chopnow_restaurant_2/views/food/food_list.dart';
import 'package:chopnow_restaurant_2/views/restaurant/restaurant_pagr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeTiles extends StatelessWidget {
  const HomeTiles({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 130.h,
      decoration: BoxDecoration(
          color: Tcolor.white, borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomeTile(
              onTap: () {
                Get.to(() => const AddFoods(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 900));
              },
              title: "Add Foods",
              iconPath: "assets/img/food-menu-3-svgrepo-com.svg"),
          HomeTile(
              onTap: () {},
              title: "Wallet",
              iconPath: "assets/img/wallet-wallet-svgrepo-com.svg"),
          HomeTile(
              onTap: () {
                Get.to(() => const FoodList(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 900));
              },
              title: "Foods",
              iconPath:
                  "assets/img/pizza-svgrepo-com.svg"),
          HomeTile(
              onTap: () {},
              title: "Deliveries",
              iconPath: "assets/img/delivery-transport-svgrepo-com.svg"),

              HomeTile(
              onTap: () {
                Get.to(() => const RestaurantPage(), transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 900));
              },
              title: "Restaurant",
              iconPath:"assets/img/restaurant-store-svgrepo-com.svg" ),
        ],
      ),
    );
  }
}

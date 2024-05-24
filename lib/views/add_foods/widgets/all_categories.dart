
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/common/uidata.dart';
import 'package:chopnow_restaurant_2/controlllers/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChooseCategory extends HookWidget {
  const ChooseCategory( {super.key, required this.next});
  final Function() next;

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
                    title: "Pick Category",
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: Tcolor.gray,
                        fontWeight: FontWeight.w600),
                  ),
                  ReuseableText(
                    title: "You're required to pick a category to be able to add a food item",
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
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, i) {
                final category = categories[i];
                return ListTile(
                  
                  onTap: () {
                    controller.setCategory = category['_id'];
                    next();
                  },
                  leading: CircleAvatar(
                    radius: 36.r,
                    backgroundColor: Tcolor.Secondary,
                    child: Image.asset(category["image"], fit: BoxFit.contain,),
                  ),
                  title: ReuseableText(
                    title: category["name"],
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: Tcolor.gray,
                        fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Tcolor.placeHolder,
                    size: 30.sp,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

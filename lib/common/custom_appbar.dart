import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/placeholder_appbar.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/controlllers/login_controller.dart';
import 'package:chopnow_restaurant_2/controlllers/restaurant_controller.dart';
import 'package:chopnow_restaurant_2/hooks/fetch_restaurant.dart';
import 'package:chopnow_restaurant_2/models/login_response_model.dart';
import 'package:chopnow_restaurant_2/models/restaurant_respons_model.dart';
import 'package:chopnow_restaurant_2/views/auth/login_page.dart';
import 'package:chopnow_restaurant_2/views/shimmers/food_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import 'package:flutter_hooks/flutter_hooks.dart';

class CustomAppBar extends HookWidget {
  const CustomAppBar( {super.key});

   

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    LoginResponseModel? user;
    final loginController = Get.put(LoginController());

    String? token = box.read('token');

    if (token != null) {
      user = loginController.getUserInfo();
    }

    if (token == null) {
      return const LoginPage();
    }

    final hookResult = useFetchRestaurant();
    List<RestaurantResponsModel>? restaurant = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;
    final controller = Get.put(RestaurantController());

    return Container(
      width: double.infinity,
      height: 200.h,
      padding: EdgeInsets.fromLTRB(24.w, 70.h, 24.w, 0),
      color: Tcolor.primary,
      child: isLoading
          ? const FoodListShimmer(): 
          restaurant.isNotEmpty ?
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35.r,
                      backgroundColor: Tcolor.placeHolder,
                      // Uncomment the line below if you have a valid image URL
                       backgroundImage: NetworkImage(restaurant[0].logoUrl),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReuseableText(
                          title: restaurant[0].title,
                          style: TextStyle(
                            color: Tcolor.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ReuseableText(
                          title: restaurant[0].coords.address,
                          style: TextStyle(
                            color: Tcolor.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async{
                    var restaurantId = restaurant[0].id;
                    print(restaurantId);
                    await controller.toggleAvailability(restaurantId);
                    final newAvailability = !restaurant[0].isAvailabe;
                    if (hookResult.updateIsAvailable != null) {
                      await hookResult.updateIsAvailable!(restaurantId, newAvailability);
                    }

                    // This should ideally be done using setState or similar to update the UI
                    if (restaurant[0].isAvailabe) {
                      Image.asset(
                          "assets/img/icons8-open-64.png",
                          width: 120.w,
                          height: 120.h,
                        );
                    } else {
                      Image.asset(
                          "assets/img/icons8-closed-48.png",
                          width: 120.w,
                          height: 120.h,
                        );
                    }
                    
                  },
                  child: restaurant[0].isAvailabe
                      ? Image.asset(
                          "assets/img/icons8-open-64.png",
                          width: 120.w,
                          height: 120.h,
                        )
                      : Image.asset(
                          "assets/img/icons8-closed-48.png",
                          width: 120.w,
                          height: 120.h,
                        )
                ),
              ],
          ) : const PlaceholderAppBar(),
    );
  }
}

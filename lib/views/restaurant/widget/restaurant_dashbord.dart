
import 'package:chopnow_restaurant_2/common/background_container.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/login_controller.dart';
import 'package:chopnow_restaurant_2/hooks/fetch_restaurant.dart';
import 'package:chopnow_restaurant_2/models/login_response_model.dart';
import 'package:chopnow_restaurant_2/models/restaurant_respons_model.dart';
import 'package:chopnow_restaurant_2/views/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'resturant_widget.dart';

class RestaurantDashbord extends HookWidget {
  const RestaurantDashbord({super.key});

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
    // if (user != null && user.verification == false) {
    //   //return const VerificationPage();
    // }

    final hookResult = useFetchRestaurant();
    List<RestaurantResponsModel>? restaurant = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;

    return Scaffold(
      body: BackgroundContainer(
        child: isLoading
            ? Center(child: const CircularProgressIndicator.adaptive())
            : restaurant != null
                ? Container(
                    width: width,
                    height: height,
                    child: ListView.builder(
                      itemCount: restaurant.length,
                      itemBuilder: (context, i) {
                        return SizedBox(
                          height: height,
                          width: width,
                          child: ResturantWidget(restaurant: restaurant),
                        );
                      },
                    ),
                  )
                : const Center(
                    child:
                        CircularProgressIndicator(), // Show a loading indicator
                  ),
      ),
    );
  }
}

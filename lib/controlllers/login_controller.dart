// ignore_for_file: prefer_final_fields

import 'dart:convert';


import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/models/api_error_model.dart';
import 'package:chopnow_restaurant_2/models/login_response_model.dart';
import 'package:chopnow_restaurant_2/views/auth/login_page.dart';
import 'package:chopnow_restaurant_2/views/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  void loginFunction(String data) async {
    setLoading = true;

    Uri url = Uri.parse("$appBaseUrl/login");

    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        LoginResponseModel data = loginResponseModelFromJson(response.body);

        String userId = data.id;
        String userData = jsonEncode(data);

        box.write(userId, userData);
        box.write('token', data.userToken);
        box.write('userId', data.id);
        box.write('verification', data.verification);

        setLoading = false;
        if (data.userType == "Vendor") {
          Get.snackbar("You are successfully logged in",
              "Bon appétit! you're welcome again.",
              colorText: Tcolor.Text,
              duration: const Duration(seconds: 3),
              backgroundColor: Tcolor.primary,
              icon: const Icon(Ionicons.fast_food_outline));
          
          Get.offAll(() => const HomePage(),
              transition: Transition.fade,
              duration: const Duration(milliseconds: 900));
        } else {
          Get.snackbar("Failed to Login", "Somethin went wrong!",
              colorText: Tcolor.white,
              duration: const Duration(seconds: 3),
              backgroundColor: Tcolor.red,
              icon: const Icon(Icons.error_outline));
        }
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Failed to Login", error.message,
            colorText: Tcolor.white,
            duration: const Duration(seconds: 3),
            backgroundColor: Tcolor.red,
            icon: const Icon(Icons.error_outline));
      }

      // if (data.verification == false) {
      //   Get.offAll(() => const VerificationPage(),
      //   transition: Transition.fade,
      //   duration: const Duration(milliseconds: 900));
      // }
      // if (data.userType) {

      // }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

   Future<void> toggleAvailability(String restaurantId, bool isAvailable) async {
    String accessToken = box.read("token");
    var url = Uri.parse('$appBaseUrl/api/restaurant/toggle-availability/$restaurantId');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    var body = jsonEncode({'isAvailable': isAvailable});

    try {
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
      } else {
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> logout() async {
    // Assuming you have restaurant ID stored locally
    String? restaurantId = box.read("restaurantId");

    if (restaurantId != null) {
      await toggleAvailability(restaurantId, false);
    }

    box.erase();
    Get.offAll(
      () => const LoginPage(),
      transition: Transition.fade,
      duration: const Duration(milliseconds: 900),
    );
  }

  LoginResponseModel? getUserInfo() {
    String? userId = box.read('userId');
    String? data;
    if (userId != null) {
      data = box.read(userId.toString());
    }

    if (data != null) {
      return loginResponseModelFromJson(data);
    }
    return null;
  }
}

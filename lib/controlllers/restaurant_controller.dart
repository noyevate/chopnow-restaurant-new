// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/models/api_error_model.dart';
import 'package:chopnow_restaurant_2/views/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void createRestaurant(String data) async {
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse("$appBaseUrl/api/restaurant/");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.post(url, headers: headers, body: data);

      if (response.statusCode == 201) {
        setLoading = false;
        Get.snackbar("Restaurant created Successfully",
            "We look forward to taking more orders from you",
            colorText: Tcolor.Text,
            duration: const Duration(seconds: 2),
            backgroundColor: Tcolor.primary,
            icon: const Icon(Ionicons.fast_food_outline));

        Get.offAll(() => const HomePage(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 900));
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Creating restaurant Unsuccessful", error.message,
            colorText: Tcolor.white,
            duration: const Duration(seconds: 10),
            backgroundColor: Tcolor.red,
            icon: const Icon(Icons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }

  Future<void> toggleAvailability(
    String restaurantId,
  ) async {
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse(
        '$appBaseUrl/api/restaurant/toggle-availability/$restaurantId');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    }; // Adjust the URL as needed

    try {
      var response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {
        print('Successfully toggled availability');
        final data = jsonDecode(response.body);
        print('New isAvailable status: ${data['isAvailabe']}');
      } else {
        print('Failed to toggle availability: ${response.reasonPhrase}');
        Get.snackbar(
          "Error",
          "Network error",
          colorText: Tcolor.Text,
          duration: const Duration(seconds: 3),
          backgroundColor: Tcolor.red,
          icon: const Icon(Ionicons.fast_food_outline),
        );
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  // Future<String> fetchRestaurantId(String title) async {
  //   setLoading = true;
  //   String accessToken = box.read("token");

  //   Uri url = Uri.parse("$appBaseUrl/api/restaurant/byUserId/:userId");

  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $accessToken'
  //   };

  //   try {
  //     var response = await http.get(url, headers: headers);
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       RestaurantResponsModel data =
  //           restaurantResponsModelFromJson(response.body);
  //       setLoading = false;

  //       return data.id; // Return the fetched ID
  //     } else {
  //       var error = apiErrorFromJson(response.body);
  //       Get.snackbar("Can't return data", error.message,
  //           colorText: Tcolor.white,
  //           duration: const Duration(seconds: 5),
  //           backgroundColor: Tcolor.red,
  //           icon: const Icon(Icons.error_outline));
  //       print(error.message.toString());
  //       return ''; // Return an empty string or handle error case
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return ''; // Return an empty string or handle error case
  //   }
  // }
}

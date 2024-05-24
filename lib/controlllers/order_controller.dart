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

class OrderController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  TabController? tabController;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  void setTabController(TabController controller) {
    tabController = controller;
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse('$appBaseUrl/api/orders/updateOrderStatus/$orderId');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode({'status': status}),
      );
      if (response.statusCode == 201) {
        setLoading = false;
        // Get.snackbar(
        //   "Order Status Changed",
        //   "Bon appétit! You're welcome again.",
        //   colorText: Tcolor.Text,
        //   duration: const Duration(seconds: 3),
        //   backgroundColor: Tcolor.primary,
        //   icon: const Icon(Ionicons.fast_food_outline),
        // );
        if (status == "Preparing") {
          Get.offAll(() => const HomePage(initialTabIndex: 1)); // Pass initial tab index
        } else if(status == "Ready") {
            Get.offAll(() => const HomePage(initialTabIndex: 2)); // Pass initial tab index
        } else if(status == "Out_For_Delivery") {
            Get.offAll(() => const HomePage(initialTabIndex: 3)); // Pass initial tab index
        } else if(status == "Cancelled") {
            Get.offAll(() => const HomePage(initialTabIndex: 0)); // Pass initial tab index
        }
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar(
          "Order status not changed!!",
          error.message,
          colorText: Tcolor.Text,
          duration: const Duration(seconds: 3),
          backgroundColor: Tcolor.red,
          icon: const Icon(Ionicons.fast_food_outline),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        "Error",
        "An unexpected error occurred.",
        colorText: Tcolor.Text,
        duration: const Duration(seconds: 3),
        backgroundColor: Tcolor.red,
        icon: const Icon(Ionicons.fast_food_outline),
      );
    } finally {
      setLoading = false;
    }
  }
}

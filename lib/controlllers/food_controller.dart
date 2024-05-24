// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_final_fields

import 'dart:math';


import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/models/additive_model.dart';
import 'package:chopnow_restaurant_2/models/api_error_model.dart';
import 'package:chopnow_restaurant_2/views/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class FoodController extends GetxController {

  final box = GetStorage();
  
  RxBool _isLoading = false.obs;

  bool get isLoading =>_isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  
  String _category = "";
  String get category => _category;

  set setCategory(String newValue) {
    _category = newValue;
  }

  RxList<String> _types = <String>[].obs;
  RxList<String> get types => _types;

  set setTypes(String newVale) {
    _types.add(newVale);
  }


  int generateId () {
    int min = 0;
    int max = 1000000;

    // ignore: unused_local_variable
    final _random = Random();
    return min + Random().nextInt(max - min);
  }

  RxList<AdditiveModel> _additiveList = <AdditiveModel>[].obs;
  RxList<AdditiveModel> get additiveList => _additiveList;

  set addAdditive(AdditiveModel newValue) {
    _additiveList.add(newValue);
  }

  void clearAdditives() {
    _additiveList.clear();
  }


  Future<bool> addFood(String data) async{
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse("$appBaseUrl/api/foods");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.post(url, headers: headers, body: data);
     
      if (response.statusCode == 201) {
        setLoading = false;
        Get.snackbar("Food Created Successfully",
            "Bon appétit! Get ready to savor tasty treats with us.",
            colorText: Tcolor.Text,
            duration: const Duration(seconds: 2),
            backgroundColor: Tcolor.primary,
            icon: const Icon(Ionicons.fast_food_outline));

            Get.offAll(() => const HomePage(),
          transition: Transition.fade,
          duration: const Duration(milliseconds: 900));

        return true;
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Process Unsuccessful", error.message,
            colorText: Tcolor.white,
            duration: const Duration(seconds: 2),
            
            backgroundColor: Tcolor.red,
            icon: const Icon(Icons.error_outline));
            return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      setLoading = false;
    }
  }


  Future<bool> getFood(String foodId) async{
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse("$appBaseUrl/api/foods/$foodId");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.get(url, headers: headers,);
      
      if (response.statusCode == 200) {
        

        return true;
      } else {
        var error = apiErrorFromJson(response.body);
        debugPrint(error.toString());
        
            return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      setLoading = false;
    }
  }






}
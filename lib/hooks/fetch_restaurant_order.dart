
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/models/api_error_model.dart';
import 'package:chopnow_restaurant_2/models/hook%20models/hook_result.dart';
import 'package:chopnow_restaurant_2/models/order_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchOrderByOrderPlaced(String restaurantId, String paymentStatus, String orderStatus) {
  final box = GetStorage();
  final restaurants = useState<List<OrderResponseModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    String accessToken = box.read("token");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    isLoading.value = true;

    try {
      final url = Uri.parse("$appBaseUrl/api/orders/$restaurantId?orderStatus=$orderStatus&paymentStatus=$paymentStatus");
      print(url.toString());
      final response = await http.get(url, headers: headers);
      print("useFetchOrderByOrder: ${response.body}");
      if(response.statusCode == 200){
        restaurants.value = orderResponseModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
      
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: restaurants.value, 
    isLoading: isLoading.value, 
    error: error.value, 
    refetch: refetch,
  );
}

import 'package:chopnow_restaurant_2/models/restaurant_respons_model.dart';
import 'package:flutter/material.dart';

class FetchRestaurant {
  final List<RestaurantResponsModel>? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;
  final Future<void> Function(String restaurantId, bool newValue)? updateIsAvailable;

  FetchRestaurant({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
    required this.updateIsAvailable,
  });
}

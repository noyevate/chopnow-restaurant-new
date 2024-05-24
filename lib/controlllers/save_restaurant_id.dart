import 'package:get_storage/get_storage.dart';

class StorageService {
  static final GetStorage _box = GetStorage();

  static Future<void> saveRestaurantId(String restaurantId) async {
    await _box.write('restaurantId', restaurantId);
  }

  static String? getRestaurantId() {
    return _box.read('restaurantId');
  }
}
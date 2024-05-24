import 'dart:math';
import 'package:chopnow_restaurant_2/models/coords_model.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  

String coordGenerateId() {
  int min = 0;
  int max = 1000000;

  final _random = Random();
  int randomId = min + _random.nextInt(max - min);

  return randomId.toString();
}




  RxList<CoordsModel> _coordsList = <CoordsModel>[].obs;
  RxList<CoordsModel> get coordsList => _coordsList;

  set addCoords(CoordsModel newValue) {
    _coordsList.add(newValue);
  }

  void clearAdditives() {
    _coordsList.clear();
  }


}
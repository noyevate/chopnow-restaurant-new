
import 'dart:convert';

CoordsModel coordsModelFromJson(String str) => CoordsModel.fromJson(json.decode(str));

String coordsModelToJson(CoordsModel data) => json.encode(data.toJson());

class CoordsModel {
    final String id;
    final double latitude;
    final double longitude;
    final String address;
    final String title;

    CoordsModel({
        required this.id,
        required this.latitude,
        required this.longitude,
        required this.address,
        required this.title,
    });

    factory CoordsModel.fromJson(Map<String, dynamic> json) => CoordsModel(
        id: json["id"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "title": title,
    };
}

import 'dart:convert';

List<RestaurantResponsModel> restaurantResponsModelFromJson(String str) => List<RestaurantResponsModel>.from(json.decode(str).map((x) => RestaurantResponsModel.fromJson(x)));

String restaurantResponsModelToJson(List<RestaurantResponsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantResponsModel {
    final Coords coords;
    final String id;
    final String title;
    final String time;
    final String imageUrl;
    final List<dynamic> foods;
    final bool pickup;
    final bool delivery;
    bool isAvailabe;
    final String owner;
    final String code;
    final String logoUrl;
    final String userId;
    final int rating;
    final String ratingCount;
    final String verification;
    final String verificationMessage;
    final DateTime createdAt;
    final DateTime updatedAt;

    RestaurantResponsModel({
        required this.coords,
        required this.id,
        required this.title,
        required this.time,
        required this.imageUrl,
        required this.foods,
        required this.pickup,
        required this.delivery,
        required this.isAvailabe,
        required this.owner,
        required this.code,
        required this.logoUrl,
        required this.userId,
        required this.rating,
        required this.ratingCount,
        required this.verification,
        required this.verificationMessage,
        required this.createdAt,
        required this.updatedAt,
    });

    factory RestaurantResponsModel.fromJson(Map<String, dynamic> json) => RestaurantResponsModel(
        coords: Coords.fromJson(json["coords"]),
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        foods: List<dynamic>.from(json["foods"].map((x) => x)),
        pickup: json["pickup"],
        delivery: json["delivery"],
        isAvailabe: json["isAvailabe"],
        owner: json["owner"],
        code: json["code"],
        logoUrl: json["logoUrl"],
        userId: json["userId"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        verification: json["verification"],
        verificationMessage: json["verificationMessage"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "coords": coords.toJson(),
        "_id": id,
        "title": title,
        "time": time,
        "imageUrl": imageUrl,
        "foods": List<dynamic>.from(foods.map((x) => x)),
        "pickup": pickup,
        "delivery": delivery,
        "isAvailabe": isAvailabe,
        "owner": owner,
        "code": code,
        "logoUrl": logoUrl,
        "userId": userId,
        "rating": rating,
        "ratingCount": ratingCount,
        "verification": verification,
        "verificationMessage": verificationMessage,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };

    // Add this copyWith method
    RestaurantResponsModel copyWith({
        Coords? coords,
        String? id,
        String? title,
        String? time,
        String? imageUrl,
        List<dynamic>? foods,
        bool? pickup,
        bool? delivery,
        bool? isAvailabe,
        String? owner,
        String? code,
        String? logoUrl,
        String? userId,
        int? rating,
        String? ratingCount,
        String? verification,
        String? verificationMessage,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) {
        return RestaurantResponsModel(
            coords: coords ?? this.coords,
            id: id ?? this.id,
            title: title ?? this.title,
            time: time ?? this.time,
            imageUrl: imageUrl ?? this.imageUrl,
            foods: foods ?? this.foods,
            pickup: pickup ?? this.pickup,
            delivery: delivery ?? this.delivery,
            isAvailabe: isAvailabe ?? this.isAvailabe,
            owner: owner ?? this.owner,
            code: code ?? this.code,
            logoUrl: logoUrl ?? this.logoUrl,
            userId: userId ?? this.userId,
            rating: rating ?? this.rating,
            ratingCount: ratingCount ?? this.ratingCount,
            verification: verification ?? this.verification,
            verificationMessage: verificationMessage ?? this.verificationMessage,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );
    }
}

class Coords {
    final String id;
    final double latitude;
    final double longitude;
    final String address;
    final String title;
    final double latitudeDelta;
    final double longitudeDelta;

    Coords({
        required this.id,
        required this.latitude,
        required this.longitude,
        required this.address,
        required this.title,
        required this.latitudeDelta,
        required this.longitudeDelta,
    });

    factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        id: json["id"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
        title: json["title"],
        latitudeDelta: json["latitudeDelta"]?.toDouble(),
        longitudeDelta: json["longitudeDelta"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "title": title,
        "latitudeDelta": latitudeDelta,
        "longitudeDelta": longitudeDelta,
    };
}

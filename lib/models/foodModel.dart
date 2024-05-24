// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
    final String title;
    final List<String> foodTags;
    final List<String> foodType;
    final String category;
    final String code;
    final String restaurant;
    final String description;
    final String time;
    final String price;
    final List<Additive> additive;
    final List<String> imageUrl;

    FoodModel({
        required this.title,
        required this.foodTags,
        required this.foodType,
        required this.category,
        required this.code,
        required this.restaurant,
        required this.description,
        required this.time,
        required this.price,
        required this.additive,
        required this.imageUrl,
    });

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        title: json["title"],
        foodTags: List<String>.from(json["foodTags"].map((x) => x)),
        foodType: List<String>.from(json["foodType"].map((x) => x)),
        category: json["category"],
        code: json["code"],
        restaurant: json["restaurant"],
        description: json["description"],
        time: json["time"],
        price: json["price"],
        additive: List<Additive>.from(json["additives"].map((x) => Additive.fromJson(x))),
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "foodTags": List<dynamic>.from(foodTags.map((x) => x)),
        "foodType": List<dynamic>.from(foodType.map((x) => x)),
        "category": category,
        "code": code,
        "restaurant": restaurant,
        "description": description,
        "time": time,
        "price": price,
        "additive": List<dynamic>.from(additive.map((x) => x.toJson())),
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
    };
}

class Additive {
    final int id;
    final String title;
    final String price;

    Additive({
        required this.id,
        required this.title,
        required this.price,
    });

    factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        id: json["id"],
        title: json["title"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
    };
}

// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel {
    final String username;
    final String email;
    final String password;
    final String userType;

    RegistrationModel({
        required this.username,
        required this.email,
        required this.password,
        required this.userType,
    });

    factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        userType: json["userype"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "userType": userType
    };
}

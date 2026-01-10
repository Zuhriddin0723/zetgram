// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RegisterModel welcomeFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String welcomeToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  int id;
  String name;
  String email;
  String password;

  RegisterModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
  };
}

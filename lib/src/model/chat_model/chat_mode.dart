// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ChatModel welcomeFromJson(String str) => ChatModel.fromJson(json.decode(str));

String welcomeToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  int? id;      // optional, AUTOINCREMENT DB boshqaradi
  String text;

  ChatModel({
    this.id,    // optional
    required this.text,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    id: json["id"],   // o‘qishda kerak
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,      // INSERT paytida id YO‘Q
  };
}


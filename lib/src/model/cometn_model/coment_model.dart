// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CommentModel welcomeFromJson(String str) => CommentModel.fromJson(json.decode(str));

String welcomeToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  int? id;
  int postId;
  String text;

  CommentModel({
    this.id,
    required this.postId,
    required this.text
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    id: json["id"],
    text: json["text"],
    postId: json["postId"]
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "postId" : postId
  };
}

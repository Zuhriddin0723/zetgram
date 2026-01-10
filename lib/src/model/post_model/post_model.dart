// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

PostModel welcomeFromJson(String str) => PostModel.fromJson(json.decode(str));

String welcomeToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  int? id;
  String text;
  String image;
  int time;
  int like;
  int comment;

  PostModel({
    this.id,
    required this.text,
    required this.image,
    required this.time,
    this.like = 0,
    this.comment = 0,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json['id'],
    text: json['text'],
    image: json['image'],
    time: json['time'],
    like: json['like'],
    comment: json['comment'],
  );

  Map<String, dynamic> toJson() => {
    'text': text,
    'image': image,
    'time': time,
    'like': like,
    'comment': comment,
  };
}



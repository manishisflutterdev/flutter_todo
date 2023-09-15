// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  String id;
  String userId;
  String todo;
  DateTime date;
  int v;

  TodoModel({
    required this.id,
    required this.userId,
    required this.todo,
    required this.date,
    required this.v,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["_id"],
        userId: json["userId"],
        todo: json["todo"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "todo": todo,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "__v": v,
      };
}

// To parse this JSON data, do
//
//     final labNotification = labNotificationFromJson(jsonString);

import 'dart:convert';

LabNotification labNotificationFromJson(String str) => LabNotification.fromJson(json.decode(str));

String labNotificationToJson(LabNotification data) => json.encode(data.toJson());

class LabNotification {
  int? status;
  bool? success;
  List<Datum>? data;

  LabNotification({
    required this.status,
    required this.success,
    required this.data,
  });

  factory LabNotification.fromJson(Map<String, dynamic> json) => LabNotification(
    status: json["status"]??0,
    success: json["success"]??false,
    data: json["data"] == null ? [] :List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data==null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? title;
  String? description;
  String? createdAt;

  Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"]?? "",
    title: json["title"]?? "",
    description: json["description"]??"",
    createdAt : json['createdAt']?? "",


  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "createdAt": createdAt.toString(),
  };
}

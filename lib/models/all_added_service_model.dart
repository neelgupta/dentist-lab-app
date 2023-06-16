// To parse this JSON data, do
//
//     final allAddedServicesModel = allAddedServicesModelFromJson(jsonString);

import 'dart:convert';

AllAddedServicesModel allAddedServicesModelFromJson(String str) => AllAddedServicesModel.fromJson(json.decode(str));

String allAddedServicesModelToJson(AllAddedServicesModel data) => json.encode(data.toJson());

class AllAddedServicesModel {
  String id;
  String title;
  int price;

  AllAddedServicesModel({
    required this.id,
    required this.title,
    required this.price,
  });

  factory AllAddedServicesModel.fromJson(Map<String, dynamic> json) => AllAddedServicesModel(
    id: json["_id"],
    title: json["title"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "price": price,
  };
}

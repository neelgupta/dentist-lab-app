// To parse this JSON data, do
//
//     final addClinicDetailsModel = addClinicDetailsModelFromJson(jsonString);

import 'dart:convert';

AddClinicDetailsModel addClinicDetailsModelFromJson(String str) => AddClinicDetailsModel.fromJson(json.decode(str));

String addClinicDetailsModelToJson(AddClinicDetailsModel data) => json.encode(data.toJson());

class AddClinicDetailsModel {
  int status;
  bool success;
  String message;

  AddClinicDetailsModel({
    required this.status,
    required this.success,
    required this.message,
  });

  factory AddClinicDetailsModel.fromJson(Map<String, dynamic> json) => AddClinicDetailsModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
  };
}

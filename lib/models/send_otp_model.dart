// To parse this JSON data, do
//
//     final sendOtpModel = sendOtpModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModel sendOtpModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

String sendOtpModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
  int status;
  bool success;
  String otp;
  String message;
  String id;

  ForgotPasswordModel({
    required this.status,
    required this.success,
    required this.otp,
    required this.message,
    required this.id,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
    status: json["status"],
    success: json["success"],
    otp: json["otp"],
    message: json["message"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "otp": otp,
    "message": message,
    "_id": id,
  };
}

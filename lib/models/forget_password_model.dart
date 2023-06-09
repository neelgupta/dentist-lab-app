// To parse this JSON data, do
//
//     final forgotPasswordModel = forgotPasswordModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
  int status;
  bool success;
  String userId;
  String otp;
  String message;

  ForgotPasswordModel({
    required this.status,
    required this.success,
    required this.userId,
    required this.otp,
    required this.message,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
    status: json["status"],
    success: json["success"],
    userId: json["UserId"],
    otp: json["OTP"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "UserId": userId,
    "OTP": otp,
    "message": message,
  };
}

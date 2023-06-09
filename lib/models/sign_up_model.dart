// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  int status;
  bool success;
  String message;
  String userId;
  String otp;

  SignUpModel({
    required this.status,
    required this.success,
    required this.message,
    required this.userId,
    required this.otp,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    userId: json["UserId"],
    otp: json["OTP"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "UserId": userId,
    "OTP": otp,
  };
}

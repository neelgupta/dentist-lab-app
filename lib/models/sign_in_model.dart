// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  int status;
  bool success;
  String userId;
  String type;
  String screenStatus;
  String token;
  String message;

  SignInModel({
    required this.status,
    required this.success,
    required this.userId,
    required this.type,
    required this.screenStatus,
    required this.token,
    required this.message,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    status: json["status"],
    success: json["success"],
    userId: json["UserId"],
    type: json["type"],
    screenStatus: json["screenStatus"].toString(),
    token: json["token"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "UserId": userId,
    "type": type,
    "screenStatus": screenStatus,
    "token": token,
    "message": message,
  };
}

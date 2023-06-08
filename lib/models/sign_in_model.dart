// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  int status;
  bool success;
  String type;
  int screenStatus;
  String token;
  String message;

  SignInModel({
    required this.status,
    required this.success,
    required this.type,
    required this.screenStatus,
    required this.token,
    required this.message,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    status: json["status"],
    success: json["success"],
    type: json["type"],
    screenStatus: json["screenStatus"],
    token: json["token"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "type": type,
    "screenStatus": screenStatus,
    "token": token,
    "message": message,
  };
}

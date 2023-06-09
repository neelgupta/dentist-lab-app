// To parse this JSON data, do
//
//     final manageProfile3Model = manageProfile3ModelFromJson(jsonString);

import 'dart:convert';

ManageProfile3Model manageProfile3ModelFromJson(String str) => ManageProfile3Model.fromJson(json.decode(str));

String manageProfile3ModelToJson(ManageProfile3Model data) => json.encode(data.toJson());

class ManageProfile3Model {
  bool success;
  int status;
  String message;

  ManageProfile3Model({
    required this.success,
    required this.status,
    required this.message,
  });

  factory ManageProfile3Model.fromJson(Map<String, dynamic> json) => ManageProfile3Model(
    success: json["success"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status,
    "message": message,
  };
}

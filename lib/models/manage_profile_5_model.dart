// To parse this JSON data, do
//
//     final manageProfile5Model = manageProfile5ModelFromJson(jsonString);

import 'dart:convert';

ManageProfile5Model manageProfile5ModelFromJson(String str) => ManageProfile5Model.fromJson(json.decode(str));

String manageProfile5ModelToJson(ManageProfile5Model data) => json.encode(data.toJson());

class ManageProfile5Model {
  bool success;
  int status;
  String message;

  ManageProfile5Model({
    required this.success,
    required this.status,
    required this.message,
  });

  factory ManageProfile5Model.fromJson(Map<String, dynamic> json) => ManageProfile5Model(
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

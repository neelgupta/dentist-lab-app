// To parse this JSON data, do
//
//     final manageProfile6Model = manageProfile6ModelFromJson(jsonString);

import 'dart:convert';

ManageProfile6Model manageProfile6ModelFromJson(String str) => ManageProfile6Model.fromJson(json.decode(str));

String manageProfile6ModelToJson(ManageProfile6Model data) => json.encode(data.toJson());

class ManageProfile6Model {
  bool success;
  int status;
  String message;

  ManageProfile6Model({
    required this.success,
    required this.status,
    required this.message,
  });

  factory ManageProfile6Model.fromJson(Map<String, dynamic> json) => ManageProfile6Model(
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

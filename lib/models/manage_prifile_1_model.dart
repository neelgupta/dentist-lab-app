// To parse this JSON data, do
//
//     final manageProfile1Model = manageProfile1ModelFromJson(jsonString);

import 'dart:convert';

ManageProfile1Model manageProfile1ModelFromJson(String str) => ManageProfile1Model.fromJson(json.decode(str));

String manageProfile1ModelToJson(ManageProfile1Model data) => json.encode(data.toJson());

class ManageProfile1Model {
  int status;
  bool success;
  String message;

  ManageProfile1Model({
    required this.status,
    required this.success,
    required this.message,
  });

  factory ManageProfile1Model.fromJson(Map<String, dynamic> json) => ManageProfile1Model(
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

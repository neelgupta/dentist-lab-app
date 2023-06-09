// To parse this JSON data, do
//
//     final manageProfile2Model = manageProfile2ModelFromJson(jsonString);

import 'dart:convert';

ManageProfile2Model manageProfile2ModelFromJson(String str) => ManageProfile2Model.fromJson(json.decode(str));

String manageProfile2ModelToJson(ManageProfile2Model data) => json.encode(data.toJson());

class ManageProfile2Model {
  bool success;
  int status;
  String message;

  ManageProfile2Model({
    required this.success,
    required this.status,
    required this.message,
  });

  factory ManageProfile2Model.fromJson(Map<String, dynamic> json) => ManageProfile2Model(
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

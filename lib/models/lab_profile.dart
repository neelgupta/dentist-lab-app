// To parse this JSON data, do
//
//     final labProfileModel = labProfileModelFromJson(jsonString);

import 'dart:convert';

LabProfileModel labProfileModelFromJson(String str) => LabProfileModel.fromJson(json.decode(str));

String labProfileModelToJson(LabProfileModel data) => json.encode(data.toJson());

class LabProfileModel {
  int? status;
  bool? success;
  List<LabDatum>? labData;

  LabProfileModel({
    required this.status,
    required this.success,
    required this.labData,
  });

  factory LabProfileModel.fromJson(Map<String, dynamic> json) => LabProfileModel(
    status: json["status"] ?? 0,
    success: json["success"] ?? false,
    labData: json["labData"] == null ? [] : List<LabDatum>.from(json["labData"]!.map((x) => LabDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "labData": labData == null ? [] : List<dynamic>.from(labData!.map((x) => x.toJson())),
  };
}

class LabDatum {
  String? id;
  int? screenStatus;
  String? labName;
  int? landLineNumber;
  int? mobileNumber;
  String? description;
  String? deliveryMethod;
  String? paymentMethod;
  List<UserDetail>? userDetails;
  List<WorkingHour>? workingHours;
  List<LabService>? labServices;

  LabDatum({
    required this.id,
    required this.screenStatus,
    required this.labName,
    required this.landLineNumber,
    required this.mobileNumber,
    required this.description,
    required this.deliveryMethod,
    required this.paymentMethod,
    required this.userDetails,
    required this.workingHours,
    required this.labServices,
  });

  factory LabDatum.fromJson(Map<String, dynamic> json) => LabDatum(
    id: json["_id"] ?? "",
    screenStatus: json["screenStatus"] ?? 0,
    labName: json["labName"] ?? "",
    landLineNumber: json["landLineNumber"] ?? 0,
    mobileNumber: json["mobileNumber"] ?? 0,
    description: json["description"] ?? " ",
    deliveryMethod: json["deliveryMethod"] ?? " ",
    paymentMethod: json["paymentMethod"] ?? " ",
    userDetails: json["userDetails"] == null ? [] : List<UserDetail>.from(json["userDetails"]!.map((x) => UserDetail.fromJson(x))),
    workingHours: json["workingHours"] == null ? [] : List<WorkingHour>.from(json["workingHours"]!.map((x) => WorkingHour.fromJson(x))),
    labServices: json["labServices"] == null ? [] : List<LabService>.from(json["labServices"]!.map((x) => LabService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "screenStatus": screenStatus,
    "labName": labName,
    "landLineNumber": landLineNumber,
    "mobileNumber": mobileNumber,
    "description": description,
    "deliveryMethod": deliveryMethod,
    "paymentMethod": paymentMethod,
    "userDetails": userDetails == null ? [] : List<dynamic>.from(userDetails!.map((x) => x.toJson())),
    "workingHours": workingHours == null ? [] : List<dynamic>.from(workingHours!.map((x) => x.toJson())),
    "labServices": labServices == null ? [] : List<dynamic>.from(labServices!.map((x) => x.toJson())),
  };
}

class LabService {
  String? id;
  String? title;
  int? price;
  List<String>? serviceImags;

  LabService({
    required this.id,
    required this.title,
    required this.price,
    required this.serviceImags,
  });

  factory LabService.fromJson(Map<String, dynamic> json) => LabService(
    id: json["_id"] ?? " ",
    title: json["title"]?? " ",
    price: json["price"]?? " ",
    serviceImags: json["serviceImags"] == null ? [] : List<String>.from(json["serviceImags"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "price": price,
    "serviceImags": serviceImags == null ? [] : List<dynamic>.from(serviceImags!.map((x) => x)),
  };
}

class UserDetail {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  UserDetail({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    id: json["_id"]?? " ",
    firstName: json["firstName"]?? " ",
    lastName: json["lastName"]?? " ",
    email: json["email"]?? " ",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
  };
}

class WorkingHour {
  String? id;
  String? labId;
  List<DayDetail>? dayDetails;

  WorkingHour({
    required this.id,
    required this.labId,
    required this.dayDetails,
  });

  factory WorkingHour.fromJson(Map<String, dynamic> json) => WorkingHour(
    id: json["_id"],
    labId: json["labId"],
    dayDetails: json["dayDetails"] == null ? [] : List<DayDetail>.from(json["dayDetails"]!.map((x) => DayDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "labId": labId,
    "dayDetails": dayDetails == null ? [] : List<dynamic>.from(dayDetails!.map((x) => x.toJson())),
  };
}

class DayDetail {
  String? day;
  String? startTime;
  String? endTime;
  bool? isOpen;
  String? id;

  DayDetail({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.isOpen,
    required this.id,
  });

  factory DayDetail.fromJson(Map<String, dynamic> json) => DayDetail(
    day: json["day"].toString(),
    startTime: json["startTime"].toString(),
    endTime: json["endTime"].toString(),
    isOpen: json["isOpen"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "startTime": startTime,
    "endTime": endTime,
    "isOpen": isOpen,
    "_id": id,
  };
}

// import 'dart:convert';

class Service {
  int? status;
  bool? success;
  List<SingleServiceModel>? serviceData;

  Service({this.status, this.success, this.serviceData});

  factory Service.fromJson(Map<String, dynamic> json) {
    List serviceData = json['serviceData'];
    return Service(
      status : json['status'],
      success : json['success'],
      serviceData : serviceData.map((v) => SingleServiceModel.fromJson(v)).toList(),
    );
  }
}

class SingleServiceModel {
  String? id;
  String? labId;
  String? title;
  String? description;
  int? price;
  List<String> serviceImags;
  int? status;
  DateTime? createdAt;

  SingleServiceModel({
    this.id,
    this.labId,
    this.title,
    this.description,
    this.price,
    required this.serviceImags,
    this.status,
    this.createdAt,
  });

  factory SingleServiceModel.fromJson(Map<String, dynamic> json) => SingleServiceModel(
    id: json["_id"],
    labId: json["labId"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    serviceImags: json["serviceImags"] == null ? [] : List<String>.from(json["serviceImags"]!.map((x) => x)),
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "labId": labId,
    "title": title,
    "description": description,
    "price": price,
    "serviceImags": serviceImags == null ? [] : List<dynamic>.from(serviceImags!.map((x) => x)),
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
  };
}

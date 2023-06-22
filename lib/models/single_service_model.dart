// import 'dart:convert';

class Service {
  int? status;
  bool? success;
  List<SingleServiceModel>? serviceData;

  Service({this.status, this.success, this.serviceData});

  factory Service.fromJson(Map<String, dynamic> json) {
    List serviceData = json['serviceData'];
    return Service(
      status: json['status'],
      success: json['success'],
      serviceData:
          serviceData.map((v) => SingleServiceModel.fromJson(v)).toList(),
    );
  }
}

class SingleServiceModel {
  String? id;
  String? labId;
  String? title;
  String? description;
  String? price;
  List? serviceImags;

  SingleServiceModel({
    this.id,
    this.labId,
    this.title,
    this.description,
    this.price,
    required this.serviceImags,
  });

  factory SingleServiceModel.fromJson(Map<String, dynamic> json) {
    return SingleServiceModel(
      id: json["_id"],
      labId: json["labId"],
      title: json["title"],
      description: json["description"],
      price: json["price"].toString(),
      serviceImags: json["serviceImags"] ?? [],
    );
  }
}

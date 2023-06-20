// To parse this JSON data, do
//
//     final getfeedsModel = getfeedsModelFromJson(jsonString);

import 'dart:convert';

GetfeedsModel getfeedsModelFromJson(String str) => GetfeedsModel.fromJson(json.decode(str));

String getfeedsModelToJson(GetfeedsModel data) => json.encode(data.toJson());

class GetfeedsModel {
  int? status;
  bool? success;
  Data? data;

  GetfeedsModel({
    this.status,
    this.success,
    this.data,
  });

  factory GetfeedsModel.fromJson(Map<String, dynamic> json) => GetfeedsModel(
    status: json["status"]?? 0,
    success: json["success"]?? false,
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data?.toJson(),
  };
}

class Data {
  int? count;
  List<Quotesdatum>? quotesdata;

  Data({
    this.count,
    this.quotesdata,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    count: json["count"]?? 0,
    quotesdata: json["quotesdata"] == null ? [] : List<Quotesdatum>.from(json["quotesdata"]!.map((x) => Quotesdatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "quotesdata": quotesdata == null ? [] : List<dynamic>.from(quotesdata!.map((x) => x.toJson())),
  };
}

class Quotesdatum {
  String? id;
  String? title;
  String? description;
  DateTime? createdAt;
  DateTime? tillDate;

  Quotesdatum({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.tillDate,
  });

  factory Quotesdatum.fromJson(Map<String, dynamic> json) => Quotesdatum(
    id: json["_id"]?? "",
    title: json["title"]?? "",
    description: json["description"]?? "",
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    tillDate: json["tillDate"] == null ? null : DateTime.parse(json["tillDate"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "createdAt": createdAt?.toIso8601String(),
    "tillDate": tillDate?.toIso8601String(),
  };
}

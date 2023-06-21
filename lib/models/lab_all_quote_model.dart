
class LabQuoteStatus {
  int? status;
  bool? success;
  Data? data;

  LabQuoteStatus({
    this.status,
    this.success,
    this.data,
  });

  factory LabQuoteStatus.fromJson(Map<String, dynamic> json) => LabQuoteStatus(
    status: json["status"],
    success: json["success"],
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
  List<Quotedatum>? quotedata;

  Data({
    this.count,
    this.quotedata,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    count: json["count"],
    quotedata: json["quotedata"] == null ? [] : List<Quotedatum>.from(json["quotedata"]!.map((x) => Quotedatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "quotedata": quotedata == null ? [] : List<dynamic>.from(quotedata!.map((x) => x.toJson())),
  };
}

class Quotedatum {
  String? id;
  String? clinicId;
  String? quoteNumber;
  String? title;
  String? description;
  List<String>? serviceIds;
  String? priority;
  List<String>? quoteImages;
  List<QuoteStatus>? quoteStatus;
  DateTime? createdAt;
  String? isAceptedLab;
  List<ServiceDetail>? serviceDetails;

  Quotedatum({
    this.id,
    this.clinicId,
    this.quoteNumber,
    this.title,
    this.description,
    this.serviceIds,
    this.priority,
    this.quoteImages,
    this.quoteStatus,
    this.createdAt,
    this.isAceptedLab,
    this.serviceDetails,
  });

  factory Quotedatum.fromJson(Map<String, dynamic> json) => Quotedatum(
    id: json["_id"],
    clinicId: json["clinicId"],
    quoteNumber: json["quoteNumber"],
    title: json["title"],
    description: json["description"],
    serviceIds: json["serviceIds"] == null ? [] : List<String>.from(json["serviceIds"]!.map((x) => x)),
    priority: json["priority"],
    quoteImages: json["quoteImages"] == null ? [] : List<String>.from(json["quoteImages"]!.map((x) => x)),
    quoteStatus: json["quoteStatus"] == null ? [] : List<QuoteStatus>.from(json["quoteStatus"]!.map((x) => QuoteStatus.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    isAceptedLab: json["isAceptedLab"],
    serviceDetails: json["serviceDetails"] == null ? [] : List<ServiceDetail>.from(json["serviceDetails"]!.map((x) => ServiceDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "clinicId": clinicId,
    "quoteNumber": quoteNumber,
    "title": title,
    "description": description,
    "serviceIds": serviceIds == null ? [] : List<dynamic>.from(serviceIds!.map((x) => x)),
    "priority": priority,
    "quoteImages": quoteImages == null ? [] : List<dynamic>.from(quoteImages!.map((x) => x)),
    "quoteStatus": quoteStatus == null ? [] : List<dynamic>.from(quoteStatus!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "isAceptedLab": isAceptedLab,
    "serviceDetails": serviceDetails == null ? [] : List<dynamic>.from(serviceDetails!.map((x) => x.toJson())),
  };
}

class QuoteStatus {
  String? id;
  String? labStatus;

  QuoteStatus({
    this.id,
    this.labStatus,
  });

  factory QuoteStatus.fromJson(Map<String, dynamic> json) => QuoteStatus(
    id: json["_id"],
    labStatus: json["labStatus"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "labStatus": labStatus,
  };
}

class ServiceDetail {
  String? id;
  String? title;

  ServiceDetail({
    this.id,
    this.title,
  });

  factory ServiceDetail.fromJson(Map<String, dynamic> json) => ServiceDetail(
    id: json["_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
  };
}

class LabQuote {
  int? status;
  bool? success;
  String? message;
  Data? data;

  LabQuote({this.status, this.success, this.data, this.message});

  factory LabQuote.fromJson(Map<String, dynamic> json) {
    return LabQuote(
      status: json['status'],
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  int? count;
  List<LabQuoteStatus>? quotesData;

  Data({this.count, this.quotesData});

  factory Data.fromJson(Map<String, dynamic> json) {
    List? quotes = json['quotesdata'];
    return Data(
      count: json['count'],
      quotesData: quotes != null
          ? List<LabQuoteStatus>.from(
        quotes.map((e) => LabQuoteStatus.fromJson(e)),
      )
          : null,
    );
  }
}

class LabQuoteStatus {
  String? id;
  String? clinicId;
  String? quoteNumber;
  String? title;
  String? description;
  List<String>? serviceIds;
  String? priority;
  List<QuoteStatus>? quoteStatus;
  DateTime? createdAt;
  String? isAceptedLab;
  List<ServiceDetail>? serviceDetails;

  LabQuoteStatus({
    this.id,
    this.clinicId,
    this.quoteNumber,
    this.title,
    this.description,
    this.serviceIds,
    this.priority,
    this.quoteStatus,
    this.createdAt,
    this.isAceptedLab,
    this.serviceDetails,
  });

  factory LabQuoteStatus.fromJson(Map<String, dynamic> json) => LabQuoteStatus(
    id: json["_id"],
    clinicId: json["clinicId"],
    quoteNumber: json["quoteNumber"],
    title: json["title"],
    description: json["description"],
    serviceIds: json["serviceIds"] == null
        ? null
        : List<String>.from(json["serviceIds"].map((x) => x)),
    priority: json["priority"],
    quoteStatus: json["quoteStatus"] == null
        ? null
        : List<QuoteStatus>.from(
        json["quoteStatus"].map((x) => QuoteStatus.fromJson(x))),
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    isAceptedLab: json["isAceptedLab"],
    serviceDetails: json["serviceDetails"] == null
        ? null
        : List<ServiceDetail>.from(
        json["serviceDetails"].map((x) => ServiceDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "clinicId": clinicId,
    "quoteNumber": quoteNumber,
    "title": title,
    "description": description,
    "serviceIds": serviceIds == null
        ? null
        : List<dynamic>.from(serviceIds!.map((x) => x)),
    "priority": priority,
    "quoteStatus": quoteStatus == null
        ? null
        : List<dynamic>.from(quoteStatus!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "isAceptedLab": isAceptedLab,
    "serviceDetails": serviceDetails == null
        ? null
        : List<dynamic>.from(serviceDetails!.map((x) => x.toJson())),
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

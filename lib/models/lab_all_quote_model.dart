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
  List<LabQuoteStatus>? quotesData;

  Data({this.quotesData});

  factory Data.fromJson(Map<String, dynamic> json) {
    List quotes = json['quotedata'] ?? [];
    return Data(
      quotesData: quotes.map((e) => LabQuoteStatus.fromJson(e)).toList(),
    );
  }
}

class LabQuoteStatus {
  String? id;
  String? clinicId;
  String? quoteNumber;
  String? title;
  String? description;
  String? priority;
  List<QuoteStatus>? quoteStatus;
  List<ServiceDetail>? serviceDetails;

  LabQuoteStatus({
    this.id,
    this.clinicId,
    this.quoteNumber,
    this.title,
    this.description,
    this.priority,
    this.quoteStatus,
    this.serviceDetails,
  });

  factory LabQuoteStatus.fromJson(Map<String, dynamic> json) {
    List quoteStatus = json["quoteStatus"] ?? [];
    List serviceDetail = json["serviceDetails"] ?? [];
    return LabQuoteStatus(
      id: json["_id"],
      clinicId: json["clinicId"],
      quoteNumber: json["quoteNumber"],
      title: json["title"],
      description: json["description"],
      priority: json["priority"],
      quoteStatus: quoteStatus.map((x) => QuoteStatus.fromJson(x)).toList(),
      serviceDetails:
          serviceDetail.map((x) => ServiceDetail.fromJson(x)).toList(),
    );
  }
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
}

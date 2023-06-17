class Quotes {
  int? status;
  bool? success;
  Data? data;

  Quotes({this.status, this.success, this.data});

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      status : json['status'],
      success : json['success'],
      data : json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  int? count;
  List<QuotesData>? quotesData;

  Data({this.count, this.quotesData});

  factory Data.fromJson(Map<String, dynamic> json) {
    List quotes = json['quotesdata'];
    return Data(
      count : json['count'],
      quotesData : quotes.map((e) => QuotesData.fromJson(e)).toList()
    );
  }
}

class QuotesData {
  String? id;
  String? clinicId;
  String? quoteNumber;
  String? title;
  String? description;
  String? priority;
  String? chooseFor;
  String? tillDate;
  List? quoteImages;
  List<QuoteStatus>? quoteStatus;
  String? createdAt;
  List<ServiceDetails>? serviceDetails;
  List<LabsDetails>? labsDetails;
  String? proposal;

  QuotesData(
      {this.id,
        this.clinicId,
        this.quoteNumber,
        this.title,
        this.description,
        this.priority,
        this.chooseFor,
        this.tillDate,
        this.quoteImages,
        this.quoteStatus,
        this.createdAt,
        this.serviceDetails,
        this.labsDetails,
        this.proposal});

  factory QuotesData.fromJson(Map<String, dynamic> json) {
    List status = json['quoteStatus'];
    List service = json['serviceDetails'];
    List lab = json['labsDetails'];
    return QuotesData(
      id : json['_id'],
      clinicId : json['clinicId'],
      quoteNumber : json['quoteNumber'],
      title : json['title'],
      description : json['description'],
      priority : json['priority'],
      chooseFor : json['chooseFor'],
      tillDate : json['tillDate'],
      quoteImages : json['quoteImages'] ?? [],
      quoteStatus : status.map((e) => QuoteStatus.fromJson(e)).toList(),
      createdAt : json['createdAt'], 
      serviceDetails : service.map((e) => ServiceDetails.fromJson(e)).toList(),
      labsDetails: lab.map((e) => LabsDetails.fromJson(e)).toList(),
      proposal : json['propsals'].toString(),
    );
  }
}

class QuoteStatus {
  String? id;
  String? clinicStatus;

  QuoteStatus({this.id, this.clinicStatus});

  factory QuoteStatus.fromJson(Map<String, dynamic> json) {
    return QuoteStatus(
      id : json['_id'],
      clinicStatus : json['clinicStatus'],
    );
  }
}

class ServiceDetails {
  String? id;
  String? title;

  ServiceDetails({this.id, this.title});

  factory ServiceDetails.fromJson(Map<String, dynamic> json) {
    return ServiceDetails(
      id : json['_id'],
      title : json['title'],
    );
  }
}

class LabsDetails {
  String? id;
  String? labName;

  LabsDetails({this.id, this.labName});

  factory LabsDetails.fromJson(Map<String, dynamic> json) {
    return LabsDetails(
      id : json['_id'],
      labName : json['labName'],
    );
  }
}
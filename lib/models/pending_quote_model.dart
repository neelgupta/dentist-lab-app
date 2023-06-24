class PendingQuote {
  int? status;
  bool? success;
  Data? data;

  PendingQuote({this.status, this.success, this.data});

  factory PendingQuote.fromJson(Map<String, dynamic> json) {
    return PendingQuote(
      status: json['status'],
      success: json['success'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  List<QuotesData>? quotesData;
  int? count;
  List<Propsaldata>? propsaldata;

  Data({this.quotesData, this.count, this.propsaldata});

  factory Data.fromJson(Map<String, dynamic> json) {
    List quotesData = json['quotesData'];
    List proposalData = json['propsaldata'];
    return Data(
      quotesData: quotesData.map((v) => QuotesData.fromJson(v)).toList(),
      count: json['count'],
      propsaldata: proposalData.map((v) => Propsaldata.fromJson(v)).toList(),
    );
  }
}

class QuotesData {
  String? id;
  String? quoteNumber;
  String? title;
  String? description;
  String? priority;
  String? chooseFor;
  String? tillDate;
  List<ServiceDetails>? serviceDetails;

  QuotesData(
      {this.id,
      this.quoteNumber,
      this.title,
      this.description,
      this.priority,
      this.chooseFor,
      this.tillDate,
      this.serviceDetails});

  factory QuotesData.fromJson(Map<String, dynamic> json) {
    List serviceDetail = json['serviceDetails'];
    return QuotesData(
      id: json['_id'],
      quoteNumber: json['quoteNumber'],
      title: json['title'],
      description: json['description'],
      priority: json['priority'],
      chooseFor: json['chooseFor'],
      tillDate: json['tillDate'],
      serviceDetails:
          serviceDetail.map((v) => ServiceDetails.fromJson(v)).toList(),
    );
  }
}

class ServiceDetails {
  String? id;
  String? title;

  ServiceDetails({this.id, this.title});

  factory ServiceDetails.fromJson(Map<String, dynamic> json) {
    return ServiceDetails(
      id: json['_id'],
      title: json['title'],
    );
  }
}

class Propsaldata {
  String? id;
  String? quoteId;
  String? labId;
  double? amount;
  String? createdAt;
  List<LabDetails>? labDetails;

  Propsaldata(
      {this.id,
      this.quoteId,
      this.labId,
      this.amount,
      this.createdAt,
      this.labDetails});

  factory Propsaldata.fromJson(Map<String, dynamic> json) {
    List labDetail = json['labDetails'];
    return Propsaldata(
        id: json['_id'],
        quoteId: json['quoteId'],
        labId: json['labId'],
        amount: double.parse((json['amount'] ?? 0).toString()),
        createdAt: json['createdAt'],
        labDetails: labDetail.map((v) => LabDetails.fromJson(v)).toList());
  }
}

class LabDetails {
  String? id;
  String? createdAt;
  String? city;
  String? state;
  String? country;
  String? labName;
  String? landLineNumber;
  String? mobileNumber;
  String? countryCode;
  String? description;

  LabDetails(
      {this.id,
      this.createdAt,
      this.city,
      this.state,
      this.country,
      this.labName,
      this.landLineNumber,
      this.mobileNumber,
      this.countryCode,
      this.description});

  factory LabDetails.fromJson(Map<String, dynamic> json) {
    return LabDetails(
      id: json['_id'],
      createdAt: json['createdAt'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      labName: json['labName'],
      landLineNumber: json['landLineNumber'].toString(),
      mobileNumber: json['mobileNumber'].toString(),
      countryCode: json['countryCode'],
      description: json['description'],
    );
  }
}

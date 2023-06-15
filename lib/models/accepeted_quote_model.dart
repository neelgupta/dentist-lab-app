class AcceptedQuote {
  int? status;
  bool? success;
  List<QuoteData>? quoteData;

  AcceptedQuote({this.status, this.success, this.quoteData});

  factory AcceptedQuote.fromJson(Map<String, dynamic> json) {
    List quoteData = json['quoteData'];
    return AcceptedQuote(
    status : json['status'],
    success : json['success'],
      quoteData : quoteData.map((v) => QuoteData.fromJson(v)).toList()
    );
  }
}

class QuoteData {
  String? id;
  String? quoteNumber;
  String? title;
  String? description;
  String? priority;
  List<QuoteStatus>? quoteStatus;
  List<LabDetails>? labDetails;
  List<PropsalDetails>? propsalDetails;
  List<OrderDetails>? orderDetails;

  QuoteData(
      {this.id,
        this.quoteNumber,
        this.title,
        this.description,
        this.priority,
        this.quoteStatus,
        this.labDetails,
        this.propsalDetails,
        this.orderDetails});

  factory QuoteData.fromJson(Map<String, dynamic> json) {
    List quoteStatus = json['quoteStatus'];
    List labDetails = json['labDetails'];
    List propsalDetails = json['propsalDetails'];
    List orderDetails = json['orderDetails'];
    return QuoteData(
    id : json['_id'],
    quoteNumber : json['quoteNumber'],
    title : json['title'],
    description : json['description'],
    priority : json['priority'],
    quoteStatus: quoteStatus.map((v) => QuoteStatus.fromJson(v)).toList(),
        labDetails: labDetails.map((v) => LabDetails.fromJson(v)).toList(),
        propsalDetails: propsalDetails.map((v) => PropsalDetails.fromJson(v)).toList(),
        orderDetails: orderDetails.map((v) => OrderDetails.fromJson(v)).toList(),
    );
  }
}

class QuoteStatus {
  String? id;
  String? clinicStatus;
  String? labStatus;

  QuoteStatus({this.id, this.clinicStatus, this.labStatus});

  factory QuoteStatus.fromJson(Map<String, dynamic> json) {
    return QuoteStatus(
      id : json['_id'],
      clinicStatus : json['clinicStatus'],
      labStatus : json['labStatus'],
    );
  }
}

class LabDetails {
  String? id;
  String? address;
  String? city;
  String? country;
  String? labName;
  String? landLineNumber;
  String? mobileNumber;

  LabDetails(
      {this.id,
        this.address,
        this.city,
        this.country,
        this.labName,
        this.landLineNumber,
        this.mobileNumber});

  factory LabDetails.fromJson(Map<String, dynamic> json) {
    return LabDetails(
      id : json['_id'],
      address : json['address'],
      city : json['city'],
      country : json['country'],
      labName : json['labName'],
      landLineNumber : json['landLineNumber'].toString(),
      mobileNumber : json['mobileNumber'].toString(),
    );
  }
}

class PropsalDetails {
  String? id;
  String? quoteId;
  String? labId;
  String? amount;

  PropsalDetails({this.id, this.quoteId, this.labId, this.amount});

  factory PropsalDetails.fromJson(Map<String, dynamic> json) {
    return PropsalDetails(
      id : json['_id'],
      quoteId : json['quoteId'],
      labId : json['labId'],
      amount : json['amount'].toString(),
    );
  }
}

class OrderDetails {
  String? id;
  double? advanceAmount;
  double? remainingAmount;
  double? totalAmount;

  OrderDetails(
      {this.id, this.advanceAmount, this.remainingAmount, this.totalAmount});

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      id : json['_id'],
      advanceAmount : double.parse(json['advanceAmount'].toString()),
      remainingAmount : double.parse(json['remainingAmount'].toString()),
      totalAmount : double.parse(json['totalAmount'].toString()),
    );
  }
}
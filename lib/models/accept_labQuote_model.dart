
class AcceptLabQuoteModel {
  int? status;
  bool? success;
  List<QuoteDatum>? quoteData;

  AcceptLabQuoteModel({
    this.status,
    this.success,
    this.quoteData,
  });

  factory AcceptLabQuoteModel.fromJson(Map<String, dynamic> json) => AcceptLabQuoteModel(
    status: json["status"],
    success: json["success"],
    quoteData: json["quoteData"] == null ? [] : List<QuoteDatum>.from(json["quoteData"]!.map((x) => QuoteDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "quoteData": quoteData == null ? [] : List<dynamic>.from(quoteData!.map((x) => x.toJson())),
  };
}

class QuoteDatum {
  String? id;
  String? quoteNumber;
  String? title;
  String? description;
  String? priority;
  List<QuoteStatus>? quoteStatus;
  List<Detail>? clinicDetails;
  List<Detail>? labDetails;
  List<PropsalDetail>? propsalDetails;
  List<OrderDetail>? orderDetails;

  QuoteDatum({
    this.id,
    this.quoteNumber,
    this.title,
    this.description,
    this.priority,
    this.quoteStatus,
    this.clinicDetails,
    this.labDetails,
    this.propsalDetails,
    this.orderDetails,
  });

  factory QuoteDatum.fromJson(Map<String, dynamic> json) => QuoteDatum(
    id: json["_id"],
    quoteNumber: json["quoteNumber"],
    title: json["title"],
    description: json["description"],
    priority: json["priority"],
    quoteStatus: json["quoteStatus"] == null ? [] : List<QuoteStatus>.from(json["quoteStatus"]!.map((x) => QuoteStatus.fromJson(x))),
    clinicDetails: json["clinicDetails"] == null ? [] : List<Detail>.from(json["clinicDetails"]!.map((x) => Detail.fromJson(x))),
    labDetails: json["labDetails"] == null ? [] : List<Detail>.from(json["labDetails"]!.map((x) => Detail.fromJson(x))),
    propsalDetails: json["propsalDetails"] == null ? [] : List<PropsalDetail>.from(json["propsalDetails"]!.map((x) => PropsalDetail.fromJson(x))),
    orderDetails: json["orderDetails"] == null ? [] : List<OrderDetail>.from(json["orderDetails"]!.map((x) => OrderDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "quoteNumber": quoteNumber,
    "title": title,
    "description": description,
    "priority": priority,
    "quoteStatus": quoteStatus == null ? [] : List<dynamic>.from(quoteStatus!.map((x) => x.toJson())),
    "clinicDetails": clinicDetails == null ? [] : List<dynamic>.from(clinicDetails!.map((x) => x.toJson())),
    "labDetails": labDetails == null ? [] : List<dynamic>.from(labDetails!.map((x) => x.toJson())),
    "propsalDetails": propsalDetails == null ? [] : List<dynamic>.from(propsalDetails!.map((x) => x.toJson())),
    "orderDetails": orderDetails == null ? [] : List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
  };
}

class Detail {
  String? id;
  String? address;
  String? city;
  String? clinicName;
  String? country;
  int? landLineNumber;
  int? mobileNumber;
  String? countryCode;
  String? labName;

  Detail({
    this.id,
    this.address,
    this.city,
    this.clinicName,
    this.country,
    this.landLineNumber,
    this.mobileNumber,
    this.countryCode,
    this.labName,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["_id"],
    address: json["address"],
    city: json["city"],
    clinicName: json["clinicName"],
    country: json["country"],
    landLineNumber: json["landLineNumber"],
    mobileNumber: json["mobileNumber"],
    countryCode: json["countryCode"],
    labName: json["labName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "address": address,
    "city": city,
    "clinicName": clinicName,
    "country": country,
    "landLineNumber": landLineNumber,
    "mobileNumber": mobileNumber,
    "countryCode": countryCode,
    "labName": labName,
  };
}

class OrderDetail {
  String? id;
  int? advanceAmount;
  int? remainingAmount;
  int? totalAmount;

  OrderDetail({
    this.id,
    this.advanceAmount,
    this.remainingAmount,
    this.totalAmount,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    id: json["_id"],
    advanceAmount: json["advanceAmount"],
    remainingAmount: json["remainingAmount"],
    totalAmount: json["totalAmount"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "advanceAmount": advanceAmount,
    "remainingAmount": remainingAmount,
    "totalAmount": totalAmount,
  };
}

class PropsalDetail {
  String? id;
  String? quoteId;
  String? labId;
  int? amount;

  PropsalDetail({
    this.id,
    this.quoteId,
    this.labId,
    this.amount,
  });

  factory PropsalDetail.fromJson(Map<String, dynamic> json) => PropsalDetail(
    id: json["_id"],
    quoteId: json["quoteId"],
    labId: json["labId"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "quoteId": quoteId,
    "labId": labId,
    "amount": amount,
  };
}

class QuoteStatus {
  String? id;
  String? labStatus;
  String? clinicStatus;

  QuoteStatus({
    this.id,
    this.labStatus,
    this.clinicStatus,
  });

  factory QuoteStatus.fromJson(Map<String, dynamic> json) => QuoteStatus(
    id: json["_id"],
    labStatus: json["labStatus"],
    clinicStatus: json["clinicStatus"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "labStatus": labStatus,
    "clinicStatus": clinicStatus,
  };
}

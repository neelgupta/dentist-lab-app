class Payment {
  int? status;
  bool? success;
  List<PaymentData>? paymentData;

  Payment({this.status, this.success, this.paymentData});

  factory Payment.fromJson(Map<String, dynamic> json) {
    List paymentData = json['paymentData'];
    return Payment(
      status : json['status'],
      success : json['success'],
      paymentData : paymentData.map((v) => PaymentData.fromJson(v)).toList(),
    );
  }
}

class PaymentData {
  String? id;
  String? orderId;
  String? totalAmount;
  String? paymentMethod;
  String? createdAt;
  List<LabDetails>? labDetails;
  String? type;

  PaymentData(
      {this.id,
        this.orderId,
        this.totalAmount,
        this.paymentMethod,
        this.createdAt,
        this.labDetails,
        this.type});

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    List labDetail = json['labDetails'];
    return PaymentData(
      id : json['_id'],
      orderId : json['orderId'],
      totalAmount : json['totalAmount'].toString(),
      paymentMethod : json['paymentMethod'],
      createdAt : json['createdAt'],
      labDetails : labDetail.map((v) => LabDetails.fromJson(v)).toList(),
      type : json['type'].toString(),
    );
  }
}

class LabDetails {
  String? id;
  String? labName;

  LabDetails({this.id, this.labName});

  factory LabDetails.fromJson(Map<String, dynamic> json) {
    return LabDetails(
      id : json['_id'],
      labName : json['labName'],
    );
  }
}
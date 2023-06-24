class Payment {
  int? status;
  bool? success;
  int? count;
  List<PaymentData>? paymentData;

  Payment({this.status, this.success, this.count, this.paymentData});

  factory Payment.fromJson(Map<String, dynamic> json) {
    List paymentData = json['paymentData'];
    return Payment(
      status : json['status'],
      success : json['success'],
      count : json['count'] ?? 0,
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
  List<ClinicDetails>? clinicDetails;
  String? type;

  PaymentData(
      {this.id,
        this.orderId,
        this.totalAmount,
        this.paymentMethod,
        this.createdAt,
        this.labDetails,
        this.clinicDetails,
        this.type});

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    List labDetail = json['labDetails'] ?? [];
    List clinicDetails = json['clinicDetails'] ?? [];
    return PaymentData(
      id : json['_id'],
      orderId : json['orderId'],
      totalAmount : json['totalAmount'].toString(),
      paymentMethod : json['paymentMethod'],
      createdAt : json['createdAt'],
      labDetails : labDetail.map((v) => LabDetails.fromJson(v)).toList(),
      clinicDetails : clinicDetails.map((v) => ClinicDetails.fromJson(v)).toList(),
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

class ClinicDetails {
  String? id;
  String? clinicName;

  ClinicDetails({this.id, this.clinicName});

  factory ClinicDetails.fromJson(Map<String, dynamic> json) {
    return ClinicDetails(
      id : json['_id'],
      clinicName : json['clinicName'],
    );
  }
}
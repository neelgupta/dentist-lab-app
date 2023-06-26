class LabPendingQuotes {
  int? status;
  bool? success;
  List<QuoteData>? quoteData;

  LabPendingQuotes({this.status, this.success, this.quoteData});

  factory LabPendingQuotes.fromJson(Map<String, dynamic> json) {
    List quoteData = json['quoteData'];
    return LabPendingQuotes(
        status: json['status'],
        success: json['success'],
        quoteData: quoteData.map((v) => QuoteData.fromJson(v)).toList());
  }
}

class QuoteData {
  String? id;
  String? quoteNumber;
  String? title;
  String? description;
  String? priority;
  List? quoteImages;
  List<ClinicDetail>? clinicDetails;
  List<ServiceDetails>? serviceDetails;

  QuoteData(
      {this.id,
        this.quoteNumber,
        this.title,
        this.description,
        this.priority,
        this.quoteImages,
        this.clinicDetails,
        this.serviceDetails,
      });

  factory QuoteData.fromJson(Map<String, dynamic> json) {
    List clinicDetails = json['clinicDetails'];
    List serviceDetails = json['serviceDetails'];
    return QuoteData(
      id: json['_id'],
      quoteNumber: json['quoteNumber'],
      title: json['title'],
      description: json['description'],
      priority: json['priority'],
      quoteImages: json['quoteImages'] ?? [],
      clinicDetails:
      clinicDetails.map((v) => ClinicDetail.fromJson(v)).toList(),
      serviceDetails: serviceDetails.map((v) => ServiceDetails.fromJson(v)).toList(),
    );
  }
}

class ClinicDetail {
  String? city;
  String? state;
  String? country;
  String? clinicName;

  ClinicDetail(
      {
        this.city,
        this.state,
        this.country,
        this.clinicName,});

  factory ClinicDetail.fromJson(Map<String, dynamic> json) {
    return ClinicDetail(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      clinicName: json['clinicName'],
    );
  }
}

class ServiceDetails {
  String? title;

  ServiceDetails({this.title});

  factory ServiceDetails.fromJson(Map<String, dynamic> json) {
    return ServiceDetails(
        title: json['title'] ?? ""
    );
  }
}

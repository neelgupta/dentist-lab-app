

class LabProfileModel {
  int? status;
  bool? success;
  List<LabDatum>? labData;

  LabProfileModel({
    required this.status,
    required this.success,
    required this.labData,
  });

  factory LabProfileModel.fromJson(Map<String, dynamic> json) =>
      LabProfileModel(
        status: json["status"] ?? 0,
        success: json["success"] ?? false,
        labData: json["labData"] == null
            ? []
            : List<LabDatum>.from(
                json["labData"]!.map((x) => LabDatum.fromJson(x))),
      );
}

class LabDatum {
  String? id;
  String? address;
  String? city;
  String? country;
  String? countryCode;
  String? dateOfEstablishment;
  String? labName;
  String? landLineNumber;
  String? mobileNumber;
  String? poBox;
  String? tRNFile;
  String? devicesFile;
  String? licensFile;
  String? tradeFile;
  String? tRNNumber;
  String? deviceUsed;
  String? medicalLicenseNumber;
  String? tradeLicenceNumber;
  String? finacialMangerCountryCode;
  String? finacialMangerEmail;
  String? finacialMangerName;
  String? finacialMangerNumber;
  String? labMangerCountryCode;
  String? labMangerEmail;
  String? labMangerName;
  String? labMangerNumber;
  String? techMangerCountryCode;
  String? techMangerEmail;
  String? techMangerName;
  String? techMangerNumber;
  String? techMangerlicensNo;
  String? totalLabTechinicians;
  String? labTechs;
  String? techlicensFile;
  String? description;
  String? deliveryMethod;
  String? paymentMethod;
  List<UserDetail>? userDetails;
  List<WorkingHour>? workingHours;
  List<LabService>? labServices;

  LabDatum({
    required this.id,
    required this.address,
    required this.city,
    required this.country,
    required this.countryCode,
    required this.dateOfEstablishment,
    required this.labName,
    required this.landLineNumber,
    required this.mobileNumber,
    required this.poBox,
    required this.tRNFile,
    required this.devicesFile,
    required this.licensFile,
    required this.tradeFile,
    required this.tRNNumber,
    required this.deviceUsed,
    required this.medicalLicenseNumber,
    required this.tradeLicenceNumber,
    required this.finacialMangerCountryCode,
    required this.finacialMangerEmail,
    required this.finacialMangerName,
    required this.finacialMangerNumber,
    required this.labMangerCountryCode,
    required this.labMangerEmail,
    required this.labMangerName,
    required this.labMangerNumber,
    required this.techMangerCountryCode,
    required this.techMangerEmail,
    required this.techMangerName,
    required this.techMangerNumber,
    required this.techMangerlicensNo,
    required this.totalLabTechinicians,
    required this.labTechs,
    required this.techlicensFile,
    required this.description,
    required this.deliveryMethod,
    required this.paymentMethod,
    required this.userDetails,
    required this.workingHours,
    required this.labServices,
  });

  factory LabDatum.fromJson(Map<String, dynamic> json) => LabDatum(
        id: json["_id"] ?? "",
        address : json['address'],
        city : json['city'],
        country : json['country'],
        countryCode : json['countryCode'],
        dateOfEstablishment : json['dateOfEstablishment'],
        labName : json['labName'],
        landLineNumber : json['landLineNumber'].toString(),
        mobileNumber : json['mobileNumber'].toString(),
        poBox : json['poBox'],
        tRNFile : json['TRNFile'],
        devicesFile : json['devicesFile'],
        licensFile : json['licensFile'],
        tradeFile : json['tradeFile'],
        tRNNumber : json['TRN_number'],
        deviceUsed : json['deviceUsed'].toString(),
        medicalLicenseNumber : json['medicalLicenseNumber'],
        tradeLicenceNumber : json['tradeLicenceNumber'],
        finacialMangerCountryCode : json['finacialMangerCountryCode'],
        finacialMangerEmail : json['finacialMangerEmail'],
        finacialMangerName : json['finacialMangerName'],
        finacialMangerNumber : json['finacialMangerNumber'],
        labMangerCountryCode : json['labMangerCountryCode'],
        labMangerEmail : json['labMangerEmail'],
        labMangerName : json['labMangerName'],
        labMangerNumber : json['labMangerNumber'],
        techMangerCountryCode : json['techMangerCountryCode'],
        techMangerEmail : json['techMangerEmail'],
        techMangerName : json['techMangerName'],
        techMangerNumber : json['techMangerNumber'],
        techMangerlicensNo : json['techMangerlicensNo'],
        totalLabTechinicians : json['totalLabTechinicians'].toString(),
        labTechs : json['labTechs'],
        techlicensFile : json['techlicensFile'],
        description: json['description'],
        deliveryMethod: json["deliveryMethod"] ?? " ",
        paymentMethod: json["paymentMethod"] ?? " ",
        userDetails: json["userDetails"] == null
            ? []
            : List<UserDetail>.from(
                json["userDetails"]!.map((x) => UserDetail.fromJson(x))),
        workingHours: json["workingHours"] == null
            ? []
            : List<WorkingHour>.from(
                json["workingHours"]!.map((x) => WorkingHour.fromJson(x))),
        labServices: json["labServices"] == null
            ? []
            : List<LabService>.from(
                json["labServices"]!.map((x) => LabService.fromJson(x))),
      );
}

class LabService {
  String? id;
  String? title;
  int? price;
  List<String>? serviceImags;

  LabService({
    required this.id,
    required this.title,
    required this.price,
    required this.serviceImags,
  });

  factory LabService.fromJson(Map<String, dynamic> json) => LabService(
        id: json["_id"] ?? " ",
        title: json["title"] ?? " ",
        price: json["price"] ?? " ",
        serviceImags: json["serviceImags"] == null
            ? []
            : List<String>.from(json["serviceImags"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "price": price,
        "serviceImags": serviceImags == null
            ? []
            : List<dynamic>.from(serviceImags!.map((x) => x)),
      };
}

class UserDetail {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profileImage;

  UserDetail({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profileImage,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json["_id"] ?? " ",
        firstName: json["firstName"] ?? " ",
        lastName: json["lastName"] ?? " ",
        email: json["email"] ?? " ",
        profileImage: json["profileImage"] ?? " ",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "profileImage": profileImage,
      };
}

class WorkingHour {
  String? id;
  String? labId;
  List<DayDetail>? dayDetails;

  WorkingHour({
    required this.id,
    required this.labId,
    required this.dayDetails,
  });

  factory WorkingHour.fromJson(Map<String, dynamic> json) => WorkingHour(
        id: json["_id"],
        labId: json["labId"],
        dayDetails: json["dayDetails"] == null
            ? []
            : List<DayDetail>.from(
                json["dayDetails"]!.map((x) => DayDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "labId": labId,
        "dayDetails": dayDetails == null
            ? []
            : List<dynamic>.from(dayDetails!.map((x) => x.toJson())),
      };
}

class DayDetail {
  String? day;
  String? startTime;
  String? endTime;
  bool? isOpen;
  String? id;

  DayDetail({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.isOpen,
    required this.id,
  });

  factory DayDetail.fromJson(Map<String, dynamic> json) => DayDetail(
        day: json["day"].toString(),
        startTime: json["startTime"].toString(),
        endTime: json["endTime"].toString(),
        isOpen: json["isOpen"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "startTime": startTime,
        "endTime": endTime,
        "isOpen": isOpen,
        "_id": id,
      };
}

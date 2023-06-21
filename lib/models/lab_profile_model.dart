class LabProfile {
  int? status;
  bool? success;
  List<LabData>? labData;

  LabProfile({this.status, this.success, this.labData});

  factory LabProfile.fromJson(Map<String, dynamic> json) {
    List lab = json['labData'];
    return LabProfile(
      status: json['status'],
      success: json['success'],
      labData: lab.map((v) => LabData.fromJson(v)).toList(),
    );
  }
}

class LabData {
  String? id;
  String? labName;
  String? landLineNumber;
  String? mobileNumber;
  String? countryCode;
  String? description;
  String? deliveryMethod;
  String? paymentMethod;
  List<UserDetails>? userDetails;
  List<WorkingHours>? workingHours;
  List<Service>? services;

  LabData({
    this.id,
    this.labName,
    this.landLineNumber,
    this.mobileNumber,
    this.countryCode,
    this.description,
    this.deliveryMethod,
    this.paymentMethod,
    this.userDetails,
    this.workingHours,
    this.services,
  });

  factory LabData.fromJson(Map<String, dynamic> json) {
    List user = json['userDetails'];
    List workHour = json['workingHours'];
    List serviceList = json['serviceDetails'];
    return LabData(
      id: json['_id'],
      labName: json['labName'],
      landLineNumber: json['landLineNumber'].toString(),
      mobileNumber: json['mobileNumber'].toString(),
      countryCode: json['countryCode'].toString(),
      description: json['description'],
      deliveryMethod: json['deliveryMethod'],
      paymentMethod: json['paymentMethod'],
      userDetails: user.map((v) => UserDetails.fromJson(v)).toList(),
      workingHours: workHour.map((v) => WorkingHours.fromJson(v)).toList(),
      services: serviceList.map((e) => Service.fromjson(e)).toList(),
    );
  }
}

class UserDetails {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profileImage;

  UserDetails(
      {this.id, this.firstName, this.lastName, this.email, this.profileImage});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      profileImage: json['profileImage'] ?? "",
    );
  }
}

class WorkingHours {
  String? id;
  String? labId;
  List<DayDetail>? dayDetails;

  WorkingHours({this.id, this.labId, this.dayDetails});

  factory WorkingHours.fromJson(Map<String, dynamic> json) {
    List days = json['dayDetails'];
    return WorkingHours(
      id: json['_id'],
      labId: json['labId'],
      dayDetails: days.map((v) => DayDetail.fromJson(v)).toList(),
    );
  }
}

class DayDetail {
  String? day;
  String? startTime;
  String? endTime;
  bool? isOpen;

  DayDetail({
    this.day,
    this.startTime,
    this.endTime,
    this.isOpen,
  });

  factory DayDetail.fromJson(Map<String, dynamic> json) {
    return DayDetail(
      day: json['day'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      isOpen: json['isOpen'],
    );
  }
}

class Service {
  String? title;
  List? serviceImages;

  Service({this.title, this.serviceImages});

  factory Service.fromjson(Map<String, dynamic> json) {
    return Service(title: json['title'], serviceImages: json['serviceImags']);
  }
}

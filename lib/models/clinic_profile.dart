class ClinicProfile {
  int? status;
  bool? success;
  Data? data;

  ClinicProfile({this.status, this.success, this.data});

  factory ClinicProfile.fromJson(Map<String, dynamic> json) {
    return ClinicProfile(
      status: json['status'],
      success: json['success'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  String? id;
  UserId? userId;
  String? address;
  String? city;
  String? clinicName;
  String? country;
  String? state;
  String? dateOfEstablishment;
  String? landLineNumber;
  String? mobileNumber;
  String? poBox;
  String? licensFile;
  String? tradeFile;
  String? trnFile;
  String? tRNNumber;
  String? licensingAuthority;
  String? medicalLicenseNumber;
  String? tradeLicenceNumber;
  String? clinicMangerEmail;
  String? clinicMangerName;
  String? clinicMangerNumber;
  String? directorLicensNumber;
  String? finacialMangerEmail;
  String? finacialMangerName;
  String? finacialMangerNumber;
  String? medicalDirectorEmail;
  String? medicalDirectorName;
  String? medicalDirectorNumber;
  String? directorLicensFile;
  String? countryCode;
  String? clinicMangerCountryCode;
  String? medicalDirectorCountryCode;
  String? finacialMangerCountryCode;

  Data({
    this.id,
    this.userId,
    this.address,
    this.city,
    this.clinicName,
    this.country,
    this.state,
    this.dateOfEstablishment,
    this.landLineNumber,
    this.mobileNumber,
    this.poBox,
    this.licensFile,
    this.tradeFile,
    this.trnFile,
    this.tRNNumber,
    this.licensingAuthority,
    this.medicalLicenseNumber,
    this.tradeLicenceNumber,
    this.clinicMangerEmail,
    this.clinicMangerName,
    this.clinicMangerNumber,
    this.directorLicensNumber,
    this.finacialMangerEmail,
    this.finacialMangerName,
    this.finacialMangerNumber,
    this.medicalDirectorEmail,
    this.medicalDirectorName,
    this.medicalDirectorNumber,
    this.directorLicensFile,
    this.countryCode,
    this.clinicMangerCountryCode,
    this.medicalDirectorCountryCode,
    this.finacialMangerCountryCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'],
      userId: json['userId'] != null ? UserId.fromJson(json['userId']) : null,
      address: json['address'],
      city: json['city'],
      clinicName: json['clinicName'],
      country: json['country'],
      state: json['state'],
      dateOfEstablishment: json['dateOfEstablishment'],
      landLineNumber: json['landLineNumber'].toString(),
      mobileNumber: json['mobileNumber'].toString(),
      poBox: json['poBox'],
      licensFile: json['licensFile'],
      tradeFile: json['tradeFile'],
      trnFile: json['trnFile'],
      tRNNumber: json['TRN_number'],
      licensingAuthority: json['licensingAuthority'],
      medicalLicenseNumber: json['medicalLicenseNumber'],
      tradeLicenceNumber: json['tradeLicenceNumber'],
      clinicMangerEmail: json['clinicMangerEmail'],
      clinicMangerName: json['clinicMangerName'],
      clinicMangerNumber: json['clinicMangerNumber'].toString(),
      directorLicensNumber: json['directorLicensNumber'],
      finacialMangerEmail: json['finacialMangerEmail'],
      finacialMangerName: json['finacialMangerName'],
      finacialMangerNumber: json['finacialMangerNumber'].toString(),
      medicalDirectorEmail: json['medicalDirectorEmail'],
      medicalDirectorName: json['medicalDirectorName'],
      medicalDirectorNumber: json['medicalDirectorNumber'].toString(),
      directorLicensFile: json['directorLicensFile'],
      countryCode: json['countryCode'],
      clinicMangerCountryCode: json['clinicMangerCountryCode'],
      medicalDirectorCountryCode: json['medicalDirectorCountryCode'],
      finacialMangerCountryCode: json['finacialMangerCountryCode'],
    );
  }
}

class UserId {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profileImage;

  UserId({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profileImage,
  });

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      id: json['_id'].toString(),
      firstName: json['firstName'].toString(),
      lastName: json['lastName'].toString(),
      email: json['email'].toString(),
      profileImage: json['profileImage'].toString(),
    );
  }
}

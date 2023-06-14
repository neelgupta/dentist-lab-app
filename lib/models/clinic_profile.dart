class ClinicProfile {
  int? status;
  bool? success;
  Data? data;

  ClinicProfile({this.status, this.success, this.data});

  factory ClinicProfile.fromJson(Map<String, dynamic> json) {
    return ClinicProfile(
    status : json['status'],
    success : json['success'],
    data : json['data'] != null ? new Data.fromJson(json['data']) : null,
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

  Data(
      {this.id,
        this.userId,
        this.address,
        this.city,
        this.clinicName,
        this.country,
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
        this.directorLicensFile});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
    id : json['_id'].toString(),
    userId : json['userId'] != null ? UserId.fromJson(json['userId']) : null,
    address : json['address'].toString(),
    city : json['city'].toString(),
    clinicName : json['clinicName'].toString(),
    country : json['country'].toString(),
    dateOfEstablishment : json['dateOfEstablishment'].toString(),
    landLineNumber : json['landLineNumber'].toString(),
    mobileNumber : json['mobileNumber'].toString(),
    poBox : json['poBox'].toString(),
    licensFile : json['licensFile'].toString(),
    tradeFile : json['tradeFile'].toString(),
    trnFile : json['trnFile'].toString(),
    tRNNumber : json['TRN_number'].toString(),
    licensingAuthority : json['licensingAuthority'].toString(),
    medicalLicenseNumber : json['medicalLicenseNumber'].toString(),
    tradeLicenceNumber : json['tradeLicenceNumber'].toString(),
    clinicMangerEmail : json['clinicMangerEmail'].toString(),
    clinicMangerName : json['clinicMangerName'].toString(),
    clinicMangerNumber : json['clinicMangerNumber'].toString(),
    directorLicensNumber : json['directorLicensNumber'].toString(),
    finacialMangerEmail : json['finacialMangerEmail'].toString(),
    finacialMangerName : json['finacialMangerName'].toString(),
    finacialMangerNumber : json['finacialMangerNumber'].toString(),
    medicalDirectorEmail : json['medicalDirectorEmail'].toString(),
    medicalDirectorName : json['medicalDirectorName'].toString(),
    medicalDirectorNumber : json['medicalDirectorNumber'].toString(),
    directorLicensFile : json['directorLicensFile'].toString(),
    );
  }
}

class UserId {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  UserId(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,});

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      id : json['_id'].toString(),
      firstName : json['firstName'].toString(),
      lastName : json['lastName'].toString(),
      email : json['email'].toString(),
    );
  }

}
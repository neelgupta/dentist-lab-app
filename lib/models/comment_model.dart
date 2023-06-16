class Comments {
  int? status;
  bool? success;
  List<CommentData>? commentData;

  Comments({this.status, this.success, this.commentData});

  factory Comments.fromJson(Map<String, dynamic> json) {
    List comment = json['commentData'];
    return Comments(
      status : json['status'],
      success : json['success'],
      commentData: comment.map((v) => CommentData.fromJson(v)).toList()
    );
  }
}

class CommentData {
  String? id;
  String? title;
  String? comment;
  String? isMessage;
  String? createdAt;
  List<ClinicDetails>? clinicDetails;
  List<LabDetail>? labDetails;

  CommentData(
      {this.id,
        this.title,
        this.comment,
        this.isMessage,
        this.createdAt,
        this.clinicDetails,
        this.labDetails});

  factory CommentData.fromJson(Map<String, dynamic> json) {
    List clinic = json['clinicDetails'];
    List lab = json['labDetails'];
    return CommentData(
      id : json['_id'],
      title : json['title'],
      comment : json['comment'],
      isMessage : json['isMessage'],
      createdAt : json['createdAt'],
      clinicDetails : clinic.map((v) => ClinicDetails.fromJson(v)).toList(),
      labDetails : lab.map((v) => LabDetail.fromJson(v)).toList(),
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

class LabDetail {
  String? id;
  String? labName;

  LabDetail({this.id, this.labName});

  factory LabDetail.fromJson(Map<String, dynamic> json) {
    return LabDetail(
      id : json['_id'],
      labName : json['labName'],
    );
  }
}
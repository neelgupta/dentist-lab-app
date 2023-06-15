class Lab {
  int? status;
  bool? success;
  List<LabData>? labData;

  Lab({this.status, this.success, this.labData});

  factory Lab.fromJson(Map<String, dynamic> json) {
    List list = json['data'];
    return Lab(
      status : json['status'],
      success : json['success'],
      labData : list.map((e) => LabData.fromJson(e)).toList(),
    );
  }

}

class LabData {
  String? id;
  String? labName;

  LabData({this.id, this.labName});

  factory LabData.fromJson(Map<String, dynamic> json) {
    return LabData(
      id : json['_id'],
      labName : json['labName'],
    );
  }
}
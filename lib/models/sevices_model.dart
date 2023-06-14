class Service {
  int? status;
  bool? success;
  List<ServiceData>? serviceData;

  Service({this.status, this.success, this.serviceData});

  factory Service.fromJson(Map<String, dynamic> json) {
    List list = json['data'];
    return Service(
    status : json['status'],
    success : json['success'],
    serviceData : list.map((e) => ServiceData.fromJson(e)).toList(),
    );
  }

}

class ServiceData {
  String? id;
  String? title;

  ServiceData({this.id, this.title});

  factory ServiceData.fromJson(Map<String, dynamic> json) {
    return ServiceData(
    id : json['_id'],
    title : json['title'],
    );
  }
}
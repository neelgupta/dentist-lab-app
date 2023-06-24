class Notifications {
  int? status;
  bool? success;
  Data? data;

  Notifications({this.status, this.success, this.data});

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(
      status : json['status'],
      success : json['success'],
      data : json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  int? count;
  List<NotificationData>? notificationData;

  Data({this.count,this.notificationData});

  factory Data.fromJson(Map<String, dynamic> json) {
    List notification = json['notificationData'];
    return Data(
      count: json['count'],
      notificationData : notification.map((v) =>  NotificationData.fromJson(v)).toList()
    );
  }
}

class NotificationData {
  String? id;
  String? title;
  String? description;
  String? createdAt;

  NotificationData({this.id, this.title, this.description, this.createdAt});

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id : json['_id'],
      title : json['title'],
      description : json['description'],
      createdAt : json['createdAt'].toString(),
    );
  }
}
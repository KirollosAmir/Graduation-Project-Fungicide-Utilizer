// class Nccotification {
//   String id;
//   DateTime date;
//   String description;
//   bool status;
// }

class Notification {
  String id;
  String date;
  String message;
  String seen;

  Notification({this.id, this.date, this.message, this.seen});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    message = json['message'];
    seen = json['seen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['message'] = this.message;
    data['seen'] = this.seen;
    return data;
  }
}

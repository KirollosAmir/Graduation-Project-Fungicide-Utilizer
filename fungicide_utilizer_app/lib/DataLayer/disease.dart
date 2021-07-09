import 'treatment.dart';

class Disease {
  String id;
  String name;
  String severity;
  String symptoms;
  List<Treatment> treatments = [];

  Disease({this.id, this.name, this.severity, this.symptoms, this.treatments});

  Disease.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    severity = json['severity'];
    symptoms = json['symptoms'];
    if (json['treatments'] != null) {
      treatments = new List<Treatment>();
      json['treatments'].forEach((v) {
        treatments.add(new Treatment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['severity'] = this.severity;
    data['symptoms'] = this.symptoms;
    if (this.treatments != null) {
      data['treatments'] = this.treatments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

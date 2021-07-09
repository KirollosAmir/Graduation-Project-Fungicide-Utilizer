import 'disease.dart';

class Crop {
  String id;
  String name;
  String duration;
  List<Disease> diseases;

  Crop({this.id, this.name, this.duration, this.diseases});

  Crop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    if (json['diseases'] != null) {
      diseases = new List<Disease>();
      json['diseases'].forEach((v) {
        diseases.add(new Disease.fromJson(v));
      });
    }
  }
}

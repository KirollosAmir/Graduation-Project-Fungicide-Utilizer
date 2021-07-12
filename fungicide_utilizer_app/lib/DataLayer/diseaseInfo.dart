class DiseaseInfo {
  String id;
  String name;

  DiseaseInfo({this.id, this.name});

  DiseaseInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

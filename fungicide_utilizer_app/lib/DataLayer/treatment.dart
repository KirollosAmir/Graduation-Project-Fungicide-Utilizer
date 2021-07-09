class Treatment {
  String id;
  String name;
  String description;
  String dose;

  Treatment({this.id, this.name, this.description, this.dose});

  Treatment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    dose = json['dose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['dose'] = this.dose;
    return data;
  }
}

import 'dart:ffi';
import 'package:fungicide_utilizer/DataLayer/crop.dart';
import 'package:fungicide_utilizer/DataLayer/status.dart';

class LandModel {
  String id;
  String title;
  String crop;
  String postalCode;
  List<History> history;

  LandModel({this.id, this.title, this.crop, this.postalCode, this.history});

  LandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    crop = json['crop'];
    postalCode = json['postalCode'];
    if (json['history'] != null) {
      history = new List<History>();
      json['history'].forEach((v) {
        history.add(new History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['crop'] = this.crop;
    data['postalCode'] = this.postalCode;
    if (this.history != null) {
      data['history'] = this.history.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  String id;
  String entryDate;
  String maxTemp;
  String minTemp;
  String humidity;
  String windSpeed;

  History(
      {this.id,
      this.entryDate,
      this.maxTemp,
      this.minTemp,
      this.humidity,
      this.windSpeed});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entryDate = json['entryDate'];
    maxTemp = json['maxTemp'];
    minTemp = json['minTemp'];
    humidity = json['humidity'];
    windSpeed = json['windSpeed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['entryDate'] = this.entryDate;
    data['maxTemp'] = this.maxTemp;
    data['minTemp'] = this.minTemp;
    data['humidity'] = this.humidity;
    data['windSpeed'] = this.windSpeed;
    return data;
  }
}

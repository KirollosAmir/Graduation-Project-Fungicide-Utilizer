import 'package:flutter/material.dart';
import 'land_status.dart';

class Land {
  int id;
  String title;
  String crop;
  List<Land_Status> history = [
    /*Land_Status(
        id: '1',
        date: '22/12/2020',
        maxTemp: '20',
        minTemp: '5',
        humidity: '30',
        windSpeed: '15',
        windDirection: '60',
        rain: '0',
        moisture: '10')*/
  ];
  Land({@required this.title, @required this.crop});
}

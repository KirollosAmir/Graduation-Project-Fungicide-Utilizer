import 'dart:ffi';

import 'package:flutter/material.dart';

class Land_Status {
  final int id;
  final String date;
  final Float maxTemp;
  final Float minTemp;
  final Float humidity;
  final Float windSpeed;
  final Float windDirection;
  final Float dayLight;
  final Float rain;
  final Float moisture;
  Land_Status(
      {@required this.id,
      @required this.date,
      @required this.maxTemp,
      @required this.minTemp,
      @required this.humidity,
      @required this.windSpeed,
      @required this.windDirection,
      @required this.rain,
      @required this.moisture,
      @required this.dayLight});
}

import 'package:flutter/material.dart';
import 'land.dart';

class User {
  int id;
  String name;
  String mobile;
  String email;
  String password;
  List<Land> my_lands = [];
  User(
      {@required this.name,
      @required this.mobile,
      @required this.email,
      @required this.password});
}

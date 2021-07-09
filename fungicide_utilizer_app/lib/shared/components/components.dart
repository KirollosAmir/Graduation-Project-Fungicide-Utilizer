import 'package:flutter/material.dart';

Widget defaultButton({
  double width  = double.infinity,
  Color background = Colors.blue ,
  @required Function function ,
  bool isUppercase = true ,
  double radius = 10.0 ,
  @required String text ,
}) => Container(
  width: width,


  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUppercase ? text.toUpperCase() : text  ,
      style: TextStyle(
          color: Colors.white
      ),
    ) ,
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,

  ),
);
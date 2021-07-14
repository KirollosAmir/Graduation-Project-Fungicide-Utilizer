import 'package:flutter/material.dart';

class NetWorkError extends StatefulWidget {
  @override
  _NetWorkErrorState createState() => _NetWorkErrorState();
}

class _NetWorkErrorState extends State<NetWorkError> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("NetWork Error "),
        ],
      ),
    );
  }
}

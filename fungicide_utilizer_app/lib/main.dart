//import 'dart:io';
import 'package:flutter/material.dart';
//import 'app.dart';
import 'myapp.dart';
//import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  // try {
  //   final result = await InternetAddress.lookup('example.com');
  //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //     print('connected');
  //     runApp(MyApp());
  //   }
  // } on SocketException catch (_) {
  //   print('not connected');
  //   runApp(MyyApp());
  // }
}

import 'package:flutter/material.dart';
import 'UI/Screens/welcome_page.dart';
import 'UI/Widgets/farmer_drawer.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fungicides Utilizer',
      theme: new ThemeData(primarySwatch: Colors.green),
      home: FarmerDrawer(),
    );
  }
}

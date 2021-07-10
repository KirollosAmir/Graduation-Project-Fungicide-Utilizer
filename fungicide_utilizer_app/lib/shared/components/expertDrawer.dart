import 'package:flutter/material.dart';
import 'package:fungicide_utilizer_app/modules/home/myHomeScreen.dart';
import 'package:fungicide_utilizer_app/modules/users/Expert/crops.dart';
import 'package:fungicide_utilizer_app/modules/users/Expert/diseases.dart';
import 'package:fungicide_utilizer_app/modules/users/Expert/expertHome.dart';
import 'package:fungicide_utilizer_app/modules/users/Expert/fungicides.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
Widget ExpertDrawer(context) {
  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        height: 100.0,
        child: DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      Card(
        child: ListTile(
          title: Text('Home'),
          trailing: Icon(Icons.home),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => ExpertHome()));
          },
        ),
      ),
      //Notifications
      Card(
        child: ListTile(
          title: Text('Crops'),
          trailing: Icon(Icons.notifications),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => Crops()));
          },
        ),
      ),
      //My Lands
      Card(
        child: ListTile(
          title: Text('Diseases'),
          trailing: Icon(Icons.landscape),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Diseases()));
          },
        ),
      ),
      //Crop Checker
      Card(
        child: ListTile(
          title: Text('Fungicides'),
          trailing: Icon(Icons.scanner),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Fungicides()));
          },
        ),
      ),

      Card(
        child: ListTile(
          title: Text('All Crops'),
          trailing: Icon(Icons.create),
          onTap: () {
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //     builder: (BuildContext context) => CropsPage()));
          },
        ),
      ),

      //Profile
      // Card(
      //   child: ListTile(
      //     title: Text('Profile Page'),
      //     trailing: Icon(Icons.person),
      //     onTap: () {
      //       // Navigator.of(context).push(MaterialPageRoute(
      //       //     builder: (BuildContext context) => Profile()));
      //     },
      //   ),
      // ),

      Card(
        child: ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text("Logout"),
          onTap: () async {
            // SharedPreferences prefs = await SharedPreferences.getInstance();
            // prefs?.clear();
            final prefs = await SharedPreferences.getInstance();
            prefs.remove('ID');
            prefs.remove('isLoggedIn');
            prefs.remove('Type');
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => WelcomePage()));
            print("you loged out $prefs");
          },
        ),
      ),
    ],
  ));
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
Widget FarmerDrawer(context) {
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
            Navigator.pushNamed(context, '/FarmerHome');
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //     builder: (BuildContext context) => FarmerHome()));
          },
        ),
      ),
      //Notifications
      Card(
        child: ListTile(
          title: Text('Notifications'),
          trailing: Icon(Icons.notifications),
          onTap: () {
            Navigator.pushNamed(context, '/FarmerNotifications');
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //     builder: (BuildContext context) => Notifcations()));
          },
        ),
      ),
      //My Lands
      Card(
        child: ListTile(
          title: Text('My Lands'),
          trailing: Icon(Icons.landscape),
          onTap: () {
            Navigator.pushNamed(context, '/FarmerLands');
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //     builder: (BuildContext context) => MyLandsPage()));
          },
        ),
      ),
      //Crop Checker
      Card(
        child: ListTile(
          title: Text('Crop Checker'),
          trailing: Icon(Icons.scanner),
          onTap: () {
            Navigator.pushNamed(context, '/FarmerCropChecker');
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //     builder: (BuildContext context) => CropChecker()));
          },
        ),
      ),

      Card(
        child: ListTile(
          title: Text('All Crops'),
          trailing: Icon(Icons.create),
          onTap: () {
            Navigator.pushNamed(context, '/AllCrops');
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //     builder: (BuildContext context) => CropsPage()));
          },
        ),
      ),

      Card(
        child: ListTile(
          title: Text('Fungicide Calculator'),
          trailing: Icon(Icons.calculate),
          onTap: () {
            Navigator.pushNamed(context, '/FungicideCalculator');
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (BuildContext context) => Profile()));
          },
        ),
      ),

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
            Navigator.pushNamed(context, '/Welcome');
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //     builder: (BuildContext context) => WelcomePage()));
            print("you loged out $prefs");
          },
        ),
      ),
    ],
  ));
}

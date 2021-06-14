import 'package:flutter/material.dart';
import 'package:fungicide_utilizer/BloC/farmerDrawer/farmer_Drawer_bloc.dart';
import 'package:fungicide_utilizer/UI/Screens/Crop_checker.dart';
import 'package:fungicide_utilizer/UI/Screens/home.dart';
import 'package:fungicide_utilizer/UI/Screens/mylands.dart';
import 'package:fungicide_utilizer/UI/Screens/Notifications.dart';

class FarmerDrawer extends StatefulWidget {
  @override
  _FarmerDrawerState createState() => _FarmerDrawerState();
}

class _FarmerDrawerState extends State<FarmerDrawer> {
  String title;
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // UserAccountsDrawerHeader(
            //     accountName: Text("Admin"),
            //     currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
            //     accountEmail: Text("12345@gmail.com")),
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
            //HOME
            Card(
              child: ListTile(
                title: Text('Home'),
                trailing: Icon(Icons.home),
                onTap: () {
                  title = 'News';
                  Navigator.of(context).pop();
                  bloc.updateNavigation("Home");
                },
              ),
            ),
            //Notifications
            Card(
              child: ListTile(
                title: Text('Notifications'),
                trailing: Icon(Icons.notifications),
                onTap: () {
                  title = 'Notifications';
                  Navigator.of(context).pop();
                  bloc.updateNavigation("Notifications");
                },
              ),
            ),
            //My Lands
            Card(
              child: ListTile(
                title: Text('My Lands'),
                trailing: Icon(Icons.landscape),
                onTap: () {
                  title = 'My Lands';
                  Navigator.of(context).pop();
                  bloc.updateNavigation("Lands");
                },
              ),
            ),
            //Crop Checker
            Card(
              child: ListTile(
                title: Text('Crop Checker'),
                trailing: Icon(Icons.scanner),
                onTap: () {
                  title = 'Crop Checker';
                  Navigator.of(context).pop();
                  bloc.updateNavigation("CropCheck");
                },
              ),
            ),
            //Profile
            Card(
              child: ListTile(
                title: Text('Profile Page'),
                trailing: Icon(Icons.person),
                onTap: () {
                  title = 'Profile';
                  //context.bloc<AppdrawerBloc>().add(SamplePageEvent());
                },
              ),
            ),

            Card(
              child: ListTile(
                title: Text('Settings'),
                trailing: Icon(Icons.settings),
                onTap: () {
                  title = 'Settings';
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: bloc.getNavigation,
        initialData: bloc.navigationProvider.currentNavigation,
        builder: (context, snapshot) {
          if (bloc.navigationProvider.currentNavigation == "Home") {
            return Home();
          } else if (bloc.navigationProvider.currentNavigation ==
              "Notifications") {
            return Notifications();
          } else if (bloc.navigationProvider.currentNavigation == "Lands") {
            return MyLandsPage();
          } else if (bloc.navigationProvider.currentNavigation == "CropCheck") {
            return Crop();
          } else if (bloc.navigationProvider.currentNavigation ==
              "cropChecker") {
            return Notifications();
          } else
            return Container();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/mylands.dart';
import 'screens/add_land.dart';
import 'screens/land.dart';
import 'screens/observation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Fungicides Utilizer',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        //initialRoute: '/land',
        routes: {
          // When navigating to the "/" route, build the HomePage widget.
          '/': (context) => WelcomePage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/mylands': (context) => MyLandsPage(),
          '/addland': (context) => AddLandPage(),
          '/land': (context) => LandPage(),
          '/observation': (context) => ObservationPage(),
        });
  }
}

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('images/logo.png'),
              ),
              SizedBox(
                height: 80,
              ),
              ButtonTheme(
                minWidth: 250.0,
                height: 50.0,
                child: OutlineButton(
                  disabledBorderColor: Colors.blue,
                  child: Text('Login',
                      style: TextStyle(color: Colors.blue, fontSize: 18.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 250.0,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text('Register',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}

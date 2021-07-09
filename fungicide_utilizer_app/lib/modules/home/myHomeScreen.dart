import 'package:flutter/material.dart';
import 'package:fungicide_utilizer_app/modules/Register%20/Register.dart';
import 'package:fungicide_utilizer_app/modules/login/expertlogin.dart';
import 'package:fungicide_utilizer_app/modules/login/farmerlogin.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        // drawer: FarmerDrawer(context),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('images/IMG_2466.PNG'),
              ),
              SizedBox(
                height: 80,
              ),
              ButtonTheme(
                minWidth: 250.0,
                height: 50.0,
                child: OutlinedButton(
                  child: Text('Farmer',
                      style: TextStyle(color: Colors.green, fontSize: 18.0)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            FarmerLoginScreen()));
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 250.0,
                height: 50.0,
                child: OutlinedButton(
                  child: Text('Expert',
                      style: TextStyle(color: Colors.green, fontSize: 18.0)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ExpertLoginScreen()));
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 250.0,
                height: 50.0,
                child: ElevatedButton(
                  child: Text('Farmer Register',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => RegisterPage()));
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

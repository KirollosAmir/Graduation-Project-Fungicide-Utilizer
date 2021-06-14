import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
                  child: Text('Login',
                      style: TextStyle(color: Colors.green, fontSize: 18.0)),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 250.0,
                height: 50.0,
                child: ElevatedButton(
                  child: Text('Register',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  onPressed: () {},
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

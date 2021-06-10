import 'package:flutter/material.dart';

class MyLandsPage extends StatefulWidget {
  MyLandsPage({Key key}) : super(key: key);
  @override
  _MyLandsPageState createState() => new _MyLandsPageState();
}

class _MyLandsPageState extends State<MyLandsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('My Lands'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addland');
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 100.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
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
                  title: Text('My Lands'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/mylands');
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Add Observation'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/observation');
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
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Land 1'),
                subtitle: Text('wheat'),
                onTap: () {
                  Navigator.pushNamed(context, '/land');
                },
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Land 2'),
                subtitle: Text('soybeans'),
                onTap: () {
                  Navigator.pushNamed(context, '/land');
                },
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

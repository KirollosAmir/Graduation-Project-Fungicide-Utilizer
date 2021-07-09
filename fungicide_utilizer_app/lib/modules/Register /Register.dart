import 'package:flutter/material.dart';
//import 'package:flutter_signin_button/flutter_signin_button.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameField = TextEditingController();
  TextEditingController _mobileField = TextEditingController();
  // TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('Register'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _nameField,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: 'Fullname',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: _mobileField,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Mobile',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    // TextFormField(
                    //   controller: _emailField,
                    //   keyboardType: TextInputType.emailAddress,
                    //   decoration: const InputDecoration(
                    //     hintText: 'Email',
                    //   ),
                    //   validator: (value) {
                    //     if (value.isEmpty) {
                    //       return 'Please enter some text';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    TextFormField(
                      controller: _passwordField,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: MaterialButton(
                        color: Colors.green,
                        onPressed: () async {
                          // bool shouldNavigate = await register(
                          //     _nameField.text,
                          //     _dobField.text,
                          //     _facultyField.text,
                          //     _uniIDField.text,
                          //     _mobileField.text,
                          //     _emailField.text,
                          //     _passwordField.text);
                          // print(shouldNavigate);
                          // if (shouldNavigate) {}
                        },
                        child: Text("Register",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

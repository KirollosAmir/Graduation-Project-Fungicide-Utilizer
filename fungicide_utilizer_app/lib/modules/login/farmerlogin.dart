import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/authentication/authentication_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/authentication/authentication_event.dart';
import 'package:fungicide_utilizer_app/BloC/authentication/authentication_state.dart';
import 'package:fungicide_utilizer_app/modules/users/farmer/news.dart';

class FarmerLoginScreen extends StatefulWidget {
  @override
  _FarmerLoginScreenState createState() => _FarmerLoginScreenState();
}

class _FarmerLoginScreenState extends State<FarmerLoginScreen> {
  TextEditingController phonenumber = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  AuthenticationBloc authbloc;

  void initState() {
    authbloc = BlocProvider.of<AuthenticationBloc>(context);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final msg = Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is LoginErrorState) {
            return Text(state.message);
          } else if (state is LoginLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );

    // final header = Padding( padding:  EdgeInsets.all(10),
    //            child : (
    //                 //alignment: Alignment.center,
    //                 padding: EdgeInsets.all(10),
    //                 child: Text(
    //                   'Enjoy our farming system',
    //                   style: TextStyle(
    //                       color: Colors.green,
    //                       fontWeight: FontWeight.w500,
    //                       fontSize: 30),
    //                 ));

    final logo = Center(
      child: Image(
        image: AssetImage(
          'images/IMG_2466.PNG',
        ),
      ),
    );

    final mobile = Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: phonenumber,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your phone number',
        ),
      ),
    );
    final password = Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextField(
        controller: passwordField,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your Password',
        ),
      ),
    );
    final loginButton = Container(
        height: 50,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: RaisedButton(
          textColor: Colors.white,
          color: Colors.green,
          child: Text('Login'),
          onPressed: () {
            authbloc.add(LoginButttonPressed(
                mobile: phonenumber.text, password: passwordField.text));
          },
          // child:
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text("Enjoy our farming system"),
        //title: Text("Login Screen App"),
        backgroundColor: Colors.green,
      ),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is FarmerLoginSuccessState) {
            // Navigator.pushNamed(context,
            //     routeName);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => FarmerHome()));
          }
        },
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            children: <Widget>[
              mobile,
              password,
              loginButton,
              msg,
              SizedBox(
                height: 40.0,
              ),
              logo,
            ],
          ),
        ),
      ),
    );

    //   return Scaffold(
    //       appBar: AppBar(
    //         title: Text('Login Screen App'),
    //       ),
    //       body: Padding(
    //           padding: EdgeInsets.all(10),
    //           child: ListView(
    //             children: <Widget>[
    //               Container(
    //                   alignment: Alignment.center,
    //                   padding: EdgeInsets.all(10),
    //                   child: Text(
    //                     'Enjoy our farming system',
    //                     style: TextStyle(
    //                         color: Colors.green,
    //                         fontWeight: FontWeight.w500,
    //                         fontSize: 30),
    //                   )),
    //               Container(
    //                 padding: EdgeInsets.all(10),
    //                 child: TextField(
    //                   decoration: InputDecoration(
    //                     border: OutlineInputBorder(),
    //                     labelText: 'User phone number',
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
    //                 child: TextField(
    //                   obscureText: true,
    //                   decoration: InputDecoration(
    //                     border: OutlineInputBorder(),
    //                     labelText: 'Password',
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                   height: 50,
    //                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    //                   child: RaisedButton(
    //                     textColor: Colors.white,
    //                     color: Colors.green,
    //                     child: Text('Login'),
    //                     onPressed: () {
    //                       authbloc.add(LoginButttonPressed(
    //                           mobile: _phonenumber.text,
    //                           password: _passwordField.text));
    //                     },
    //                     // child:
    //                   )),
    //               Image(
    //                 image: AssetImage('images/IMG_2466.PNG'),
    //               ),
    //               SizedBox(
    //                 height: 80,
    //               ),
    //             ],
    //           )));
  }
}

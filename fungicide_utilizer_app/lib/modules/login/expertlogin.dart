import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/ExpertAuth/expert_auth_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/ExpertAuth/expert_auth_event.dart';
import 'package:fungicide_utilizer_app/BloC/ExpertAuth/expert_auth_state.dart';
import 'package:fungicide_utilizer_app/modules/users/Expert/expertHome.dart';

class ExpertLoginScreen extends StatefulWidget {
  @override
  _ExpertLoginScreenState createState() => _ExpertLoginScreenState();
}

class _ExpertLoginScreenState extends State<ExpertLoginScreen> {
  TextEditingController phonenumber = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  ExpertAuthenticationBloc authbloc;

  void initState() {
    authbloc = BlocProvider.of<ExpertAuthenticationBloc>(context);

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
      child: BlocBuilder<ExpertAuthenticationBloc, ExpertAuthenticationState>(
        builder: (context, state) {
          if (state is ELoginErrorState) {
            return Text(state.message);
          } else if (state is ELoginLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );

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
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
      body: BlocListener<ExpertAuthenticationBloc, ExpertAuthenticationState>(
        listener: (context, state) {
          if (state is ExpertLoginSuccessState) {
            // Navigator.pushNamed(context,
            //     routeName);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ExpertHome()));
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
  }
}

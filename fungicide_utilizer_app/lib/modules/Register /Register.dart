import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/register/registerBloc.dart';
import 'package:fungicide_utilizer_app/BloC/register/registerEvent.dart';
import 'package:fungicide_utilizer_app/BloC/register/registerState.dart';
import 'package:fungicide_utilizer_app/modules/users/farmer/news.dart';

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
  RegisterBloc bloc;
  //final _formKey = GlobalKey<FormState>();
  void initState() {
    bloc = BlocProvider.of<RegisterBloc>(context);

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
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterErrorState) {
            return Text(state.message);
          } else if (state is RegisterLoadingState) {
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
    final name = Container(
      child: TextFormField(
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
    );
    final password = Container(
      child: TextFormField(
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
    );
    final mobile = Container(
      child: TextFormField(
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
    );
    final regButton = Container(
      child: MaterialButton(
        color: Colors.green,
        onPressed: () async {
          bloc.add(RegisterButttonPressed(
              name: _nameField.text,
              mobile: _mobileField.text,
              password: _passwordField.text));
        },
        child: Text("Register", style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Enjoy our farming system"),
        //title: Text("Login Screen App"),
        backgroundColor: Colors.green,
      ),
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
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
              name,
              mobile,
              password,
              regButton,
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

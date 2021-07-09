import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/authentication/authentication_bloc.dart';
import 'package:fungicide_utilizer_app/repository/authentication_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BloC/authentication/authentication_state.dart';
import 'BloC/land/landBloc.dart';
import 'BloC/land/landState.dart';
import 'modules/home/myHomeScreen.dart';
import 'modules/users/farmer/news.dart';
import 'repository/mylands_repo.dart';

class MyApp extends StatelessWidget {
  Future<bool> getpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    return status;
  }

  @override
  Widget build(BuildContext context) {
    var status = getpref();
    //authBloc.restoreSession();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {
              return AuthenticationBloc(
                  LoginInitState(), AuthenticationRepos());
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return LandBloc(LandInitiallState(), MyLandsRepos());
            },
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fungicides Utilizer',
            theme: new ThemeData(primarySwatch: Colors.green),
            // ignore: unrelated_type_equality_checks
            home: status == false ? WelcomePage() : FarmerHome()));
  }
}

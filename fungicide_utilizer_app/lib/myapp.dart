import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/ExpertAuth/expert_auth_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/ExpertAuth/expert_auth_state.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/fungicides/fungicides_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/fungicides/fungicides_state.dart';
import 'package:fungicide_utilizer_app/BloC/news/newsBloc.dart';
import 'package:fungicide_utilizer_app/BloC/news/newsState.dart';
import 'package:fungicide_utilizer_app/modules/users/Expert/expertHome.dart';
import 'package:fungicide_utilizer_app/repository/crops_repo.dart';
import 'package:fungicide_utilizer_app/repository/disease_repo.dart';
import 'package:fungicide_utilizer_app/repository/fungicide_repo.dart';
import 'package:fungicide_utilizer_app/repository/news_repo.dart';
import 'package:fungicide_utilizer_app/repository/notifications_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BloC/authentication/authentication_bloc.dart';
import 'BloC/authentication/authentication_state.dart';
import 'BloC/crops_bloc/crops_states.dart';
import 'BloC/diseases/disaeses_bloc.dart';
import 'BloC/diseases/diseases_state.dart';
import 'BloC/land/landBloc.dart';
import 'BloC/land/landState.dart';
import 'BloC/notification/notificationState.dart';
import 'BloC/notification/notificatioBloc.dart';
import 'BloC/register/registerBloc.dart';
import 'BloC/register/registerState.dart';
import 'modules/home/myHomeScreen.dart';
import 'modules/users/Expert/crops.dart';
import 'modules/users/Expert/diseases.dart';
import 'modules/users/Expert/fungicides.dart';
import 'modules/users/farmer/allcrops.dart';
import 'modules/users/farmer/cropchecker.dart';
import 'modules/users/farmer/mylands.dart';
import 'modules/users/farmer/news.dart';
import 'modules/users/farmer/notifications.dart';
import 'repository/authentication_repo.dart';
import 'repository/expertAuth_repo.dart';
import 'repository/mylands_repo.dart';

class MyApp extends StatefulWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _status = false;
  // ignore: avoid_init_to_null
  String _id = null;
  String _type = "";

  @override
  void initState() {
    super.initState();
    _loadPref();
  }

  void _loadPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _status = (prefs.getBool('isLoggedIn') ?? false);
      //_id = (prefs.getString('id') ?? null);
      _id = prefs.getString('ID');
      _type = (prefs.getString('Type'));
      print("status is $_status id is $_id type is $_type");
    });
  }

  Widget testUser(String type) {
    if (type == 'Expert') {
      print(type);
      return ExpertHome();
    } else if (type == "farmer") {
      print(type);
      return FarmerHome();
    } else
      return WelcomePage();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          //farmer auth bloc
          BlocProvider(
            create: (BuildContext context) {
              return AuthenticationBloc(
                  LoginInitState(), AuthenticationRepos());
            },
          ),
          //farmer register bloc
          BlocProvider(
            create: (BuildContext context) {
              return RegisterBloc(RegisterInitState(), AuthenticationRepos());
            },
          ),
          // farmer lands bloc
          BlocProvider(
            create: (BuildContext context) {
              return LandBloc(LandInitiallState(), MyLandsRepos());
            },
          ),
          // expert auth bloc
          BlocProvider(create: (BuildContext context) {
            return ExpertAuthenticationBloc(
                ELoginInitState(), ExpertAuthenticationRepos());
          }),
          //farmer notification bloc
          BlocProvider(create: (BuildContext context) {
            return NotificationBloc(
                NotificationInitialState(), NotificationRepos());
          }),
          // farmer news bloc
          BlocProvider(create: (BuildContext context) {
            return NewsBloc(NewsInitialState(), NewsRepos());
          }),
          // crops bloc
          BlocProvider(create: (BuildContext context) {
            return CropsBloc(InitialState(), CropsRepository());
          }),
          // diseases bloc
          BlocProvider(create: (BuildContext context) {
            return DiseasesBloc(DiseasesInitialState(), DiseaseRepository());
          }),
          // fungicides bloc
          BlocProvider(create: (BuildContext context) {
            return FungicidesBloc(
                FungicidesInitialState(), FungicidesRepository());
          }),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fungicides Utilizer',
            theme: new ThemeData(primarySwatch: Colors.green),
            // home: _status == false ? WelcomePage() : testUser(_type),
            initialRoute: '/',
            routes: {
              // When navigating to the "/" route, build the HomePage widget.
              '/': (context) =>
                  _status == false ? WelcomePage() : testUser(_type),
              '/FarmerLands': (context) => MyLandsPage(),
              '/FarmerNotifications': (context) => Notifcations(),
              '/AllCrops': (context) => CropsPage(),
              '/FarmerCropChecker': (context) => CropChecker(),
              '/FarmerHome': (context) => FarmerHome(),
              '/ExpertHome': (context) => ExpertHome(),
              '/Crops': (context) => Crops(),
              '/Diseases': (context) => Diseases(),
              '/Fungicides': (context) => Fungicides(),
              '/Welcome': (context) => WelcomePage(),
            }));
  }
}

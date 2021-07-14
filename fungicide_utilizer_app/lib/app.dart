import 'package:flutter/material.dart';
import 'shared/components/netwrokerror.dart';

class MyyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //authBloc.restoreSession();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fungicides Utilizer',
        theme: new ThemeData(primarySwatch: Colors.green),
        // ignore: unrelated_type_equality_checks
        home: NetWorkError());
  }
}

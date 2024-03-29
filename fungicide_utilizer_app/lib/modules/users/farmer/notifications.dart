import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'package:fungicide_utilizer_app/BloC/notification/notificatioBloc.dart';
import 'package:fungicide_utilizer_app/BloC/notification/notificatioEvent.dart';
import 'package:fungicide_utilizer_app/BloC/notification/notificationState.dart';
import 'package:fungicide_utilizer_app/shared/components/drawer.dart';

class Notifcations extends StatefulWidget {
  _Notifcationsstate createState() => _Notifcationsstate();
}

// ignore: camel_case_types
class _Notifcationsstate extends State<Notifcations> {
  NotificationBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<NotificationBloc>(context);
    bloc.add(ViewNotificationsEvent());

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications ',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
        ),
        drawer: FarmerDrawer(context),
        body: Center(
          child: BlocBuilder<NotificationBloc, NotificationState>(
            // ignore: missing_return
            builder: (context, state) {
              if (state is NotificationInitialState) {
                return CircularProgressIndicator();
              } else if (state is ConnectionErrorState) {
                return Stack(
                  children: [
                    Text(
                        'Connection lost! Please reconnect to internet and refresh',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text('Refresh',
                              style: TextStyle(color: Colors.white)),
                        ))
                  ],
                );
              } else if (state is NotificationLoadingState) {
                return CircularProgressIndicator();
              } else if (state is NotificationSuccessState) {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: h * .02),
                      child: Container(
                        height: h * .9,
                        child: ListView.builder(
                            itemCount: state.notifications.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: h * 0.001,
                                      left: w * .01,
                                      right: w * .01),
                                  child: Card(
                                    child: Container(
                                      height: h * 0.12,
                                      width: w * 0.914,
                                      decoration: BoxDecoration(
                                        color:
                                            state.notifications[index].seen ==
                                                    "1"
                                                ? Colors.green
                                                : Colors.blueGrey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          bloc.add(
                                              SeenNotificationButttonPressed(
                                                  state.notifications[index]
                                                      .id));
                                        },
                                        child: Center(
                                          child: ListTile(
                                            subtitle: Text(
                                              "'${state.notifications[index].date}'",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            title: Text(
                                              "'${state.notifications[index].message}'",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            }),
                      ),
                    )
                  ],
                );
              } else if (state is NotificationErrorState) {
                return Text(state.message);
              }
            },
          ),
        ));
  }
}

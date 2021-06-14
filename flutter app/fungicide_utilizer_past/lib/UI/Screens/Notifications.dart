import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifications extends StatefulWidget {
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: h * .02),
          child: Container(
            height: h * .9,
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.only(
                          bottom: h * 0.02, left: w * .01, right: w * .01),
                      child: Container(
                        height: h * 0.15,
                        width: w * 0.914,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.5),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ));
                }),
          ),
        )
      ],
    ));
  }
}

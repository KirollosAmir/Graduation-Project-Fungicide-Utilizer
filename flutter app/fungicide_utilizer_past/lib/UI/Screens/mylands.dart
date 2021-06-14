import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyLandsPage extends StatefulWidget {
  MyLandsPage_state createState() => MyLandsPage_state();
}

class MyLandsPage_state extends State<MyLandsPage> {
  var ListData = ['My land'];
  @override
  void initState() {
    // TODO: implement initState
    setState(() {});

    // TODO: implement initState
    super.initState();
  }

  Future<void> myAlert(h, w) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        ScreenUtil.init(context,
            designSize: Size(750, 1334), allowFontScaling: false);
        return AlertDialog(
          content: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: h * .01),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  autofocus: false,
                  onFieldSubmitted: (v) {},
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    enabled: true,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  onTap: () {},
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: h * .01),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  autofocus: false,
                  onFieldSubmitted: (v) {},
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    enabled: true,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  onTap: () {},
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: h * .01),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  autofocus: false,
                  onFieldSubmitted: (v) {},
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    enabled: true,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  onTap: () {},
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: h * .05),
                child: InkWell(
                  child: Container(
                    width: w * .3,
                    height: h * .07,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Addd',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      ListData.add('My land ');
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
            ],
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    // TODO: implement build
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: h * .1, left: w * .03, right: w * .03, bottom: h * .05),
              child: Container(
                height: h * .6,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListView.builder(
                    itemCount: ListData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: w * .01, right: w * .01, top: h * .02),
                        child: InkWell(
                          child: Container(
                            width: w,
                            height: h * 0.07,
                            alignment: Alignment.center,
                            child: Text('${ListData[index]} ${index + 1}'),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                          ),
                          onTap: () {
                            myAlert(h, w);
                          },
                        ),
                      );
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Land',
                  style: TextStyle(fontSize: 40.sp),
                ),
                Padding(
                    padding: EdgeInsets.only(left: w * .01),
                    child: InkWell(
                      child: Icon(
                        Icons.add_circle,
                        size: 30,
                      ),
                      onTap: () {
                        setState(() {
                          myAlert(h, w);
                        });
                      },
                    ))
              ],
            ),
          ],
        )
      ],
    ));
  }
}

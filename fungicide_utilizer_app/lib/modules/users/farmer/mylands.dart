import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/land/landBloc.dart';
import 'package:fungicide_utilizer_app/BloC/land/landEvent.dart';
import 'package:fungicide_utilizer_app/BloC/land/landState.dart';
import 'package:fungicide_utilizer_app/shared/components/drawer.dart';

class MyLandsPage extends StatefulWidget {
  _MyLandsPagestate createState() => _MyLandsPagestate();
}

class _MyLandsPagestate extends State<MyLandsPage> {
  PageController controller = PageController();
  var names = ['Status', 'History'],
      colors = [Colors.green.withOpacity(.5), Colors.white];
  // ignore: non_constant_identifier_names
  var ListData = ['My land '];
  bool checkPage = false;
  LandBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<LandBloc>(context);

    bloc.add(ViewLandsEvent());

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Widget FirstWidget(h, w) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: h * .05, left: w * .02, right: w * .02),
          child: Container(
            height: h * .2,
            width: w * .6,
            // child: Image.asset('images/man.png'),
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget SecWidget(h, w) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: h * .05, left: w * .02, right: w * .02),
        )
      ],
    );
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
                    labelText: 'Crop Name',
                    errorStyle: TextStyle(
                        fontSize: 14,
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
                    labelText: 'Station',
                    errorStyle: TextStyle(
                        fontSize: 14,
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
                    labelText: 'Weather',
                    errorStyle: TextStyle(
                        fontSize: 14,
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
                    labelText: 'Serial Number',
                    errorStyle: TextStyle(
                        fontSize: 14,
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
                  child: Row(
                    children: [
                      Container(
                        width: w * .3,
                        height: h * .08,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: InkWell(
                          child: Text('Save',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: w * .02),
                        child: Container(
                          width: w * .3,
                          height: h * .08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: InkWell(
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  )),
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
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Lands',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
        ),
        drawer: FarmerDrawer(context),
        //resizeToAvoidBottomPadding: false,
        body: Center(
          child: BlocBuilder<LandBloc, LandState>(
            // ignore: missing_return
            builder: (context, state) {
              if (state is LandInitiallState) {
                return CircularProgressIndicator();
              } else if (state is LandLoadingState) {
                return CircularProgressIndicator();
              } else if (state is SuccessState) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Container(
                            height: h * .6,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: ListView.builder(
                                itemCount: state.lands.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: InkWell(
                                      child: Card(
                                        child: ListTile(
                                          title: Text(
                                              '${state.lands[index].title}'),
                                          subtitle: Text(
                                              '${state.lands[index].crop}'),
                                        ),
                                      ),
                                      onTap: () {
                                        checkPage = true;
                                        bloc.add(
                                            ViewLandEvent(state.lands[index]));
                                      },
                                    ),
                                  );
                                }),
                          ),
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add Land',
                                style: TextStyle(fontSize: 40),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: w * .01),
                                  child: InkWell(
                                    child: Icon(
                                      Icons.add_circle,
                                      size: 30,
                                      color: Colors.green,
                                    ),
                                    onTap: () {},
                                  ))
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              myAlert(h, w);
                            });
                          },
                        ),
                      ],
                    )
                  ],
                );
              } else if (state is ViewLandSuccessState) {
                return Stack(
                  children: [
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            DefaultTabController(
                                length: 3, // length of tabs
                                initialIndex: 0,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Container(
                                        child: TabBar(
                                          labelColor: Colors.green,
                                          unselectedLabelColor: Colors.black,
                                          tabs: [
                                            Tab(text: 'Info'),
                                            Tab(text: 'Status'),
                                            Tab(text: 'History'),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          height: 600, //height of TabBarView
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      color: Colors.grey,
                                                      width: 0.5))),
                                          child: TabBarView(children: <Widget>[
                                            Container(
                                              child: Center(
                                                child: Text('Display Info',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            Container(
                                              child:
                                                  state.land.history.length == 0
                                                      ? Center(
                                                          child: Text(
                                                              'No data available',
                                                              style: TextStyle(
                                                                  fontSize: 22,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        )
                                                      : Column(children: [
                                                          Text('Last Status',
                                                              style: TextStyle(
                                                                  fontSize: 22,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          Text(
                                                              state
                                                                  .land
                                                                  .history
                                                                  .last
                                                                  .entryDate,
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                              )),
                                                          Container(
                                                            child: GridView.count(
                                                                shrinkWrap: true,
                                                                // Create a grid with 2 columns. If you change the scrollDirection to
                                                                // horizontal, this produces 2 rows.
                                                                crossAxisCount: 2,
                                                                // Generate 100 widgets that display their index in the List.
                                                                children: <Widget>[
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .all(
                                                                            10),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    width: 150,
                                                                    height: 150,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                            state.land.history.last.minTemp +
                                                                                " C",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 20.0,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          Text(
                                                                            "Min Temp",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14.0,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(width: 3),
                                                                        borderRadius: BorderRadius.all(
                                                                          Radius.circular(
                                                                              200),
                                                                        ),
                                                                        color: Colors.white),
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .all(
                                                                            10),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    width: 150,
                                                                    height: 100,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                            state.land.history.last.maxTemp +
                                                                                " C",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 20.0,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          Text(
                                                                            "Max Temp",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14.0,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(width: 3),
                                                                        borderRadius: BorderRadius.all(
                                                                          Radius.circular(
                                                                              200),
                                                                        ),
                                                                        color: Colors.white),
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .all(
                                                                            10),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    width: 150,
                                                                    height: 100,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                            state.land.history.last.humidity +
                                                                                " %",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 20.0,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          Text(
                                                                            "Humidity",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14.0,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(width: 3),
                                                                        borderRadius: BorderRadius.all(
                                                                          Radius.circular(
                                                                              200),
                                                                        ),
                                                                        color: Colors.white),
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .all(
                                                                            10),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    width: 150,
                                                                    height: 150,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                            state.land.history.last.windSpeed +
                                                                                " km/hr",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 20.0,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          Text(
                                                                            "wind speed",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14.0,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(width: 3),
                                                                        borderRadius: BorderRadius.all(
                                                                          Radius.circular(
                                                                              200),
                                                                        ),
                                                                        color: Colors.white),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ]),
                                            ),
                                            Container(
                                              child: Column(children: [
                                                Text('Display History',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ]),
                                            ),
                                          ]))
                                    ])),
                          ]),
                    ),
                  ],
                );
              }
              // ignore: unused_label
              child:
              Container();
            },
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fungicide_utilizer_app/BloC/diseases/disaeses_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/diseases/diseases_event.dart';
import 'package:fungicide_utilizer_app/BloC/diseases/diseases_state.dart';

import 'package:fungicide_utilizer_app/shared/components/expertDrawer.dart';

class Diseases extends StatefulWidget {
  @override
  _DiseasesState createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  TextEditingController diseasename = TextEditingController();
  TextEditingController severity = TextEditingController();
  TextEditingController symptoms = TextEditingController();
  TextEditingController dose = TextEditingController();
  PageController controller = PageController();
  // ignore: unused_field
  int _curr = 0;
  bool checkPage = false;
  DiseasesBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<DiseasesBloc>(context);

    bloc.add(ViewDiseasesEvent());

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
            'Diseases',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              onPressed: () {
                //bloc.add(AddCropsButtonEvent());
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
                              controller: diseasename,
                              decoration: const InputDecoration(
                                hintText: 'Disease Name.',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Disease name';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: h * .01),
                            child: TextFormField(
                              controller: severity,
                              decoration: const InputDecoration(
                                hintText: 'Severity.',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter a severity.';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: h * .01),
                            child: TextFormField(
                              controller: symptoms,
                              decoration: const InputDecoration(
                                hintText: 'Symptoms.',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter a symptoms.';
                                }
                                return null;
                              },
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: InkWell(
                                      child: Text('Save',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onTap: () {
                                        bloc.add(SaveDiseaseButttonPressed(
                                            diseasename: diseasename.text,
                                            severity: severity.text,
                                            symptoms: symptoms.text));
                                        setState(() {
                                          Navigator.pop(context);
                                          bloc.add(ViewDiseasesEvent());
                                          // bloc.add(ResetEvent());
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: InkWell(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            Navigator.pop(context);
                                            bloc.add(ViewDiseasesEvent());
                                            // bloc.add(
                                            //     ResetEvent());
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
              },
              child: Text("New Disease"),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
        ),
        drawer: ExpertDrawer(context),
        //resizeToAvoidBottomPadding: false,
        body: Center(
          child: BlocBuilder<DiseasesBloc, DiseasesStates>(
            // ignore: missing_return
            builder: (context, state) {
              if (state is DiseasesInitialState) {
                return CircularProgressIndicator();
              } else if (state is DiseasesLoadingState) {
                return CircularProgressIndicator();
              } else if (state is ViewDiseasesSuccess) {
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
                                itemCount: state.diseases.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: InkWell(
                                      child: Card(
                                        child: ListTile(
                                          title: Text(
                                              '${state.diseases[index].name}'),
                                          subtitle: Text(
                                              '${state.diseases[index].id}'),
                                          trailing: Wrap(
                                            spacing:
                                                12, // space between two icons
                                            children: <Widget>[
                                              Icon(Icons
                                                  .arrow_forward_ios), // icon-1
                                              //Icon(Icons.message), // icon-2
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        checkPage = true;
                                        // bloc.add(ViewCropEvent());
                                        bloc.add(ViewDiseaseEvent(
                                            state.diseases[index]));
                                      },
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }
              //else if (state is ViewDiseaseSuccess) {
              //   return Stack(
              //     children: [
              //       Column(
              //         children: [
              //           Container(
              //             child: Container(
              //               height: h * .6,
              //               decoration: BoxDecoration(
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(10)),
              //               ),
              //               child: ListView.builder(
              //                   itemCount: state.disease.treatments.length,
              //                   itemBuilder: (BuildContext context, int index) {
              //                     return Container(
              //                       child: InkWell(
              //                         child: Card(
              //                           child: ListTile(
              //                             title: Text(
              //                                 '${state.disease.treatments[index].name}'),
              //                             subtitle: Text(
              //                                 '${state.disease.treatments[index].description}'),
              //                           ),
              //                         ),
              //                         onTap: () {
              //                           checkPage = true;
              //                         },
              //                       ),
              //                     );
              //                   }),
              //             ),
              //           ),
              //         ],
              //       )
              //     ],
              //   );
              // }
              else if (state is ViewDiseaseSuccess) {
                return Stack(
                  children: [
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            DefaultTabController(
                                length: 2, // length of tabs
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
                                            Tab(text: 'Treatments'),
                                            // Tab(text: 'Add Treatment'),
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
                                                child: state.disease.treatments
                                                            .length ==
                                                        0
                                                    ? Center(
                                                        child: Text(
                                                            'No data available',
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      )
                                                    : Center(
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                            Text(
                                                                'Name: ' +
                                                                    state
                                                                        .disease
                                                                        .name,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        22,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            Text(
                                                                'Severity: ' +
                                                                    state
                                                                        .disease
                                                                        .severity,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        22,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            Text(
                                                                'Symptoms: ' +
                                                                    state
                                                                        .disease
                                                                        .symptoms,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        22,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ]))),
                                            Container(
                                              child:
                                                  state.disease.treatments
                                                              .length ==
                                                          0
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
                                                          Stack(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          h * .5,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(10)),
                                                                      ),
                                                                      child: ListView.builder(
                                                                          itemCount: state.disease.treatments.length,
                                                                          itemBuilder: (BuildContext context, int index) {
                                                                            return Container(
                                                                              child: InkWell(
                                                                                child: Card(
                                                                                  child: ListTile(
                                                                                    title: Text('${state.disease.treatments[index].name}'),
                                                                                    subtitle: Text('${state.disease.treatments[index].description}'),
                                                                                  ),
                                                                                ),
                                                                                onTap: () {
                                                                                  checkPage = true;
                                                                                },
                                                                              ),
                                                                            );
                                                                          }),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          'Add Treatment',
                                                                          style:
                                                                              TextStyle(fontSize: 40),
                                                                        ),
                                                                        Padding(
                                                                            padding:
                                                                                EdgeInsets.only(left: w * .01),
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
                                                                      bloc.add(
                                                                          ViewNotFungicide(
                                                                              state.disease));
                                                                    },
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ]),
                                            ),
                                          ]))
                                    ])),
                          ]),
                    ),
                  ],
                );
              } else if (state is ViewNotFungicideSuccess) {
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
                                itemCount: state.fungicides.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Container(
                                        child: InkWell(
                                          child: Card(
                                            child: ListTile(
                                              title: Text(
                                                  '${state.fungicides[index].name}'),
                                              subtitle: Text(
                                                  '${state.fungicides[index].id}'),
                                              // subtitle: Text(
                                              //     '${state.treatments[index].id}'),
                                            ),
                                          ),
                                          onTap: () {
                                            // checkPage = true;
                                            // bloc.add(ViewCropEvent());
                                            // bloc.add(ViewFungicideEvent(
                                            //     state.treatments[index]));
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            bottom: 3.0, end: 3.0),
                                        child: IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              return showDialog<void>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Add This Treatment For Disease'),
                                                    content: TextField(
                                                      controller: dose,
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              "Please enter fungicide dose"),
                                                    ),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text("Save"),
                                                        onPressed: () {
                                                          bloc.add(
                                                              AddFungicideDiseaseEvent(
                                                                  state.disease
                                                                      .id,
                                                                  state
                                                                      .fungicides[
                                                                          index]
                                                                      .id,
                                                                  dose.text));
                                                          bloc.add(
                                                              ViewDiseasesEvent());
                                                          // bloc.add(
                                                          //     DeleteLandButtonPressed(
                                                          //         state
                                                          //             .lands[
                                                          //                 index]
                                                          //             .id));
                                                          Navigator.of(context)
                                                              .pop();
                                                          // bloc.add(
                                                          //     ViewLandsEvent());
                                                        },
                                                      ),
                                                      FlatButton(
                                                        child: Text("Cancel"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }),
                                      )
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }
            },
          ),
        ));
  }
}

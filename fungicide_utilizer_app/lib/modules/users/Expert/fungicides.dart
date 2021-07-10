import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fungicide_utilizer_app/BloC/fungicides/fungicides_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/fungicides/fungicides_event.dart';
import 'package:fungicide_utilizer_app/BloC/fungicides/fungicides_state.dart';
import 'package:fungicide_utilizer_app/shared/components/expertDrawer.dart';

class Fungicides extends StatefulWidget {
  @override
  _FungicidesState createState() => _FungicidesState();
}

class _FungicidesState extends State<Fungicides> {
  TextEditingController diseasename = TextEditingController();
  TextEditingController severity = TextEditingController();
  TextEditingController symptoms = TextEditingController();
  PageController controller = PageController();
  // ignore: unused_field
  int _curr = 0;
  var names = ['Crops', 'Disease', 'Fungicide'],
      colors = [Colors.green.withOpacity(.5), Colors.white];
  bool checkPage = false;
  FungicidesBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<FungicidesBloc>(context);

    bloc.add(ViewFungicidesEvent());

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
            'Fungicides',
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
                                hintText: 'Fungicide Name.',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Fungicide name';
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
                                hintText: 'Description.',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter fungicide description.';
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
                                        bloc.add(SaveFungicidesButttonPressed(
                                          name: diseasename.text,
                                          disc: severity.text,
                                        ));
                                        setState(() {
                                          Navigator.pop(context);
                                          bloc.add(ViewFungicidesEvent());
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
                                            bloc.add(ViewFungicidesEvent());
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
              child: Text("New Fungicide"),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
        ),
        drawer: ExpertDrawer(context),
        //resizeToAvoidBottomPadding: false,
        body: Center(
          child: BlocBuilder<FungicidesBloc, FungicidesStates>(
            // ignore: missing_return
            builder: (context, state) {
              if (state is FungicidesInitialState) {
                return CircularProgressIndicator();
              } else if (state is FungicidesLoadingState) {
                return CircularProgressIndicator();
              } else if (state is ViewFungicidesSuccess) {
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
                                itemCount: state.treatments.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: InkWell(
                                      child: Card(
                                        child: ListTile(
                                          title: Text(
                                              '${state.treatments[index].name}'),
                                          // subtitle: Text(
                                          //     '${state.treatments[index].id}'),
                                        ),
                                      ),
                                      onTap: () {
                                        checkPage = true;
                                        // bloc.add(ViewCropEvent());
                                        bloc.add(ViewFungicideEvent(
                                            state.treatments[index]));
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
                // } else if (state is ViewDiseaseSuccess) {
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
                //                           // bloc.add(ViewCropEvent());
                //                           // bloc.add(
                //                           //     ViewCropEvent(state.crops[index]));
                //                           // bloc.add(ViewTreatmentsEvent(
                //                           //     state.crop.diseases[index]));
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
              }
              // else if (state is AddingCropState) {
              //   return Container();
              // }
            },
          ),
        ));
  }
}
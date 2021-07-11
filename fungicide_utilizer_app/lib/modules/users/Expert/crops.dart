import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_events.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_states.dart';
import 'package:fungicide_utilizer_app/shared/components/expertDrawer.dart';

class Crops extends StatefulWidget {
  @override
  _CropsState createState() => _CropsState();
}

class _CropsState extends State<Crops> {
  TextEditingController cropname = TextEditingController();
  TextEditingController duration = TextEditingController();
  PageController controller = PageController();
  // ignore: unused_field
  int _curr = 0;
  var names = ['Crops', 'Disease', 'Fungicide'],
      colors = [Colors.green.withOpacity(.5), Colors.white];
  bool checkPage = false;
  CropsBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<CropsBloc>(context);

    bloc.add(ViewCropsEvent());

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
            'Crops',
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
                              controller: cropname,
                              decoration: const InputDecoration(
                                hintText: 'Crop Name.',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter land name';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: h * .01),
                            child: TextFormField(
                              controller: duration,
                              decoration: const InputDecoration(
                                hintText: 'Duration .',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter a crop name.';
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
                                        bloc.add(SaveCropButttonPressed(
                                          cropname: cropname.text,
                                          duration: duration.text,
                                        ));
                                        setState(() {
                                          Navigator.pop(context);
                                          bloc.add(ViewCropsEvent());
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
                                            bloc.add(ViewCropsEvent());
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
              child: Text("New Crop"),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
        ),
        drawer: ExpertDrawer(context),
        //resizeToAvoidBottomPadding: false,
        body: Center(
          child: BlocBuilder<CropsBloc, CropsStates>(
            // ignore: missing_return
            builder: (context, state) {
              if (state is InitialState) {
                return CircularProgressIndicator();
              } else if (state is LoadingState) {
                return CircularProgressIndicator();
              } else if (state is ViewCropsSuccess) {
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
                                itemCount: state.crops.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: Column(
                                      children: [
                                        InkWell(
                                          child: Card(
                                            child: ListTile(
                                              title: Text(
                                                  '${state.crops[index].name}'),
                                              subtitle: Text(
                                                  '${state.crops[index].id}'),
                                            ),
                                          ),
                                          onTap: () {
                                            checkPage = true;
                                            // bloc.add(ViewCropEvent());
                                            bloc.add(ViewCropEvent(
                                                state.crops[index]));
                                          },
                                        ),
                                        // Padding(
                                        //   padding: EdgeInsetsDirectional.only(
                                        //       bottom: 4.0, end: 3.0),
                                        //   child: IconButton(
                                        //       icon:
                                        //           Icon(Icons.arrow_forward_ios),
                                        //       onPressed: () {}),
                                        // ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              } else if (state is ViewCropSuccess) {
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
                                itemCount: state.crop.diseases.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: InkWell(
                                      child: Card(
                                        child: ListTile(
                                          title: Text(
                                              '${state.crop.diseases[index].name}'),
                                          subtitle: Text(
                                              '${state.crop.diseases[index].id}'),
                                        ),
                                      ),
                                      onTap: () {
                                        checkPage = true;
                                        // bloc.add(ViewCropEvent());
                                        // bloc.add(
                                        //     ViewCropEvent(state.crops[index]));
                                        bloc.add(ViewDiseaseEvent(
                                            state.crop.diseases[index]));
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
              } else if (state is ViewDiseaseSuccess) {
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
                                itemCount: state.disease.treatments.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: InkWell(
                                      child: Card(
                                        child: ListTile(
                                          title: Text(
                                              '${state.disease.treatments[index].name}'),
                                          subtitle: Text(
                                              '${state.disease.treatments[index].description}'),
                                        ),
                                      ),
                                      onTap: () {
                                        checkPage = true;
                                        // bloc.add(ViewCropEvent());
                                        // bloc.add(
                                        //     ViewCropEvent(state.crops[index]));
                                        // bloc.add(ViewTreatmentsEvent(
                                        //     state.crop.diseases[index]));
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
              // else if (state is AddingCropState) {
              //   return Container();
              // }
            },
          ),
        ));
  }
}

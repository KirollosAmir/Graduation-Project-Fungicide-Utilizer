import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_events.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_states.dart';
import 'package:fungicide_utilizer_app/shared/components/drawer.dart';

class CropsPage extends StatefulWidget {
  _CropsPagestate createState() => _CropsPagestate();
}

class _CropsPagestate extends State<CropsPage> {
  TextEditingController landname = TextEditingController();
  TextEditingController cropname = TextEditingController();
  TextEditingController postalcode = TextEditingController();
  TextEditingController serial = TextEditingController();
  PageController controller = PageController();
  var names = ['Status', 'History'],
      colors = [Colors.green.withOpacity(.5), Colors.white];
  // ignore: non_constant_identifier_names
  // var ListData = ['My land '];
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
    // var w = MediaQuery.of(context).size.width;

    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Crops',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
        ),
        drawer: FarmerDrawer(context),
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
                                    child: InkWell(
                                      child: Card(
                                        child: ListTile(
                                          title: Text(
                                              '${state.crops[index].name}'),
                                          subtitle:
                                              Text('${state.crops[index].id}'),
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
                                        bloc.add(
                                            ViewCropEvent(state.crops[index]));
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
            },
          ),
        ));
  }
}

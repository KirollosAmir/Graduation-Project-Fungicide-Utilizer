import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_events.dart';
import 'package:fungicide_utilizer_app/BloC/crops_bloc/crops_states.dart';
import 'package:fungicide_utilizer_app/shared/components/drawer.dart';

class AllCropsPage extends StatefulWidget {
  _AllCropsPagestate createState() => _AllCropsPagestate();
}

class _AllCropsPagestate extends State<AllCropsPage> {
  PageController controller = PageController();
  // ignore: non_constant_identifier_names
  var ListData = ['My land '];
  bool checkPage = false;
  CropsBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<CropsBloc>(context);

    bloc.add(ViewCropEvent());

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
        ),
        drawer: FarmerDrawer(context),
        //resizeToAvoidBottomPadding: false,
        body: Center(
          child:
              BlocListener<CropsBloc, CropsStates>(listener: (context, state) {
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: ListView.builder(
                              itemCount: state.crops.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: InkWell(
                                    child: Card(
                                      child: ListTile(
                                        title:
                                            Text('${state.crops[index].name}'),
                                        subtitle:
                                            Text('${state.crops[index].id}'),
                                      ),
                                    ),
                                    onTap: () {
                                      checkPage = true;
                                      // bloc.add(ViewCropEvent());
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
          }),
          // child: BlocBuilder<CropsBloc, CropsStates>(
          //     // ignore: missing_return
          //     builder: (context, state) {
          //   if (state is InitialState) {
          //     return CircularProgressIndicator();
          //   } else if (state is LoadingState) {
          //     return CircularProgressIndicator();
          //   } else if (state is ViewCropsSuccess) {
          //     return Stack(
          //       children: [
          //         Column(
          //           children: [
          //             Container(
          //               child: Container(
          //                 height: h * .6,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.all(Radius.circular(10)),
          //                 ),
          //                 child: ListView.builder(
          //                     itemCount: state.crops.length,
          //                     itemBuilder: (BuildContext context, int index) {
          //                       return Container(
          //                         child: InkWell(
          //                           child: Card(
          //                             child: ListTile(
          //                               title:
          //                                   Text('${state.crops[index].name}'),
          //                               subtitle:
          //                                   Text('${state.crops[index].id}'),
          //                             ),
          //                           ),
          //                           onTap: () {
          //                             checkPage = true;
          //                             // bloc.add(ViewCropEvent());
          //                           },
          //                         ),
          //                       );
          //                     }),
          //               ),
          //             ),
          //           ],
          //         )
          //       ],
          //     );
          //   } else if (state is ErrorState) {
          //     return Text(state.message);
          //   }
          // }),
        ));
  }
}

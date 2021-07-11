import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fungicide_utilizer_app/BloC/news/newsBloc.dart';
import 'package:fungicide_utilizer_app/BloC/news/newsEvent.dart';
import 'package:fungicide_utilizer_app/BloC/news/newsState.dart';
import 'package:fungicide_utilizer_app/shared/components/drawer.dart';
import 'dart:convert';

class FarmerHome extends StatefulWidget {
  _FarmerHomestate createState() => _FarmerHomestate();
}

// ignore: camel_case_types
class _FarmerHomestate extends State<FarmerHome> {
  NewsBloc bloc;
  PageController controller = PageController();

  // ignore: unused_field
  //int _curr = 0;
  //var names = ['Crops', 'Disease', 'Fungicide'],
  //colors = [Colors.green.withOpacity(.5), Colors.white, Colors.white];

  @override
  void initState() {
    bloc = BlocProvider.of<NewsBloc>(context);
    bloc.add(ViewNewsEvent());

    setState(() {});

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  // Widget FirstWidget(h, w) {
  //   return ListView(
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.only(top: h * .05, left: w * .02, right: w * .02),
  //         child: Container(
  //           height: h * .2,
  //           width: w * .6,
  //           child: Image.asset('images/man.png'),
  //         ),
  //       )
  //     ],
  //   );
  // }

  // ignore: non_constant_identifier_names
  // Widget SecWidget(h, w) {
  //   return ListView(
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.only(top: h * .05, left: w * .02, right: w * .02),
  //       )
  //     ],
  //   );
  // }

  // ignore: non_constant_identifier_names
  // Widget ThirdWidget(h, w) {
  //   return ListView(
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.only(top: h * .05, left: w * .02, right: w * .02),
  //       )
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // var h = MediaQuery.of(context).size.height;
    // var w = MediaQuery.of(context).size.width;

    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      drawer: FarmerDrawer(context),
      body: BlocBuilder<NewsBloc, NewsState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is NewsInitialState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsSuccessState) {
            return Stack(children: [
              ListView.builder(
                  itemCount: state.news.length,
                  itemBuilder: (BuildContext context, int index) {
                    var _image = base64Decode('${state.news[index].image}');
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: new Card(
                        elevation: 3.0,
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              width: 150.0,
                              child: Flexible(
                                child: Image.memory(_image, fit: BoxFit.fill),
                              ),
                              // child: new Image.network(
                              //   post.thumbUrl,
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                            new Expanded(
                                child: new Container(
                              margin: new EdgeInsets.all(10.0),
                              child: new Text(
                                '${state.news[index].title}',
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 18.0),
                              ),
                            )),
                          ],
                        ),
                      ),
                    );
                  }),
            ]);

            // return Stack(
            //   children: [
            //     Column(
            //       children: [
            //         Container(
            //           child: ListView.builder(
            //               itemCount: state.news.length,
            //               itemBuilder: (BuildContext context, int index) {
            //                 return Container(
            //                   height: h * .30,
            //                   child: InkWell(
            //                     child: Card(
            //                       child: ListTile(
            //                         title: Text('${state.news[index].title}'),
            //                         subtitle: Text('${state.news[index].id}'),
            //                       ),
            //                     ),
            //                   ),
            //                 );
            //               }),
            //         )
            //       ],
            //     )
            //   ],
            // );
            // return Stack(
            //   children: [
            //     Container(
            //       height: h * .30,
            //       child: ListView.builder(
            //           itemCount: state.news.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             var _image = base64Decode('${state.news[index].image}');

            //             return Padding(
            //               padding: EdgeInsets.only(
            //                   top: h * .05, left: w * .02, right: w * .02),
            //               child: Container(
            //                 height: h * .2,
            //                 width: w * .6,
            //                 child: Flexible(
            //                   child: Image.memory(_image, fit: BoxFit.fill),
            //                 ),
            //                 //child: Text('${state.news[index].title}')
            //               ),
            //             );
            //           }),
            //     )
            //   ],
            // );
          } else if (state is NewsErrorState) {
            return Text(state.message);
          }
          // ignore: unused_label
          child:
          Container();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fungicide_utilizer_app/BloC/news/newsBloc.dart';
import 'package:fungicide_utilizer_app/BloC/news/newsEvent.dart';
import 'package:fungicide_utilizer_app/BloC/news/newsState.dart';
import 'dart:convert';
import 'package:fungicide_utilizer_app/shared/components/expertDrawer.dart';

class ExpertHome extends StatefulWidget {
  _ExpertHomestate createState() => _ExpertHomestate();
}

// ignore: camel_case_types
class _ExpertHomestate extends State<ExpertHome> {
  NewsBloc bloc;
  PageController controller = PageController();

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
      drawer: ExpertDrawer(context),
      body: BlocBuilder<NewsBloc, NewsState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is NewsInitialState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsSuccessState) {
            return Stack(children: [
              new GestureDetector(
                  onTap: () {
                    //  // openDetailsUI(post);
                  },
                  child: ListView.builder(
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
                                    child:
                                        Image.memory(_image, fit: BoxFit.fill),
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
                      })),
            ]);
          } else if (state is NewsErrorState) {
            return Text(state.message);
          }
        },
      ),
    );
  }
}

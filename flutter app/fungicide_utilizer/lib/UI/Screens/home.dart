

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget{

  Home_state createState()=> Home_state();

}

class Home_state extends State<Home>{

  PageController controller=PageController();

  int _curr=0;
  var names=['Crops','Disease','Fungicide'],colors=[Colors.green.withOpacity(.5),Colors.white,Colors.white]
  ;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {

    });

    // TODO: implement initState
    super.initState();
  }
  Widget FirstWidget( h,w){
    return ListView(
      children: [

        Padding(
          padding: EdgeInsets.only(top: h*.05,left: w*.02,right: w*.02
          ),
          child: Container(
            height: h*.2,
            width: w*.6,
            child: Image.asset('images/man.png'),
          ),)

      ],
    );
  }


  Widget SecWidget( h,w){
    return ListView(
      children: [

        Padding(
          padding: EdgeInsets.only(top: h*.05,left: w*.02,right: w*.02
          ),
        )

      ],
    );
  }
  Widget ThirdWidget( h,w){
    return ListView(
      children: [

        Padding(
          padding: EdgeInsets.only(top: h*.05,left: w*.02,right: w*.02
          ),
        )

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var h =MediaQuery.of(context).size.height;
    var w =MediaQuery.of(context).size.width;

    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: false);
    // TODO: implement build
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: h*.14,
              child:  Column(
                children: [
                  Container(
                    height: h*.08,
                    child: Row(
                      children: [
                        for(int i=0;i<3;i++)
                          Container(
                            width: w/3,
                            height: h*.09,
                            alignment: Alignment.center,
                            color: colors[i],
                            child: Text(names[i]),

                          ),

                      ],
                    ),
                  ),
                  Container(
                      child: Divider(
                        color: Colors.black,
                        height: 3,
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: h*.08),
              child:  Container(
                  height: h*.8,
                  child: PageView(
                    children:
                    <Widget>[
                      FirstWidget(h, w),
                      SecWidget(h,w),
                      ThirdWidget(h,w)
                    ],
                    scrollDirection: Axis.horizontal,


                    controller: controller,
                    onPageChanged: (num){
                      setState(() {
                        _curr=num;
                        print(num);
                        for(int j=0;j<3;j++)
                        {
                          if(j!=num)
                          {
                            colors[j]=Colors.white;
                          }
                          else
                          {

                            colors[j]=Colors.green.withOpacity(.5);
                          }
                        }
                      });
                    },
                  )
              ),
            ),


          ],
        )
    );
  }

}



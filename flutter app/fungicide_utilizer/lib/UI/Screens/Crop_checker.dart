

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qrscan/qrscan.dart' as scanner;
class Crop extends StatefulWidget{

  Crop_state createState()=> Crop_state();

}

class Crop_state extends State<Crop>{

  PageController controller=PageController();
  var scanResult;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
       scanResult = '';
    });

    // TODO: implement initState
    super.initState();
  }

  Future scanQRCode() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      scanResult = cameraScanResult;

    });
  }
  FirstWidget(h,w){
    return  Column(
      children: [

        Padding(
          padding: EdgeInsets.only(top: h*.02,left: w*.02,right: w*.02),
          child: Text('Select Crop : ',style: TextStyle(fontSize: 40.sp),),
        ),
        for (int i=0;i<4;i++)
          Padding(
            padding: EdgeInsets.only(top: h*.02,left: w*.02,right: w*.02),
            child: TextFormField(
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              autofocus: false,
              onFieldSubmitted: (v){
              },
              decoration: InputDecoration(

                errorStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                enabled: true,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      width: 1 ),
                ),

              ),

              onTap: (){

              },
              onChanged: (value) {

              },
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
            PageView(
              children:
              <Widget>[
                FirstWidget(h, w),
               Container()
              ],
              scrollDirection: Axis.horizontal,


              controller: controller,
              onPageChanged: (num){
                setState(() {
                  print(num);
if(num==1)
  {
    scanQRCode();
  }
                });
              },
            )


          ],
        )
    );
  }

}



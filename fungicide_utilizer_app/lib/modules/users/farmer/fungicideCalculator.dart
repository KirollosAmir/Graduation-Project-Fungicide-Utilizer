import 'package:flutter/material.dart';
import 'package:fungicide_utilizer_app/DataLayer/rainFallAmount.dart';
import 'package:fungicide_utilizer_app/shared/components/drawer.dart';

class FungicideCalculator extends StatefulWidget {
  @override
  _FungicideCalculatorState createState() => _FungicideCalculatorState();
}

final applicationarea = TextEditingController();
final rainfalldensity = TextEditingController();
final time = TextEditingController();
final fec = TextEditingController();
final fet = TextEditingController();
final a = TextEditingController();
final b = TextEditingController();

RainFallAmount r1 = new RainFallAmount();

// Float equation(Float nn, Float v, Float n){
//   var sum = 0;
//   for (int i in range():)
//     sum+= v[i] * n[i]
//   p = (sum / 4 * N)  * 100
//   return p
//   }
class _FungicideCalculatorState extends State<FungicideCalculator> {
  clearTextInput() {
    applicationarea.clear();
    rainfalldensity.clear();
    time.clear();
    fec.clear();
    fet.clear();
    a.clear();
    b.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fungicide Calculator',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      drawer: FarmerDrawer(context),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Rainfall Amount',
                ),
                Tab(
                  text: 'Reduction',
                ),
                Tab(text: 'Efficacy'),
                // Tab(
                //   text: 'Disease Severity ',
                // )
              ],
            ),
            Container(
                height: 700,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5))),
                child: TabBarView(children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Calculate RainFall Amount And Know Wether to Respray Fungicide Or Not :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: applicationarea,
                            // keyboardType: TextInputType.number,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
                            decoration: const InputDecoration(
                              hintText: 'Enter Appliation Area In meter.',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: rainfalldensity,
                            //keyboardType: TextInputType.number,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
                            decoration: const InputDecoration(
                              hintText:
                                  'Enter Rain Fall intensity in milimeter. ',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: time,
                            //keyboardType: TextInputType.number,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
                            decoration: const InputDecoration(
                              hintText:
                                  'Enter Time Btween Fungicide And Rain Fall In Minutes. ',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        RaisedButton(
                          onPressed: clearTextInput,
                          color: Colors.green,
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text('Reset Enteries'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              String a = applicationarea.text;
                              double aa = double.parse(a);
                              String r = rainfalldensity.text;
                              double rd = double.parse(r);
                              String tt = time.text;
                              double tx = double.parse(tt);
                              double ra = r1.calcRainAmount(aa, rd);
                              r1.rainAmount = ra;
                              String message = (r1.respray(ra, tx));
                              return showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(''),
                                    content: Text("$message"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('Calculate',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Calculate Fungicide Reduction:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: fec,
                            decoration: const InputDecoration(
                              hintText: 'Enter fec.',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: fet,
                            decoration: const InputDecoration(
                              hintText: 'Enter fet. ',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RaisedButton(
                          onPressed: clearTextInput,
                          color: Colors.green,
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text('Reset Enteries'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              String a = fec.text;
                              double fecc = double.parse(a);
                              String r = fet.text;
                              double fett = double.parse(r);
                              //double ra = r1.calcRainAmount(aa, rd);
                              //  r1.rainAmount = ra;
                              double fr =
                                  (r1.calcFungicideReduction(fecc, fett));
                              return showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Fungicide Reduction Is:'),
                                    content: Text("$fr"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('Calculate',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Calculate Fungicide Efficacy:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: a,
                            decoration: const InputDecoration(
                              hintText: 'Enter a.',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: b,
                            decoration: const InputDecoration(
                              hintText: 'Enter b. ',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RaisedButton(
                          onPressed: clearTextInput,
                          color: Colors.green,
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text('Reset Enteries'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              String c = a.text;
                              double aaa = double.parse(c);
                              String r = b.text;
                              double ccc = double.parse(r);
                              //double ra = r1.calcRainAmount(aa, rd);
                              //  r1.rainAmount = ra;
                              double fr = (r1.calcFungicideEfficacy(aaa, ccc));
                              return showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Fungicide Reduction Is:'),
                                    content: Text("$fr"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('Calculate',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Container(),
                ]))
          ],
        ),
      ),
    );
  }
}

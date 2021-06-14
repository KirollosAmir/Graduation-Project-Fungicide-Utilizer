import 'package:fungicide_utilizer/DataLayer/land.dart';

class Farm {
  String id;
  String farmName;
  int numberOfLands;
  String farmerId;
  List<LandModel> myLands = [];
  Farm() {
    numberOfLands = myLands.length;
  }
}

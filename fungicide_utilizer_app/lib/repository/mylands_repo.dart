import 'package:fungicide_utilizer_app/DataLayer/land.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MyLandsRepos {
  // ignore: missing_return
  Future<List<LandModel>> fetchLands() async {
    List<LandModel> lands = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString('ID');
    print(_id);
    var response = await http.get(
        'https://fungicidesutilizer.000webhostapp.com/APIs/getlands.php?id=' +
            _id);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.map((land) => lands.add(LandModel.fromJson(land))).toList();
      return lands;
    }
  }

  Future addLands(String landname, String crop, String postalcode,
      String stationserial) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString('ID');

    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/addland.php?farmerid=' +
            _id +
            '&title=' +
            landname +
            '&crop=' +
            crop +
            '&postalCode=' +
            postalcode +
            '&station=' +
            stationserial);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "error") {
        return "Error Adding Land.";
      } else if (response.body != null) {
        return "Land Added Successfully. ";
      }
    } else {
      return "Connection Error.";
    }
  }

  Future deleteLand(String landid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString('ID');
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/deleteland.php?farmerid=' +
            _id +
            '&landid=' +
            landid);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "error") {
        return "Error Deleting Land.";
      } else {
        return "Land Deleted Successfully. ";
      }
    } else {
      return "Connection Error.";
    }
  }

  Future addObservation(
    String landid,
    //String crop,
    String observation,
  ) async {
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/addobservation.php?landid=' +
            landid +
            '&description=' +
            observation);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "error") {
        return "Error Sending Observation.";
      } else if (response.body == 'success') {
        return "Observation Sent Successfully.";
      }
    } else {
      return "Connection Error.";
    }
  }
}

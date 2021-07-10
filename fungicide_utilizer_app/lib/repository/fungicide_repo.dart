import 'package:fungicide_utilizer_app/DataLayer/treatment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FungicidesRepository {
  // ignore: missing_return
  Future<List<Treatment>> fetchFungicides() async {
    List<Treatment> fungicides = [];
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/getfungicides.php');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data
          .map((fungicide) => fungicides.add(Treatment.fromJson(fungicide)))
          .toList();
      return fungicides;
    }
  }

  Future addFungicide(String name, String disc) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString('ID');

    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/addfungicide.php?expertid=' +
            _id +
            '&name=' +
            name +
            '&&description=' +
            disc);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "error") {
        return "Error Adding Fungicide.";
      } else if (response.body != null) {
        return "Fungicide Added Successfully. ";
      }
    } else {
      return "Connection Error.";
    }
  }
}

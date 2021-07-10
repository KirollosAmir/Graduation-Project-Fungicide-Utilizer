import 'package:fungicide_utilizer_app/DataLayer/disease.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DiseaseRepository {
  // ignore: missing_return
  Future<List<Disease>> fetchDiseases() async {
    List<Disease> diseases = [];
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/getdiseases.php');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.map((disease) => diseases.add(Disease.fromJson(disease))).toList();
      return diseases;
    }
  }

  Future addDisease(
      String diseasename, String severity, String symptoms) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString('ID');

    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/adddisease.php?expertid=' +
            _id +
            '&disease_name=' +
            diseasename +
            '&severity=' +
            severity +
            '&symptoms=' +
            symptoms);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "error") {
        return "Error Adding Diseese.";
      } else if (response.body != null) {
        return "Disease Added Successfully. ";
      }
    } else {
      return "Connection Error.";
    }
  }
}

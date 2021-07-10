import 'package:fungicide_utilizer_app/DataLayer/crop.dart';
import 'package:fungicide_utilizer_app/DataLayer/disease.dart';
import 'package:fungicide_utilizer_app/DataLayer/treatment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CropsRepository {
  // ignore: missing_return
  Future<List<Crop>> fetchCrops() async {
    List<Crop> crops = [];
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/getcrops.php');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.map((crop) => crops.add(Crop.fromJson(crop))).toList();
      return crops;
    }
  }

  Future addCrop(String cropname, String duration) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString('ID');

    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/addcrop.php?expertid=' +
            _id +
            '&name=' +
            cropname +
            '&duration=' +
            duration);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "error") {
        return "Error Adding Crop.";
      } else if (response.body != null) {
        return "Crop Added Successfully. ";
      }
    } else {
      return "Connection Error.";
    }
  }

  Future<List<Disease>> fetchDiseases(Crop crop) async {
    return crop.diseases.toList();
  }

  Future<List<Treatment>> fetchTreatments(Disease disease) async {
    return disease.treatments.toList();
  }
}

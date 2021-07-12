import 'package:fungicide_utilizer_app/DataLayer/disease.dart';
import 'package:fungicide_utilizer_app/DataLayer/fungicideInfo.dart';
import 'package:fungicide_utilizer_app/DataLayer/treatment.dart';
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

  // Future addTreatment(String diseaseid, String fungicideid, String dose) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String _id = prefs.getString('ID');

  //   var url = Uri.parse(
  //       'https://fungicidesutilizer.000webhostapp.com/APIs/addtreatment.php?expertid=' +
  //           _id +
  //           '&disease_id=' +
  //           diseaseid +
  //           '&fungicide_id=' +
  //           fungicideid +
  //           '&dose=' +
  //           dose);

  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     if (response.body == "error") {
  //       return "Error Adding Diseese.";
  //     } else if (response.body != null) {
  //       return "Disease Added Successfully. ";
  //     }
  //   } else {
  //     return "Connection Error.";
  //   }
  // }

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

  Future addTreatment(String diseaseid, String fungicideid, String dose) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString('ID');

    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/addtreatment.php?expertid=' +
            _id +
            '&disease_id=' +
            diseaseid +
            '&fungicide_id=' +
            fungicideid +
            '&dose=' +
            dose);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "error") {
        return "Error Adding Disease For This Crop.";
      } else if (response.body == "success") {
        //print("Treatment Added Successfully.");
        return "Treatment Added Successfully. ";
      }
    } else {
      return "Connection Error.";
    }
  }

  // ignore: missing_return
  Future<List<FungicideInfo>> fetchNotFungicide(String id) async {
    List<FungicideInfo> dis = [];
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/getfungicideoptions.php?id=' +
            id);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.map((crop) => dis.add(FungicideInfo.fromJson(crop))).toList();
      return dis;
    }
  }
}

import 'package:fungicide_utilizer/DataLayer/land.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyLandsRepos {
  Future<List<LandModel>> fetchLands() async {
    List<LandModel> lands = [];
    var response = await http.get(
        'https://fungicidesutilizer.000webhostapp.com/APIs/getlands.php?id=1');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.map((land) => lands.add(LandModel.fromJson(land))).toList();
      return lands;
    }
  }
}

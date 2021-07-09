// //import 'crop.dart';
// import 'crop.dart';
// import 'disease.dart';
// import 'treatment.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class CropsRepository {
//   Future<List<Crop>> fetchCrops() async {
//     List<Crop> crops = [];
//     var url = Uri.parse(
//         'https://fungicidesutilizer.000webhostapp.com/APIs/getcrops.php');
//     var response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       data.map((crop) => crops.add(Crop.fromJson(crop))).toList();
//       return crops;
//     }
//   }
//
//   Future<List<Disease>> fetchDiseases(Crop crop) async {
//     return crop.diseases.toList();
//   }
//
//   Future<List<Treatment>> fetchTreatments(Disease disease) async {
//     return disease.treatments.toList();
//   }
// }

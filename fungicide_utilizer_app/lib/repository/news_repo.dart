import 'package:fungicide_utilizer_app/DataLayer/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class NewsRepos {
  // ignore: missing_return
  Future<List<News>> fetchNews() async {
    List<News> news = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString('ID');
    var response = await http.get(
        "https://fungicidesutilizer.000webhostapp.com/APIs/getnews.php?id=" +
            _id);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.map((newss) => news.add(News.fromJson(newss))).toList();
      return news;
    }
  }
}

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ExpertAuthenticationRepos {
  login(String mobile, String password) async {
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/expertlogin.php?mobile=' +
            mobile +
            '&password=' +
            password);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      if (response.body == "Failed") {
        return "Invalid";
      } else {
        var id = response.body;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs?.setString('ID', id);
        prefs?.setString('Type', 'Expert');
        prefs?.setBool("isLoggedIn", true);
        var x = prefs.getString('ID');
        print(x);
        return response.body;
      }
    } else {
      return "Error";
    }
  }
}

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepos {
  login(String mobile, String password) async {
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/farmerlogin.php?mobile=' +
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
        prefs?.setString('Type', 'farmer');
        prefs?.setBool("isLoggedIn", true);
        var x = prefs.getString('ID');
        print(x);
        return response.body;
      }
    } else {
      return "Error";
    }

    // String apiurl =
    //     "https://fungicidesutilizer.000webhostapp.com/APIs/farmerlogin.php?";
    // print(mobile);
    // var res = await http.post(Uri.parse(apiurl), body: {
    //   'mobile': '012345678', //get the username text
    //   'password': '123' //get password text
    // });

    // if (response.statusCode == 200) {
    //   return response.body;
    // } else {
    //   return "Error ! ";
    // }

    // var res = http.get(
    //     "https://fungicidesutilizer.000webhostapp.com/APIs/farmerlogin.php?",
    //     headers: {},
    //     body: {"mobile": mobile, "password": password});
    // final data = json.decode(res.body);
  }

  register(String name, String mobile, String password) async {
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/farmerregister.php?name=' +
            name +
            '&mobile=' +
            mobile +
            '&password=' +
            password);

    var response = await http.post(url);
    print(response.body);
    if (response.body == "Failed") {
      return "Invalid";
    } else {
      var id = response.body;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs?.setString('ID', id);
      prefs?.setString('Type', 'farmer');
      prefs?.setBool("isLoggedIn", true);
      var x = prefs.getString('ID');
      print(x);
      return response.body;
    }
  }
}

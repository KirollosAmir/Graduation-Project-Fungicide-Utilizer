import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepos {
  register(String name, String mobile, String password) async {
    //https://fungicidesutilizer.000webhostapp.com/APIs/farmerregister.php?name=farmer&mobile=0143256789&password=12345
    // var url = Uri.parse(
    //     'https://fungicidesutilizer.000webhostapp.com/APIs/farmerlogin.php?mobile=' +
    //         mobile +
    //         '&password=' +
    //         password);

    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/farmerregister.php?name=' +
            name +
            '&mobile=' +
            mobile +
            '&password=' +
            password);

    var response = await http.post(url);
    print(response.body);

    if (response.statusCode == 200) {
      if (response.body == "Failed") {
        return "Invalid";
      } else if (response.body == null) {
        return "Error";
      } else {
        var id = response.body;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs?.setString('ID', id);
        prefs?.setBool("isLoggedIn", true);
        var x = prefs.getString('ID');
        print(x);
        return response.body;
      }
    }
  }
}

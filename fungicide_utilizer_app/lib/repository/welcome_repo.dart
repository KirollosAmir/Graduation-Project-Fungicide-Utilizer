import 'package:http/http.dart' as http;

class WelcomeRepository {
  // ignore: missing_return
  Future<String> farmerLogin(String mobile, String password) async {
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/farmerlogin.php?mobile=' +
            mobile +
            '&password=' +
            password);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    }
  }

  // ignore: missing_return
  Future<String> farmerRegister(
      String name, String mobile, String password) async {
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/farmerregister.php?name=' +
            name +
            '&mobile=' +
            mobile +
            '&password=' +
            password);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    }
  }

  // ignore: missing_return
  Future<String> expertLogin(String mobile, String password) async {
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/expertlogin.php?mobile=' +
            mobile +
            '&password=' +
            password);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    }
  }
}

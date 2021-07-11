import 'package:fungicide_utilizer_app/DataLayer/notification.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationRepos {
  // ignore: missing_return
  Future<List<Notification>> fetchNots() async {
    List<Notification> notifications = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString('ID');
    print(_id);
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/getnotifications.php?farmerid=' +
            _id);
    var response = await http.get(url);
    // var response = await http.get(
    //     'https://fungicidesutilizer.000webhostapp.com/APIs/getnotifications.php?farmerid=' +
    //         _id);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      data
          .map((notification) =>
              notifications.add(Notification.fromJson(notification)))
          .toList();
      print(data);
      return notifications;
    }
  }

  isSeen(String id) async {
    var url = Uri.parse(
        'https://fungicidesutilizer.000webhostapp.com/APIs/notificationseen.php?id=' +
            id);

    var response = await http.post(url);
    print(response.body);
    if (response.body == "Success") {
      return response.body;
    } else {
      return "failed";
    }
  }
}

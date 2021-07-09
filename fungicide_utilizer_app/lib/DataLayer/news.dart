// class News {
//   String id;
//   String text;
//   DateTime date;
//   String image;
// }

class News {
  String id;
  String date;
  String image;
  //Uint8List image;
  String title;
  String content;

  News({this.id, this.date, this.image, this.title, this.content});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    image = json['image'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['image'] = this.image;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}

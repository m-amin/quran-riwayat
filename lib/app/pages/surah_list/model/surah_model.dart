import 'dart:convert';

List<Surah> surahsFromJson(String str) =>
    List<Surah>.from(json.decode(str).map((x) => Surah.fromJson(x)));

String surahsToJson(List<Surah> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Surah {
  String? place;
  String? type;
  int? count;
  String? title;
  String? titleAr;
  String? index;
  String? pages;

  Surah({
    this.place,
    this.type,
    this.count,
    this.title,
    this.titleAr,
    this.index,
    this.pages,
  });

  Surah.fromJson(Map<String, dynamic> json) {
    place = json['place'];
    type = json['type'];
    count = json['count'];
    title = json['title'];
    titleAr = json['titleAr'];
    index = json['index'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place'] = this.place;
    data['type'] = this.type;
    data['count'] = this.count;
    data['title'] = this.title;
    data['titleAr'] = this.titleAr;
    data['index'] = this.index;
    data['pages'] = this.pages;
    return data;
  }
}

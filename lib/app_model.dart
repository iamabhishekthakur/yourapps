// To parse this JSON data, do
//
//     final app = appFromJson(jsonString);

import 'dart:convert';

List<App> appFromJson(String str) =>
    List<App>.from(json.decode(str).map((x) => App.fromJson(x)));

String appToJson(List<App> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class App {
  App({
    required this.title,
    required this.url,
    required this.hashtag,
    required this.entryTime,
  });

  String title;
  String url;
  String hashtag;
  String entryTime;

  factory App.fromJson(Map<String, dynamic> json) => App(
        title: json["title"],
        url: json["url"],
        hashtag: json["hashtag"],
        entryTime: json["entry_time"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "hashtag": hashtag,
        "entry_time": entryTime,
      };
}

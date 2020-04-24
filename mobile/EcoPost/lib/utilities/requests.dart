import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class Requests {
  var url = 'http://169.254.111.186:8000';

//  static Future<String> getUnits(String category) async {
//    var response = await HttpClient().get(Uri.parse(""));
//    return response.body;
//  }

//  static Future getFires() async {
//    var path =
//        "/list_meetings";
//    print("HERERE");
//    var result = await getResult(path);
//    // print(result.toString());
//    var fireList = MeetingList.fromJson(result).meets;
////    print("zoom" + fireList.get.toString());
//    return fireList;
//  }
//
//  static Future<dynamic> getResult(String path) async {
//    String requestUrl = 'https://apartly-backend.herokuapp.com';
//    var request = await HttpClient().getUrl(Uri.parse(requestUrl+path));
//    var response = await request.close();
//    var contents =
//    await response.transform(utf8.decoder).transform(json.decoder).single;
//    return contents;
//  }
}

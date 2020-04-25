import 'dart:convert';
import 'dart:io';

//import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

import 'package:path_provider/path_provider.dart';
//import 'package:http/http.dart' as http;

class Requests {
//  var url = 'http://169.254.111.186:8000';

//  static Future<String> getUnits(String category) async {
//    var response = await HttpClient().get(Uri.parse(""));
//    return response.body;
//  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future uploadImage() async {
    var path = "/upload_image";

//    Future<String> networkImageToBase64(String imageUrl) async {
//      http.Response response = await http.get(imageUrl);
//      final bytes = response?.bodyBytes;
//      return (bytes != null ? base64Encode(bytes) : null);
//    }
//    final imgBase64Str = await networkImageToBase64('https://picsum.photos/250?image=9');
//    print(imgBase64Str);

    print("HERERE");
//    final pth = await _localPath;
//    File img = File.fromRawPath("assets/avatar2.jpg");
//    print("file: " + img.path);

    final byteData = await rootBundle.load('assets/avatar2.jpg');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    File img = await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//    print()

    String base64Image = base64Encode(img.readAsBytesSync());
    print("base");

    String fileName = img.path.split("/").last;

    http.post("https://earth-hacks-eco-post.herokuapp.com" + path, body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      print("STATUS: " + res.statusCode.toString());
      print(base64Image);
    }).catchError((err) {
      print(err);
    });
//    return fireList;
//  }
  }

  static Future<dynamic> postResult(String path) async {
    String requestUrl = 'https://earth-hacks-eco-post.herokuapp.com/';
    var request = await HttpClient().postUrl(Uri.parse(requestUrl + path));
    var response = await request.close();
    var contents =
        await response.transform(utf8.decoder).transform(json.decoder).single;
    return contents;
  }

  static Future<dynamic> getResult(String path) async {
    String requestUrl = 'https://earth-hacks-eco-post.herokuapp.com/';
    var request = await HttpClient().getUrl(Uri.parse(requestUrl + path));
    var response = await request.close();
    var contents =
        await response.transform(utf8.decoder).transform(json.decoder).single;
    return contents;
  }
}

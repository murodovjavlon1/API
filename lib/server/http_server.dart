import 'dart:convert';

import 'package:http/http.dart';
import 'package:untitled2/model/model.dart';



class Network {
  static String BAST = "fakestoreapi.com";

  static Map<String, String> headers = {
    'Content-Type': 'application/jon; charset=UTF-8'
  };

  static String API_LIST = "/products";

  static Future<String?> GET(String api, Map<String, String> paeams) async {
    var url = Uri.https(BAST, api, paeams);
    var response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  /*Http parsing*/

  static List<Post> parerPostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }
}

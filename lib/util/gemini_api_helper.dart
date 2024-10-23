import 'dart:convert';

import 'package:gemini/screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  static APIHelper helper = APIHelper._();

  APIHelper._();

  Future<GeminiModel?> geminiAPI(String search) async {
    String link =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyAyDEu1oBviYD30jV0WV7xctMbJtA_ra9Q";

    var response =await http.post(Uri.parse(link),
        body: jsonEncode(
          {
            "contents": [
              {
                "parts": [
                  {"text": search}
                ]
              }
            ]
          },
        ),
        headers: {"Content-Type": "application/json"});
    if(response.statusCode==200)
      {
         var json=jsonDecode(response.body);
         GeminiModel m1=GeminiModel.fromJson(json);
         return m1;
      }
    return null;
  }
}

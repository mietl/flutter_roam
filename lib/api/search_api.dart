import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:http/http.dart' as http;

import 'package:flutter_roam/models/search/suggest_result.dart';

import 'package:flutter_roam/util/date.dart';

import 'api_constants.dart';


class SearchApi{
  static Future<List<SuggestsResult>> searchKeywordSuggests(keyword) async{
    var uri = Uri.parse(ApiConstants.searchUrl);

    Map<String, dynamic> bodyParams = {
      "cityId": 45, // 城市
      "keyword": keyword,
      "sourceCode": 702,
      "checkInDate": dateFormat(DateTime.now()),
      "checkOutDate": dateFormat(DateTime.now().add(const Duration(days: 1))),
      "currentCity": 'false',
      "forCtripHotel": 'false',
      "typeFilter": '0'
    };


    final response = await http.post(uri,
        headers:{
          'Cookie':ApiConstants.searchCookie,
          "content-type": "application/json",
        },
        // https://stackoverflow.com/questions/54283800/type-int-is-not-a-subtype-of-type-string-in-type-cast-when-sending-a-post-re
        body: jsonEncode(bodyParams)
      );
    

    final body = jsonDecode(response.body);

    final jsonData = body['data'];

    List<SuggestsResult> suggests = [];

    if(jsonData!=null){
      suggests = jsonData['suggests'] == null? [] : List<SuggestsResult>.from(jsonData["suggests"].map((x)=>SuggestsResult.fromJson(x)));
    }
    
    return suggests;
  }
}
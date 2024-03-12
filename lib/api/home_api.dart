import 'dart:convert';

import 'package:flutter_roam/api/api_constants.dart';
import 'package:flutter_roam/models/home/categories.dart';
import 'package:http/http.dart' as http;


class HomeApi{
  // static Future<> requestHotSuggests() aysnc{
  //
  // }

  static Future<List<HomeCategories>> requestCategories() async {
    var uri = Uri.parse('${ApiConstants.baseUrl}/home/categories');

    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    final json = body['data'];

    List<HomeCategories> data = json.map<HomeCategories>((v)=>HomeCategories.fromJson(v)).toList();

    return data;
  }

  // static Future<String> requestHouseList() aysnc{
  //
  // }
}
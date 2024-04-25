import 'dart:convert' show jsonDecode;

import 'package:flutter_roam/models/country/house_space.dart';
import 'package:http/http.dart' as http;

import 'api_constants.dart';

class CountryApi {
  static Future<List<HouseSpace>> requestHouseList(page) async{
    var uri = Uri.parse('${ApiConstants.baseUrl}/api/home/houselist?page=$page');

    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    final json = body['data'];

    List<HouseSpace> data = json.map<HouseSpace>((v)=>HouseSpace.fromJson(v)).toList();

    return data;
  }
}
import 'dart:convert' show jsonDecode;

import 'package:flutter_roam/api/api_constants.dart';
import 'package:http/http.dart' as http;

import '../util/preferences.dart';

class LoginApi{
  static passwordLogin(String username,String password) async {
    var uri = Uri.http(ApiConstants.postBase,'basic-auth/$username/$password');

    Map<String,String>headers = {};
    headers['Authorization'] = 'Basic ${ApiConstants.kBasic}';

    final response = await http.get(uri,headers: headers);
    if(response.statusCode == 200){
      var result = jsonDecode(response.body);
      if(result['authenticated'] == true){
        setToken(result['user']); // token;
      }else{
        throw Exception(response.body);
      }
    }else{
      throw Exception(response.body);
    }
  }


  static void setToken(String value){
    PreferencesUtil().setString(ApiConstants.authorization, value);
  }

  static String getToken(){
    return PreferencesUtil().getString(ApiConstants.authorization);
  }

  static void logout(){
    PreferencesUtil().remove(ApiConstants.authorization);
  }


}
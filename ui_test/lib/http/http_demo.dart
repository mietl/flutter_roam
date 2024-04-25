import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatefulWidget {
  const HttpDemo({super.key});

  @override
  State<HttpDemo> createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  var result = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('http')),
      body: Column(
        children: [
          _buildRequestButton('get请求',_getMethod),
          _buildRequestButton('post请求',_postMethod),
          Text("结果: $result")
        ],
      ),
      // body: ,
    );
  }

  _buildRequestButton(String textStr, onPressed){
    return ElevatedButton(onPressed: ()=> onPressed(), child: Text(textStr));
  }

  _getMethod() async {
      var uri = Uri.parse('http://httpbin.org/get?name=mietl');
      var response = await http.get(uri);

      if(response.statusCode == 200){
        setState(() {
          result = response.body;
        });
      }else{
        setState(() {
          result = "请求失败： status:${response.statusCode},body:${response.body}";
        });
      }
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');
  }

  _postMethod() async{
    var uri = Uri.http('httpbin.org','post');

    var response = await http.post(uri,body: {'name': 'doodle', 'color': 'blue'});
    if(response.statusCode  == 200){
      setState(() {
        result = 'post:${response.body}';
      });
    }else{
      setState(() {
        result = "请求失败： status:${response.statusCode},body:${response.body}";
      });
    }

  }



}

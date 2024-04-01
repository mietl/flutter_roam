import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/dart_model.dart';

class JsonParseDemo extends StatefulWidget {
  const JsonParseDemo({super.key});

  @override
  State<JsonParseDemo> createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  var result = '';
  var jsonStr = '{ "args": {}, "headers": { "Accept": "application/json", "Accept-Encoding": "gzip, deflate", "Accept-Language": "zh-CN,zh;q=0.9", "Host": "httpbin.org", "Referer": "http://httpbin.org/", "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36", "X-Amzn-Trace-Id": "Root=1-65dadc5d-6ec4ae500c5293e55a9c98d4" }, "origin": "157.254.20.4", "url": "http://httpbin.org/get" }';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('json解析')),
      body: Column(
        children: [
          _buildButton("json to Map",_jsonToMap),
          _buildButton('json to Model',jsonToModel),
          
          Text('View: $result')
        ],
      ),
    );
  }


  _buildButton(String text,VoidCallback onPressed){
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }


  void _jsonToMap() {
    Map<String,dynamic> map = jsonDecode(jsonStr);

    setState(() {
      result = map['origin'] +'  ' + map['url'];
    });
  }

  void jsonToModel() {
    Map<String,dynamic> map = jsonDecode(jsonStr);

    DartModel dm = DartModel.formJson(map);
  
    setState(() {
      result = '${dm.origin}  ${dm.headers?.userAgent}';
    });
  }
}

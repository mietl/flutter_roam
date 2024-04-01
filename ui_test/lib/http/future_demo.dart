import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/dart_model.dart';


class FutureDemo extends StatefulWidget {
  const FutureDemo({super.key});

  @override
  State<FutureDemo> createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FutureBuilder'),),
      body: FutureBuilder<DartModel>(
        future: _requestFutureData(),
        builder: (BuildContext context,snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return const Text('none');
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              return const Text("active");
            case ConnectionState.done:
              if(snapshot.hasError){
                return Text('Error: ${snapshot.error}',style: const TextStyle(color: Colors.red));
              }else{
                return Column(
                  children: [
                    Text('${snapshot.data?.origin}'),
                    Text('${snapshot.data?.url}'),
                  ],
                );
              }
          }
        },

      )
    );
  }

  Future<DartModel> _requestFutureData() async {
    var uri = Uri.parse('http://httpbin.org/get?name=mietl');
    final response = await http.get(uri);

    var json = jsonDecode(response.body);

    return DartModel.formJson(json);
  }
}

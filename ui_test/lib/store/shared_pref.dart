import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferDemo extends StatefulWidget {
  const SharedPreferDemo({super.key});

  @override
  State<SharedPreferDemo> createState() => _SharedPreferDemoState();
}

class _SharedPreferDemoState extends State<SharedPreferDemo> {
  String countStr = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shared_preferences'),
      ),
      body: Column(
        children: [
          OutlinedButton(onPressed: _increment,child: const Icon(Icons.add)),
          OutlinedButton(onPressed: _getLocalCount,child: const Icon(Icons.refresh)),
          Text(countStr),
          Text('结果: $localCount'),
        ],
      ),
    );
  }

  _increment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      countStr = '$countStr 1';
    });
    
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }

  _getLocalCount() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      localCount =  prefs.getInt('counter').toString();
    });
  }
}

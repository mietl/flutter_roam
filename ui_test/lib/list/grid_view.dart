import 'package:flutter/material.dart';

const cityNames = [
  '北京',
  '上海',
  '广州',
  '深圳',
  '杭州',
  '苏州',
  '成都',
  '武汉',
  '郑州',
  '洛阳',
  '厦门',
  '青岛',
  '拉萨'
];

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('网格')),
      body: GridView.count(crossAxisCount: 2,children: _buildGridChildren()),
    );
  }

  List<Widget> _buildGridChildren() {
    return cityNames.map((e) => _buildGridItem(e)).toList();
  }

  Widget _buildGridItem(text) {
    return Card(
      child: Center(
        child: Text(
            text,
          style: const TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
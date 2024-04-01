
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

class MyListView extends StatefulWidget {
  const MyListView({super.key});
  

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  bool isVertical = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('列表')),
      floatingActionButton:FloatingActionButton(
          onPressed: (){
            setState(() {
              isVertical = !isVertical;
            });
          },child: const Icon(Icons.crop_rotate),),
      body: SizedBox(
        height: isVertical?double.infinity:200,
        child: ListView(
          scrollDirection: isVertical?Axis.vertical:Axis.horizontal,
          children: _buildListChildren(),
        ),
      ),
    );
  }


  List<Widget> _buildListChildren(){
    return cityNames.map((city) => isVertical?_buildListTile(city):_buildRowTile(city)).toList();
  }


  Widget _buildListTile(city){
    return ListTile(
      title: Text(city),
      leading: const Icon(Icons.add_task),
      subtitle: const Text('hhh'),
    );
  }

  Widget _buildRowTile(city){
    return Container(
      alignment: Alignment.center,
      width: 140,
      decoration: BoxDecoration(
        color: const Color(0xFFEED16A),
        border: Border.all(color: const Color(0xFF424242))
      ),
      child: Text(city,style: const TextStyle(fontSize: 22)),
    );
  }
}
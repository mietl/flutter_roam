import 'package:flutter/material.dart';
import './grid_view.dart';


class MyScroll extends StatefulWidget {
  const MyScroll({super.key});

  @override
  State<MyScroll> createState() => _MyScrollState();
}


class _MyScrollState extends State<MyScroll> {
  final ScrollController _controller = ScrollController();
  List<String> cityNames = [
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
    '拉萨',
    '衡阳',
    '耒阳',
    '郑州'
  ];

  @override
  void initState() {
    _controller.addListener(() {
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
      //   滚动到底部
        loadMore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          controller: _controller ,
          children: cityNames.map((name)=>buildTile(name)).toList(),
        )),
    );
  }


  Widget buildTile(String name){
    return ListTile(title: Text(name),leading: const Icon(Icons.chalet_sharp));
  }

  Future<void> onRefresh() async{
    Future.delayed(const Duration(seconds: 3)).then((value) =>{
      setState(() {
        cityNames = cityNames.reversed.toList();
      })
    });
  }

  void loadMore() {
    Future.delayed(const Duration(seconds: 3),(){
      setState(() {
        List<String> list = ['添加数据1','添加数据2','添加数据3'];
        cityNames.addAll(list);
      });
    });

  }
}

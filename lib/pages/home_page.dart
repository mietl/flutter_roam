import 'package:flutter/material.dart';
import 'package:flutter_roam/api/home_api.dart';
import 'package:flutter_roam/util/extended.dart';
import 'package:flutter_roam/widgets/carousel_card.dart';
import 'package:flutter_roam/models/home/categories.dart';

import '../widgets/grid_card.dart';
import '../widgets/row_nav.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final List<String> imgList = List.generate(4, (index) => 'https://api.yimian.xyz/img?type=moe?T=$index');

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin{
  double _appbarOpacity = 0;
  double showAppbarPos = 140;
  List<HomeCategories> categories = [];

  @override
  void initState() {
    getHomeState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color(0xFFf9f9f9),
      body: Stack(
        children: [
          _buildView(),
          // 虽然设置Positioned但他的高度，依然是撑满屏幕 late fix
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(_appbarOpacity),)
          ),
        ],
      )
    );
  }

  _buildView() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification){
        if(notification is ScrollUpdateNotification &&
            notification.depth == 0){
          _observeScroll(notification.metrics.pixels);
        }
        return true;
      },
      child: ListView(
        children: [
          CarouselCard(imgList:imgList),
          SizedBox(height: 7.px),
          RowNavWidget(navList: categories),
          GridCard()
          // ...List.generate(1000, (index) => const ListTile(title: Text('测试'),))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _observeScroll(double pixels) {
    var opacity = pixels / showAppbarPos;
    if(opacity<0){
      opacity = 0;
    }else if(opacity > 1){
      opacity = 1;
    }
    setState(() {
      _appbarOpacity = opacity;
    });
  }

  void getHomeState() {
    HomeApi.requestCategories().then((value){
      setState(() {
        categories = value;
      });
    });
  }



}

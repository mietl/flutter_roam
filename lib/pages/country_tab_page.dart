import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_roam/api/country_api.dart';
import 'package:flutter_roam/models/country/house_space.dart';
import 'package:flutter_roam/widgets/house_card_item.dart';
import 'package:flutter_roam/widgets/loading_box.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CountryTabPage extends StatefulWidget {
  final String cid;

  const CountryTabPage({super.key,required this.cid});

  @override
  State<CountryTabPage> createState() => _CountryTabPageState();
}

class _CountryTabPageState extends State<CountryTabPage> with AutomaticKeepAliveClientMixin {
  bool _loading = true;
  int currentPage = 1;
  final ScrollController _scrollController = ScrollController();

  List<HouseSpace> houseList = [];

  @override
  void initState() {
    _loadHouseList();

    _scrollController.addListener(_handleScroll);
    super.initState();
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  _handleScroll(){
    // 滚动到底部
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      _loadHouseList();
    }
  }




  Future<bool> _loadHouseList() async {
    //動態内容卡片
    late List<HouseSpace> items;
    try {
      items = await  CountryApi.requestHouseList(currentPage);
    } catch (e) {
      log("requestHouseList:$e");
      return false;
    }finally{
      if (items.isNotEmpty) {
        currentPage++;
      }
      setState(() {
        _loading=false;
      });
    }

    houseList.addAll(items);
    return true;
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return LoadingBox(
      loading: _loading,
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: houseView(),
      )
    );
  }

  Future<bool> _onRefresh() async {
    currentPage = 1;
    houseList.clear();
    return _loadHouseList();
  }


  @override
  bool get wantKeepAlive => true;

  houseView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 14),
      child: MasonryGridView.count(
        controller: _scrollController,
        crossAxisCount: 2,
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
        itemCount: houseList.length,
        itemBuilder: (context,index){
          HouseSpace item = houseList[index];
          return HouseCardItem(item.discoveryContentType??3,item.data!);
        },
      ),
    );
  }

}

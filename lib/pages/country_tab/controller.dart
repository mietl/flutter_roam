import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_roam/models/country/house_space.dart';
import 'package:flutter_roam/api/country_api.dart';


class CountryTabController extends GetxController{
  final String cid;

  final loading = true.obs;
  final houseList = <HouseSpace>[].obs;


  int currentPage = 1;
  final ScrollController scrollController = ScrollController();

  CountryTabController(this.cid);

  @override
  void onInit(){
    loadHouseList();

    scrollController.addListener(_handleScroll);

    super.onInit();
  }

  @override
  void onClose(){
    scrollController.dispose();
  }


  Future<bool> onRefresh() async {
    currentPage = 1;
    houseList.clear();
    return loadHouseList();
  }


  _handleScroll(){
    // 滚动到底部
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      loadHouseList();
    }
  }

  Future<bool> loadHouseList() async {
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
      loading.value  = false;
    }

    houseList.addAll(items);
    return true;
  }

}
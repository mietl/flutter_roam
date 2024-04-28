import 'package:flutter/material.dart';
import 'package:flutter_roam/pages/country_tab/view.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String,dynamic>> series = [{
    "cid": '14',
    "title":'A'
  },{
    "cid":"2214",
    "title":"TestUI"
  }];

  @override
  initState(){
    super.initState();
    _tabController = TabController(length: series.length, vsync: this);

  }

  @override
  dispose(){
    super.dispose();
    _tabController.dispose();
  }

  get _tabBar => TabBar(
    isScrollable: true,

    tabAlignment: TabAlignment.start,
    indicatorSize: TabBarIndicatorSize.tab,
    // splashBorderRadius: BorderRadius.circular(18),
    controller: _tabController, tabs: series.map<Tab>((tab)=>Tab(text: tab["title"])).toList(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _tabBar,
      ),
      body: _buildTabViews()
    );
  }

  _buildTabViews() {
    return TabBarView(
        controller: _tabController,
        children: series.map<Widget>((tab)=>CountryTabPage(tab['cid'])).toList()
    );
  }
}

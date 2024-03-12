import 'package:flutter/material.dart';
import 'package:flutter_roam/pages/about_page.dart';
import 'package:flutter_roam/pages/home_page.dart';
import 'package:flutter_roam/pages/search_page.dart';

class RoamPage extends StatefulWidget {
  const RoamPage({super.key});

  @override
  State<RoamPage> createState() => _RoamPageState();
}

class _RoamPageState extends State<RoamPage> {
  int _index = 0;
  final pages = [
    MyHomePage(),
    SearchPage(),
    MyHomePage(),
    AboutPage(),
  ];

  switchPage(int selectedIndex){
    print(selectedIndex);
    setState(() {
      _index = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: pages,
      ),
      bottomNavigationBar:  NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: switchPage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.lens_outlined),
            label: "漫游",
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: "搜索",
          ),
          NavigationDestination(
            icon: Icon(Icons.cloud_queue),
            label: "云野",
          ),
          NavigationDestination(
            icon: Icon(Icons.nature_outlined),
            label: "我的",
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roam/models/home/categories.dart';
import 'package:flutter_roam/util/extended.dart';

class ToolNavBar extends StatelessWidget{
  final List<HomeCategories> navList;
  const ToolNavBar({super.key,required this.navList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration:  BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC7DAFD).withOpacity(.7),
            offset: const Offset(0,7),
            blurRadius: 64,
          ),
        ],
      ),
      child: _buildNavBar(),
    );
  }

  Widget _buildNavBar() {
    List<Widget> assignChildren = [];
    for(var item in navList){
      assignChildren.add(_buildNavBarItem(item));
    }

    int carvePos = (navList.length / 2 + 0.5).toInt();

    return Column(
      children: [
        Row(
          children: assignChildren.sublist(0,carvePos),
        ),
        const SizedBox(height: 7),
        Row(
          children: assignChildren.sublist(carvePos),
        )
      ],
    );
  }

  Widget _buildNavBarItem(HomeCategories item){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 0,
          child: GestureDetector(
            child: SizedBox(
              width: 70.px,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(item.pictureUrl??'',width: 30.px),
                  Text(item.title??'')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_roam/models/home/categories.dart';
import 'package:flutter_roam/util/extended.dart';

class RowNavWidget extends StatelessWidget{
  final List<HomeCategories> navList;
  const RowNavWidget({super.key, required this.navList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.16),
            offset: const Offset(0, 2),
            blurRadius: 12,
          ),
        ],
      ),
      // height: 66,
      child: SizedBox(
        height: 84,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: navList.map((e)=>_buildNavTile(e)).toList(),
        ),
      )
    );
  }

  Widget _buildNavTile(HomeCategories item){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 0,
          child: GestureDetector(
            child: SizedBox(
              width: 80.px,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(item.pictureUrl??'',width: 44.px),
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
import 'package:flutter/material.dart';
import 'package:flutter_roam/util/extended.dart';

import '../models/home/long_for.dart';

class RowNavWidget extends StatelessWidget{
  final LongFor entryLongFor;

  const RowNavWidget({super.key, required this.entryLongFor});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 7, 7, 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(entryLongFor.title??'',style: const TextStyle(fontSize: 17)),
            Text(entryLongFor.subtitle??'',style: const TextStyle(color: Color.fromRGBO(71,85,105,1),fontSize: 12)),
            const SizedBox(height: 11),
            Wrap(
              spacing: 7,
                runSpacing: 7,
              children: entryLongFor.list.map((e)=>_buildNavTile(e)).toList()
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNavTile(ListElement item){
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(7),
                child: Image.network(item.pictureUrl??'',
                    width: 80.px,
                    errorBuilder:(context, error,stackTrace)=>Image.asset('assets/img/top_bg_tile01.png',width: 80,)
                )),
            Container(
                width: 60.px,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFC7DAFD),
                  borderRadius: BorderRadius.circular(6),
                ),
                margin: const EdgeInsets.only(top: 7),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(item.city??'',style: const TextStyle(color: Color(0xFF0847BD)),)
            )
          ],
        ),
      ),
    );
  }
  
}
import 'package:flutter/material.dart';

import 'package:flutter_roam/models/country/house_space.dart';
import 'package:flutter_roam/widgets/star_rating.dart';
// import 'package:flutter_roam/util/extended.dart';
import '../util/assets_image.dart';
import '../util/color.dart';

class HouseCardItem extends StatelessWidget {
  final int discoveryContentType;
  final HouseSpaceData houseData;

  const HouseCardItem(this.discoveryContentType, this.houseData, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // openUrl(houseData.)
      },
      child: discoveryContentType == 3
        ? discoveryContentType3()
        : discoveryContentType9(),
    );
  }


  discoveryContentType3() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      clipBehavior: Clip.hardEdge,
      child: Column(children: [
        Stack(
          children: [
            Image.network(
              houseData.image?.url ?? '',
              width: houseData.image?.width?.toDouble(),
            ),
            starFavorite()
          ],
        ),
        bottomIntro()
      ]),
    );
  }

  bottomIntro() {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(7),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 17,
                color: Color(0xFF666666),
              ),
              Text(houseData.location ?? '',
                  style: const TextStyle(fontSize: 12))
            ],
          ),
          Text(
            houseData.houseName ?? '',
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
          Text(houseData.summaryText ?? '',
              style: const TextStyle(fontSize: 12, color: Color(0xFF222222))),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
              '¥${houseData.finalPrice}',
               style: const TextStyle(color: Color(0xFFED6D7B),fontSize: 14),
              ),
              const SizedBox(width: 4),
              Text(
                '¥${houseData.productPrice}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF999999),
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Color(0xFF999999),
                ),
              ),
              if(houseData.priceTipBadge != null) Container(
                margin: const EdgeInsets.only(left: 7),
                padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      Color(getHex(houseData.priceTipBadge?.gradient?.startColor)),
                      Color(getHex(houseData.priceTipBadge?.gradient?.endColor)),
                    ]
                  )
                ),
                child: Text(
                  houseData.priceTipBadge?.text ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(getHex(houseData.priceTipBadge?.color))
                  ),

                ),
              )
            ]
          )
        ]));
  }

  starFavorite(){
    return Positioned(
        right: 6,
        top: 4,
        child: Image.asset(AssetsImage.star,width: 36,height: 36,)
    );
  }

  discoveryContentType9() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Image.network(houseData.image?.url ?? ''),
            starFavorite(),
            floatBottomIntro()
          ],

        ));
  }

  floatBottomIntro(){
    // linear-gradient(179deg,rgba(0,0,0,0) 16%,rgba(0,0,0,.64))
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            stops: [0.16, 1.0],
            colors: [
              Colors.transparent,
              Color.fromRGBO(0, 0, 0, 0.64),
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(houseData.summaryText ?? '',
                style: const TextStyle(fontSize: 12, color: Colors.white)),
            Text(
              houseData.houseName ?? '',
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white
              ),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StarRating(rating: double.parse(houseData.commentScore??'0'),maxRating: 5),
                Text(
                  '¥${houseData.finalPrice}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    )
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}

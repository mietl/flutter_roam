import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


final json = [{
    "title": "旅游攻略",
    "text": "获取详细的旅游目的地信息，包括景点介绍、当地文化和旅行建议。获取详细的旅游目的地信息，包括景点介绍、当地文化和旅行建议。",
    'icon': 0xe6c5,
    'color': 'F0F6FE', // volume_up
    'iconColor': '3B82F6'
  },
  {
    "title": "行程规划",
    "text": "方便地规划您的行程并管理您的旅行细节。",
    'icon': 0xe351, // keyboard
    'color':'F2F5F9',
    'iconColor':'64748b'
  },
  {
    "title": "发现景点",
    "text": "找到最佳的景点和地标，安排您的旅行行程。",
    "icon": 0xe415,
    "color": "FCF2F2",
    "iconColor": "ef4444"
  },
  {
    "title": "景点推荐",
    "text": "探索当地最美的景点",
    'icon': 0xe176, // code
    'color':'FEFCEA',
    'iconColor': 'eab308'
  },
  {
    "title": "旅游指南",
    "text": "获取详细的旅游信息",
    'icon': 0xf69f, // desktop_windows
    'color':'F0F6FE',
    'iconColor': '15803d'
  }];


class CardModel {
  String title;
  String text;
  int icon;
  Color color;
  Color iconColor;

  CardModel({
    required this.title,
    required this.text,
    required this.icon,
    required this.color,
    required this.iconColor
  });


  static Color getHex(colorStr){
    return Color(int.parse('FF$colorStr',radix: 16));
  }
  
  factory CardModel.fromJson(Map<String, dynamic> json){
    return CardModel(title: json["title"], text: json["text"], icon: json["icon"], color: getHex(json['color']),iconColor: getHex(json['iconColor']));
  }
}


class GridCard extends StatelessWidget {
  GridCard({super.key});

  final List<CardModel> cards = json.map((e) => CardModel.fromJson(e)).toList();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildGridRows(),
    );
  }

  _buildGridRows() {
    List<Widget> children = [];

    List<CardModel> topCards = cards.sublist(0, 3);

    children.add(_buildGridRow(topCards,Alignment.topLeft));
    children.add(const SizedBox(height: 14));
    children.add(_buildGridRow(cards.sublist(3),Alignment.topCenter));


    return children;
  }

  Widget _buildGridRow(List<CardModel> topCards,Alignment iconAlign) {
    return IntrinsicHeight(
      child: Row(
        children: topCards.asMap().entries.map((MapEntry<int,CardModel> entry){
          int index = entry.key;
          CardModel card = entry.value;

          return _buildGridCol(card, index,iconAlign);
        }).toList(),
      ),
    );
  }

  Widget _buildGridCol(CardModel card,int index,Alignment iconAlign) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: index!=0?14:0),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: card.color,
          ),
          child: Column(
            children: [
                Align(alignment: iconAlign,child: Icon(color: card.iconColor,IconData(card.icon, fontFamily: 'MaterialIcons'))),
                Text(card.title,style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                )),
                const SizedBox(height: 7),
                Text(
                    card.text,
                    style: const TextStyle(
                      color: Color.fromRGBO(71,85,105,1),
                      fontSize: 14
                    ),
                    maxLines: 3, // 设置最大行数为3，超出部分将被省略
                )


            ],
          ),
        )
      ),
    );
  }
}




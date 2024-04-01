import 'package:flutter/material.dart';

const cityNames = {
  '北京': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区', '海淀区', '顺义区'],
  '上海': ['黄浦区', '徐汇区', '长宁区', '静安区', '普陀区', '闸北区', '虹口区'],
  '广州': ['越秀', '海珠', '荔湾', '天河', '白云', '黄埔', '南沙', '番禺'],
  '深圳': ['南山', '福田', '罗湖', '盐田', '龙岗', '宝安', '龙华'],
  '杭州': ['上城区', '下城区', '江干区', '拱墅区', '西湖区', '滨江区'],
  '苏州': ['姑苏区', '吴中区', '相城区', '高新区', '虎丘区', '工业园区', '吴江区']
};

class MyExpansionTile extends StatelessWidget {
  const MyExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: buildListChildren(),
      ),
    );
  }

  List<Widget> buildListChildren() {
    return cityNames.keys.map((key) => buildExpansion(key,cityNames[key]!)).toList();
  }

  Widget buildExpansion(String text,List<String> value) {
    return ExpansionTile(title: Text(text),children: value.map((e) => buildTile(e)).toList());
  }

  Widget buildTile(String text) {
    return ListTile(
      title: Text(text),
      leading: const Icon(Icons.sailing),
    );
  }
}

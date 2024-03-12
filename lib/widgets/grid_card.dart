import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF7676),
                Color(0xFF17EAD9)
              ],
              begin: Alignment.bottomLeft, // 渐变色起始点（左下角）
              end: Alignment.topRight, // 渐变色结束点（右上角）
            )
          ),
          child: Column(
            children: _buildGridRows(),
          ),
        ),
      ),
    );
  }

  _buildGridRows() {
    // 3行
    List<Widget> children = [];

    children.add(_buildGridRow());
    children.add(SizedBox(height: 3));
    children.add(_buildGridRow());

    return children;
  }


  Widget _buildGridRow(){
    List<Widget> cols = [];


    cols.add(Expanded(flex: 1, child: _buildGridCol()));
    cols.add(Expanded(flex: 1, child: _buildColumnCol()));
    cols.add(Expanded(flex: 1, child: _buildColumnCol()));

    return Container(
      height: 112,
      child: Row(
        children: cols,
      ),
    );
  }

  Widget _buildGridCol(){
    return GestureDetector(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: Text('测试',style: TextStyle(
              fontSize: 17
            ),),
          )
        ]
      ),
    );
  }


  Widget _buildColumnCol(){
    return GestureDetector(
      child: Column(
        children: [
          _buildColumnItem(false),
          _buildColumnItem(true),
        ]
      ),
    );
  }

  Widget _buildColumnItem(bool isBottom){
    BorderSide sideStyle = const BorderSide(width: 0.7,color: Colors.black);

    return Expanded(child: Container(
      decoration: BoxDecoration(
        border: Border(
          top: isBottom?sideStyle:BorderSide.none,
          left: sideStyle
        ),
      ),
      child: Center(
        child: Text('1'),
      ),
    ));
  }
}

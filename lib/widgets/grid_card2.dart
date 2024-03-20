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
        child: _buildBackground(
          Column(
            children: _buildGridRows(),
          )
        )
      )
    );
  }

  _buildBackground(Widget child){
    return Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.5, 0),
              colors: [
                Colors.transparent,
                Color.fromRGBO(127,165,233, 0.5),
              ],
              stops: [0, 0.75],
            ),
            backgroundBlendMode: BlendMode.srcOver,
          ),
          foregroundDecoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(1, 0),
              colors: [
                Colors.transparent,
                Color.fromRGBO(99,127,214, 0.4)
              ],
              stops: [0, 0.5],
            ),
            backgroundBlendMode: BlendMode.srcOver,
          ),
          child: child,
        );
  }

  _buildGridRows() {
    // 3行
    List<Widget> children = [];

    children.add(_buildGridRow());
    children.add(const SizedBox(height: 3));
    children.add(_buildGridRow());

    return children;
  }


  Widget _buildGridRow(){
    List<Widget> cols = [];


    cols.add(Expanded(flex: 1, child: _buildGridCol()));
    cols.add(Expanded(flex: 1, child: _buildColumnCol()));
    cols.add(Expanded(flex: 1, child: _buildColumnCol()));

    return SizedBox(
      height: 112,
      child: Row(
        children: cols,
      ),
    );
  }

  Widget _buildGridCol(){
    return GestureDetector(
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Text('测试',style: TextStyle(
            fontSize: 17
          ),)
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
      child: const Center(
        child: Text('1'),
      ),
    ));
  }
}

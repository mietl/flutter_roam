import 'package:flutter/material.dart';
import 'package:flutter_roam/util/extended.dart';

class LoadingBox extends StatelessWidget{
  final Widget child;
  final bool loading;

  const LoadingBox({super.key, required this.child, required this.loading});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         child,
         if(loading) indicator()
      ],
    );
  }

  Widget indicator(){
    return Center(
      child: Container(
        width: 60.px,
        height: 60.px,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color.fromRGBO(00,00,00,0.251)
        ),
        // https://github.com/flutter/website/pull/5010/commits/3070c777a61b493b46cdde92fa7afc21de7adf25
        child: SizedBox(
          width: 24.px,
          height: 24.px,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          ),
        ),
      ),
    );
  }

}
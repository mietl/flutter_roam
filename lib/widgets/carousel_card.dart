import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_roam/util/extended.dart';
import '../models/home/roam_image.dart';



class CarouselCard extends StatefulWidget {
  final List<RoamImage> imgList;
  final double height;
  const CarouselCard({super.key,required this.imgList,this.height = 140});

  @override
  State<CarouselCard> createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {
  int _current = 0;

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CarouselSlider(
                  items: buildImageSliders(),
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      height: widget.height,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                            ),
              ),
            Positioned(
              bottom: 7,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.white.withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  ));
                }).toList(),
              ),
            ),
      ]);
  }

  List<Widget> buildImageSliders() {
    double width = MediaQuery.of(context).size.width;

    final List<Widget> imageSliders = widget.imgList
        .map((item) => Stack(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  openUrl(item.url);
                },
                child: Image.network(item.src, fit: BoxFit.cover,width: width),
              )
            ]))
        .toList();

    return imageSliders;
  }

}

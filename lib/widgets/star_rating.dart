import 'package:flutter/material.dart';

class StarRating extends StatefulWidget{
  final double rating;
  final int maxRating;
  final int count;
  final double size;
  final Color solidColor;
  final Color borderColor;

  final Widget itemIcon;
  final Widget voidIcon;

  StarRating({super.key,
   required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 17,
    this.borderColor = Colors.transparent,
    this.solidColor = const Color(0xFFF7DBD5),
    Widget? itemIcon,
    Widget? voidIcon
  }): itemIcon = itemIcon ?? Icon(Icons.star,color: solidColor,size: size),
        voidIcon =  voidIcon ?? Icon(Icons.star_border,color:borderColor,size:size);

  @override
  State<StatefulWidget> createState() {
    return _StarRatingState();
  }


}

class _StarRatingState extends State<StarRating>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: borderStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: solidStar(),
        )
      ]
    );
  }

  List<Widget> borderStar() {
    return List.generate(widget.count, (_) => widget.voidIcon);
  }


  solidStar() {
    List<Widget> ratedStars = [];

    int value = (widget.maxRating / widget.count).floor();

    double starCount = widget.rating / value;

    int fullCount = starCount.floor();

    List<Widget> stars = List.generate(fullCount, (index) => widget.itemIcon);
    ratedStars.addAll(stars);

    double clipWidth = (starCount - fullCount) * widget.size;

    Widget halfStar =  ClipRect(
      clipper: StarClipper(clipWidth),
      child: widget.itemIcon,
    );

    // 填充部分的星星
    ratedStars.add(halfStar);

    if(ratedStars.length > widget.count){
      return ratedStars.sublist(0,widget.count);
    }

    return ratedStars;
  }
  
}

class StarClipper extends CustomClipper<Rect>{
  double width;

  StarClipper(this.width);
  
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0,0,width,size.height);
  }

  @override
  bool shouldReclip(StarClipper oldClipper) {
    return oldClipper.width != width;
  }
}
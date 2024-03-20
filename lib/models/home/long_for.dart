class LongFor {
  LongFor({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.list,
  });

  final String? id;
  final String? title;
  final String? subtitle;
  final String? type;
  final List<ListElement> list;

  factory LongFor.fromJson(Map<String, dynamic> json){
    return LongFor(
      id: json["_id"],
      title: json["title"],
      subtitle: json["subtitle"],
      type: json["type"],
      list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "subtitle": subtitle,
    "type": type,
    "list": list.map((x) => x.toJson()).toList(),
  };

  @override
  String toString(){
    return "$id, $title, $subtitle, $type, $list, ";
  }

}

class ListElement {
  ListElement({
    required this.city,
    required this.price,
    required this.pictureUrl,
    required this.imageUrl,
  });

  final String? city;
  final String? price;
  final String? pictureUrl;
  final String? imageUrl;

  factory ListElement.fromJson(Map<String, dynamic> json){
    return ListElement(
      city: json["city"],
      price: json["price"],
      pictureUrl: json["picture_url"],
      imageUrl: json["image_url"],
    );
  }

  Map<String, dynamic> toJson() => {
    "city": city,
    "price": price,
    "picture_url": pictureUrl,
    "image_url": imageUrl,
  };

  @override
  String toString(){
    return "$city, $price, $pictureUrl, $imageUrl, ";
  }

}

/*
{
	"_id": "6304294fc591817931daf32f",
	"title": "你可能想去",
	"subtitle": "发现更多出行灵感",
	"type": "discover",
	"list": [
		{
			"city": "成都",
			"price": "¥181/晚",
			"picture_url": "https://z1.muscache.cn/im/pictures/0aac97b6-429b-4be5-bfd8-68b0544411b3.jpg?aki_policy=large",
			"image_url": "/discover/a6c47ba93252b53564a128f821831939.jpg"
		},
	]
}*/
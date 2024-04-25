class HouseSpace {
  HouseSpace({
    required this.discoveryContentType,
    required this.data,
  });

  final int? discoveryContentType;
  final HouseSpaceData? data;

  factory HouseSpace.fromJson(Map<String, dynamic> json){
    return HouseSpace(
      discoveryContentType: json["discoveryContentType"],
      data: json["data"] == null ? null : HouseSpaceData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "discoveryContentType": discoveryContentType,
    "data": data?.toJson(),
  };

  @override
  String toString(){
    return "$discoveryContentType, $data, ";
  }

}

class HouseSpaceData {
  HouseSpaceData({
    required this.iconTag,
    required this.productPrice,
    required this.priceTipBadge,
    required this.houseAdvert,
    required this.activityInfo,
    required this.sellingPoint,
    required this.guideText,
    required this.referencePriceDesc,
    required this.poiLocation,
    required this.houseId,
    required this.houseName,
    required this.houseTags,
    required this.image,
    required this.commentScore,
    required this.extendMap,
    required this.summaryText,
    required this.showHouseVideo,
    required this.cityId,
    required this.finalPrice,
    required this.location,
  });

  final dynamic iconTag;
  final int? productPrice;
  final PriceTipBadge? priceTipBadge;
  final dynamic houseAdvert;
  final dynamic activityInfo;
  final dynamic sellingPoint;
  final dynamic guideText;
  final dynamic referencePriceDesc;
  final dynamic poiLocation;
  final int? houseId;
  final String? houseName;
  final dynamic houseTags;
  final Image? image;
  final String? commentScore;
  final ExtendMap? extendMap;
  final String? summaryText;
  final bool? showHouseVideo;
  final int? cityId;
  final int? finalPrice;
  final String? location;

  factory HouseSpaceData.fromJson(Map<String, dynamic> json){
    return HouseSpaceData(
      iconTag: json["iconTag"],
      productPrice: json["productPrice"],
      priceTipBadge: json["priceTipBadge"] == null ? null : PriceTipBadge.fromJson(json["priceTipBadge"]),
      houseAdvert: json["houseAdvert"],
      activityInfo: json["activityInfo"],
      sellingPoint: json["sellingPoint"],
      guideText: json["guideText"],
      referencePriceDesc: json["referencePriceDesc"],
      poiLocation: json["poiLocation"],
      houseId: json["houseId"],
      houseName: json["houseName"],
      houseTags: json["houseTags"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      commentScore: json["commentScore"],
      extendMap: json["extendMap"] == null ? null : ExtendMap.fromJson(json["extendMap"]),
      summaryText: json["summaryText"],
      showHouseVideo: json["showHouseVideo"],
      cityId: json["cityId"],
      finalPrice: json["finalPrice"],
      location: json["location"],
    );
  }

  Map<String, dynamic> toJson() => {
    "iconTag": iconTag,
    "productPrice": productPrice,
    "priceTipBadge": priceTipBadge?.toJson(),
    "houseAdvert": houseAdvert,
    "activityInfo": activityInfo,
    "sellingPoint": sellingPoint,
    "guideText": guideText,
    "referencePriceDesc": referencePriceDesc,
    "poiLocation": poiLocation,
    "houseId": houseId,
    "houseName": houseName,
    "houseTags": houseTags,
    "image": image?.toJson(),
    "commentScore": commentScore,
    "extendMap": extendMap?.toJson(),
    "summaryText": summaryText,
    "showHouseVideo": showHouseVideo,
    "cityId": cityId,
    "finalPrice": finalPrice,
    "location": location,
  };

  @override
  String toString(){
    return "$iconTag, $productPrice, $priceTipBadge, $houseAdvert, $activityInfo, $sellingPoint, $guideText, $referencePriceDesc, $poiLocation, $houseId, $houseName, $houseTags, $image, $commentScore, $extendMap, $summaryText, $showHouseVideo, $cityId, $finalPrice, $location, ";
  }

}

class ExtendMap {
  ExtendMap({
    required this.logicBit,
  });

  final String? logicBit;

  factory ExtendMap.fromJson(Map<String, dynamic> json){
    return ExtendMap(
      logicBit: json["logicBit"],
    );
  }

  Map<String, dynamic> toJson() => {
    "logicBit": logicBit,
  };

  @override
  String toString(){
    return "$logicBit, ";
  }

}

class Image {
  Image({
    required this.url,
    required this.width,
    required this.height,
  });

  final String? url;
  final int? width;
  final int? height;

  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
      url: json["url"],
      width: json["width"],
      height: json["height"],
    );
  }

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };

  @override
  String toString(){
    return "$url, $width, $height, ";
  }

}

class PriceTipBadge {
  PriceTipBadge({
    required this.type,
    required this.text,
    required this.color,
    required this.background,
    required this.border,
    required this.orderIndex,
    required this.tip,
    required this.jumpUrl,
    required this.colorType,
    required this.gradient,
  });

  final int? type;
  final String? text;
  final String? color;
  final dynamic background;
  final dynamic border;
  final int? orderIndex;
  final dynamic tip;
  final dynamic jumpUrl;
  final int? colorType;
  final Gradient? gradient;

  factory PriceTipBadge.fromJson(Map<String, dynamic> json){
    return PriceTipBadge(
      type: json["type"],
      text: json["text"],
      color: json["color"],
      background: json["background"],
      border: json["border"],
      orderIndex: json["orderIndex"],
      tip: json["tip"],
      jumpUrl: json["jumpUrl"],
      colorType: json["colorType"],
      gradient: json["gradient"] == null ? null : Gradient.fromJson(json["gradient"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "type": type,
    "text": text,
    "color": color,
    "background": background,
    "border": border,
    "orderIndex": orderIndex,
    "tip": tip,
    "jumpUrl": jumpUrl,
    "colorType": colorType,
    "gradient": gradient?.toJson(),
  };

  @override
  String toString(){
    return "$type, $text, $color, $background, $border, $orderIndex, $tip, $jumpUrl, $colorType, $gradient, ";
  }

}

class Gradient {
  Gradient({
    required this.startColor,
    required this.endColor,
  });

  final String? startColor;
  final String? endColor;

  factory Gradient.fromJson(Map<String, dynamic> json){
    return Gradient(
      startColor: json["startColor"],
      endColor: json["endColor"],
    );
  }

  Map<String, dynamic> toJson() => {
    "startColor": startColor,
    "endColor": endColor,
  };

  @override
  String toString(){
    return "$startColor, $endColor, ";
  }

}

/*
{
	"discoveryContentType": 9,
	"data": {
		"iconTag": null,
		"productPrice": 273,
		"priceTipBadge": {
			"type": 0,
			"text": "已减¥48",
			"color": "#FFFFFF",
			"background": null,
			"border": null,
			"orderIndex": 0,
			"tip": null,
			"jumpUrl": null,
			"colorType": 0,
			"gradient": {
				"startColor": "#FF6666",
				"endColor": "FF9F9F"
			}
		},
		"houseAdvert": null,
		"activityInfo": null,
		"sellingPoint": null,
		"guideText": null,
		"referencePriceDesc": null,
		"poiLocation": null,
		"houseId": 20061007,
		"houseName": "雅致中国风大床房/南站免费接送/近长隆/可开票",
		"houseTags": null,
		"image": {
			"url": "https://pic.tujia.com/upload/landlordunit/day_200105/thumb/202001051429207308_360_480.jpg",
			"width": 360,
			"height": 480
		},
		"commentScore": "4.9",
		"extendMap": {
			"logicBit": "2048"
		},
		"summaryText": "整套·1居1床 2人 4.9分",
		"showHouseVideo": false,
		"cityId": 45,
		"finalPrice": 225,
		"location": "广州·番禺区"
	}
}*/
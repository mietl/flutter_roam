class HomeCategories {
  HomeCategories({
    required this.pictures,
    required this.redPacketConfig,
    required this.content,
    required this.id,
    required this.testBucket,
    required this.title,
    required this.subTitle,
    required this.pictureUrl,
    required this.videoUrl,
    required this.subPictureUrl,
    required this.labels,
    required this.navigateUrl,
    required this.adCampaign,
  });

  final dynamic pictures;
  final dynamic redPacketConfig;
  final dynamic content;
  final String? id;
  final String? testBucket;
  final String? title;
  final String? subTitle;
  final String? pictureUrl;
  final String? videoUrl;
  final String? subPictureUrl;
  final List<dynamic> labels;
  final String? navigateUrl;
  final bool? adCampaign;

  factory HomeCategories.fromJson(Map<String, dynamic> json){
    return HomeCategories(
      pictures: json["pictures"],
      redPacketConfig: json["redPacketConfig"],
      content: json["content"],
      id: json["id"],
      testBucket: json["testBucket"],
      title: json["title"],
      subTitle: json["subTitle"],
      pictureUrl: json["pictureUrl"],
      videoUrl: json["videoUrl"],
      subPictureUrl: json["subPictureUrl"],
      labels: json["labels"] == null ? [] : List<dynamic>.from(json["labels"]!.map((x) => x)),
      navigateUrl: json["navigateUrl"],
      adCampaign: json["adCampaign"],
    );
  }

  Map<String, dynamic> toJson() => {
    "pictures": pictures,
    "redPacketConfig": redPacketConfig,
    "content": content,
    "id": id,
    "testBucket": testBucket,
    "title": title,
    "subTitle": subTitle,
    "pictureUrl": pictureUrl,
    "videoUrl": videoUrl,
    "subPictureUrl": subPictureUrl,
    "labels": labels.map((x) => x).toList(),
    "navigateUrl": navigateUrl,
    "adCampaign": adCampaign,
  };

  @override
  String toString(){
    return "$pictures, $redPacketConfig, $content, $id, $testBucket, $title, $subTitle, $pictureUrl, $videoUrl, $subPictureUrl, $labels, $navigateUrl, $adCampaign, ";
  }

}

/*
{
	"pictures": null,
	"redPacketConfig": null,
	"content": null,
	"id": "365738d8-fbfe-49d6-a7d6-681cfe6d34d5",
	"testBucket": "NONE",
	"title": "新房特惠",
	"subTitle": "",
	"pictureUrl": "https://pic.tujia.com/upload/resourcespic/day_201124/202011241613557364.png",
	"videoUrl": "",
	"subPictureUrl": "https://pic.tujia.com/upload/resourcespic/day_201124/202011241614014828.png",
	"labels": [],
	"navigateUrl": "https://m.tujia.com/hotel_beijing/6-1203/?ssr=off",
	"adCampaign": false
}*/
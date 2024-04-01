class SuggestsResult {
  SuggestsResult({
    required this.areaId,
    required this.areaType,
    required this.areaName,
    required this.regionPath,
    required this.combineConditions,
    required this.childItemGroups,
    required this.regionId,
    required this.regionPinyin,
    required this.itemType,
    required this.itemId,
    required this.itemSecondType,
    required this.itemShowName,
    required this.itemName,
    required this.commentScore,
    required this.suggestGroup,
    required this.itemTypeShowName,
    required this.preferenceTag,
    required this.unitPrice,
    required this.latitude,
    required this.longitude,
    required this.nationalType,
    required this.description,
    required this.iconType,
    required this.extraData,
    required this.extraDataForNode,
    required this.goLink,
    required this.suggestionConditionValue,
    required this.index,
    required this.itemShowNameHighLight,
    required this.matchInfo,
  });

  final int? areaId;
  final int? areaType;
  final String? areaName;
  final List<dynamic> regionPath;
  final List<dynamic> combineConditions;
  final List<dynamic> childItemGroups;
  final int? regionId;
  final String? regionPinyin;
  final int? itemType;
  final String? itemId;
  final int? itemSecondType;
  final String? itemShowName;
  final String? itemName;
  final int? commentScore;
  final int? suggestGroup;
  final String? itemTypeShowName;
  final dynamic preferenceTag;
  final int? unitPrice;
  final num? latitude;
  final num? longitude;
  final int? nationalType;
  final String? description;
  final int? iconType;
  final ExtraData? extraData;
  final ExtraDataForNode? extraDataForNode;
  final String? goLink;
  final String? suggestionConditionValue;
  final int? index;
  final List<dynamic> itemShowNameHighLight;
  final String? matchInfo;

  factory SuggestsResult.fromJson(Map<String, dynamic> json){
    return SuggestsResult(
      areaId: json["areaId"],
      areaType: json["areaType"],
      areaName: json["areaName"],
      regionPath: json["regionPath"] == null ? [] : List<dynamic>.from(json["regionPath"]!.map((x) => x)),
      combineConditions: json["combineConditions"] == null ? [] : List<dynamic>.from(json["combineConditions"]!.map((x) => x)),
      childItemGroups: json["childItemGroups"] == null ? [] : List<dynamic>.from(json["childItemGroups"]!.map((x) => x)),
      regionId: json["regionId"],
      regionPinyin: json["regionPinyin"],
      itemType: json["itemType"],
      itemId: json["itemId"],
      itemSecondType: json["itemSecondType"],
      itemShowName: json["itemShowName"],
      itemName: json["itemName"],
      commentScore: json["commentScore"],
      suggestGroup: json["suggestGroup"],
      itemTypeShowName: json["itemTypeShowName"],
      preferenceTag: json["preferenceTag"],
      unitPrice: json["unitPrice"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      nationalType: json["nationalType"],
      description: json["description"],
      iconType: json["iconType"],
      extraData: json["extraData"] == null ? null : ExtraData.fromJson(json["extraData"]),
      extraDataForNode: json["extraDataForNode"] == null ? null : ExtraDataForNode.fromJson(json["extraDataForNode"]),
      goLink: json["goLink"],
      suggestionConditionValue: json["suggestionConditionValue"],
      index: json["index"],
      itemShowNameHighLight: json["itemShowNameHighLight"] == null ? [] : List<dynamic>.from(json["itemShowNameHighLight"]!.map((x) => x)),
      matchInfo: json["matchInfo"],
    );
  }

  Map<String, dynamic> toJson() => {
    "areaId": areaId,
    "areaType": areaType,
    "areaName": areaName,
    "regionPath": regionPath.map((x) => x).toList(),
    "combineConditions": combineConditions.map((x) => x).toList(),
    "childItemGroups": childItemGroups.map((x) => x).toList(),
    "regionId": regionId,
    "regionPinyin": regionPinyin,
    "itemType": itemType,
    "itemId": itemId,
    "itemSecondType": itemSecondType,
    "itemShowName": itemShowName,
    "itemName": itemName,
    "commentScore": commentScore,
    "suggestGroup": suggestGroup,
    "itemTypeShowName": itemTypeShowName,
    "preferenceTag": preferenceTag,
    "unitPrice": unitPrice,
    "latitude": latitude,
    "longitude": longitude,
    "nationalType": nationalType,
    "description": description,
    "iconType": iconType,
    "extraData": extraData?.toJson(),
    "extraDataForNode": extraDataForNode?.toJson(),
    "goLink": goLink,
    "suggestionConditionValue": suggestionConditionValue,
    "index": index,
    "itemShowNameHighLight": itemShowNameHighLight.map((x) => x).toList(),
    "matchInfo": matchInfo,
  };

  @override
  String toString(){
    return "$areaId, $areaType, $areaName, $regionPath, $combineConditions, $childItemGroups, $regionId, $regionPinyin, $itemType, $itemId, $itemSecondType, $itemShowName, $itemName, $commentScore, $suggestGroup, $itemTypeShowName, $preferenceTag, $unitPrice, $latitude, $longitude, $nationalType, $description, $iconType, $extraData, $extraDataForNode, $goLink, $suggestionConditionValue, $index, $itemShowNameHighLight, $matchInfo, ";
  }

}

class ExtraData {
  ExtraData({
    required this.combinedMatchType,
    required this.nameMatchType,
    required this.addressMatchType,
  });

  final String? combinedMatchType;
  final String? nameMatchType;
  final String? addressMatchType;

  factory ExtraData.fromJson(Map<String, dynamic> json){
    return ExtraData(
      combinedMatchType: json["combined_match_type"],
      nameMatchType: json["name_match_type"],
      addressMatchType: json["address_match_type"],
    );
  }

  Map<String, dynamic> toJson() => {
    "combined_match_type": combinedMatchType,
    "name_match_type": nameMatchType,
    "address_match_type": addressMatchType,
  };

  @override
  String toString(){
    return "$combinedMatchType, $nameMatchType, $addressMatchType, ";
  }

}

class ExtraDataForNode {
  ExtraDataForNode({required this.json});
  final Map<String,dynamic> json;

  factory ExtraDataForNode.fromJson(Map<String, dynamic> json){
    return ExtraDataForNode(
        json: json
    );
  }

  Map<String, dynamic> toJson() => {
  };

  @override
  String toString(){
    return "";
  }

}

/*
{
	"areaId": 45,
	"areaType": 0,
	"areaName": "广州",
	"regionPath": [],
	"combineConditions": [],
	"childItemGroups": [],
	"regionId": 45,
	"regionPinyin": "guangzhou",
	"itemType": 5,
	"itemId": "1171822",
	"itemSecondType": 18,
	"itemShowName": "华南国家计量测试中心",
	"itemName": "华南国家计量测试中心",
	"commentScore": 0,
	"suggestGroup": 1,
	"itemTypeShowName": "机构",
	"preferenceTag": null,
	"unitPrice": 0,
	"latitude": 23.203802,
	"longitude": 113.55806,
	"nationalType": 1,
	"description": "周边约有386套民宿",
	"iconType": 3,
	"extraData": {
		"combined_match_type": "ori_full_contains",
		"name_match_type": "ori_full_contains",
		"address_match_type": "no_match"
	},
	"extraDataForNode": {},
	"goLink": "",
	"suggestionConditionValue": "18_1171822",
	"index": 4,
	"itemShowNameHighLight": [],
	"matchInfo": ""
}*/
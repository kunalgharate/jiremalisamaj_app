// To parse this JSON data, do
//
//     final fileUploadModel = fileUploadModelFromJson(jsonString);

import 'dart:convert';

FileUploadModel fileUploadModelFromJson(String str) => FileUploadModel.fromJson(json.decode(str));

String fileUploadModelToJson(FileUploadModel data) => json.encode(data.toJson());

class FileUploadModel {
  int? status;
  bool? success;
  Data? data;

  FileUploadModel({
    this.status,
    this.success,
    this.data,
  });

  factory FileUploadModel.fromJson(Map<String, dynamic> json) => FileUploadModel(
    status: json["status"],
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? deletehash;
  int? accountId;
  String? accountUrl;
  dynamic adType;
  dynamic adUrl;
  dynamic title;
  dynamic description;
  String? name;
  String? type;
  int? width;
  int? height;
  int? size;
  int? views;
  dynamic section;
  dynamic vote;
  int? bandwidth;
  bool? animated;
  bool? favorite;
  bool? inGallery;
  bool? inMostViral;
  bool? hasSound;
  bool? isAd;
  dynamic nsfw;
  String? link;
  List<dynamic>? tags;
  int? datetime;
  dynamic mp4;
  dynamic hls;

  Data({
    this.id,
    this.deletehash,
    this.accountId,
    this.accountUrl,
    this.adType,
    this.adUrl,
    this.title,
    this.description,
    this.name,
    this.type,
    this.width,
    this.height,
    this.size,
    this.views,
    this.section,
    this.vote,
    this.bandwidth,
    this.animated,
    this.favorite,
    this.inGallery,
    this.inMostViral,
    this.hasSound,
    this.isAd,
    this.nsfw,
    this.link,
    this.tags,
    this.datetime,
    this.mp4,
    this.hls,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    deletehash: json["deletehash"],
    accountId: json["account_id"],
    accountUrl: json["account_url"],
    adType: json["ad_type"],
    adUrl: json["ad_url"],
    title: json["title"],
    description: json["description"],
    name: json["name"],
    type: json["type"],
    width: json["width"],
    height: json["height"],
    size: json["size"],
    views: json["views"],
    section: json["section"],
    vote: json["vote"],
    bandwidth: json["bandwidth"],
    animated: json["animated"],
    favorite: json["favorite"],
    inGallery: json["in_gallery"],
    inMostViral: json["in_most_viral"],
    hasSound: json["has_sound"],
    isAd: json["is_ad"],
    nsfw: json["nsfw"],
    link: json["link"],
    tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
    datetime: json["datetime"],
    mp4: json["mp4"],
    hls: json["hls"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "deletehash": deletehash,
    "account_id": accountId,
    "account_url": accountUrl,
    "ad_type": adType,
    "ad_url": adUrl,
    "title": title,
    "description": description,
    "name": name,
    "type": type,
    "width": width,
    "height": height,
    "size": size,
    "views": views,
    "section": section,
    "vote": vote,
    "bandwidth": bandwidth,
    "animated": animated,
    "favorite": favorite,
    "in_gallery": inGallery,
    "in_most_viral": inMostViral,
    "has_sound": hasSound,
    "is_ad": isAd,
    "nsfw": nsfw,
    "link": link,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "datetime": datetime,
    "mp4": mp4,
    "hls": hls,
  };
}

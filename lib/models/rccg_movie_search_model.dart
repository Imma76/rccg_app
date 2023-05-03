// To parse this JSON data, do
//
//     final rccgMovieSearchModel = rccgMovieSearchModelFromJson(jsonString);

import 'dart:convert';

ChristianMovieModel rccgMovieSearchModelFromJson(String str) => ChristianMovieModel.fromJson(json.decode(str));

String rccgMovieSearchModelToJson(ChristianMovieModel data) => json.encode(data.toJson());

class ChristianMovieModel {
  ChristianMovieModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.regionCode,
    this.pageInfo,
    this.videoDetails,
  });

  String? kind;
  String? etag;
  String? nextPageToken;
  String? regionCode;
  PageInfo? pageInfo;
  List<SearchVideoItem>? videoDetails;

  factory ChristianMovieModel.fromJson(Map<String, dynamic> json) => ChristianMovieModel(
    kind: json["kind"],
    etag: json["etag"],
    nextPageToken: json["nextPageToken"],
    regionCode: json["regionCode"],
    pageInfo: json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
    videoDetails: json["items"] == null ? [] : List<SearchVideoItem>.from(json["items"]!.map((x) => SearchVideoItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "nextPageToken": nextPageToken,
    "regionCode": regionCode,
    "pageInfo": pageInfo?.toJson(),
    "items": videoDetails == null ? [] : List<dynamic>.from(videoDetails!.map((x) => x.toJson())),
  };
}

class SearchVideoItem {
  SearchVideoItem({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  String? kind;
  String? etag;
  VideoId? id;
  SearchVideoDetails? snippet;

  factory SearchVideoItem.fromJson(Map<String, dynamic> json) => SearchVideoItem(
    kind: json["kind"],
    etag: json["etag"],
    id: json["id"] == null ? null : VideoId.fromJson(json["id"]),
    snippet: json["snippet"] == null ? null : SearchVideoDetails.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "id": id?.toJson(),
    "snippet": snippet?.toJson(),
  };
}

class VideoId {
  VideoId({
    this.kind,
    this.videoUrl,
  });

  String? kind;
  String? videoUrl;

  factory VideoId.fromJson(Map<String, dynamic> json) => VideoId(
    kind: json["kind"],
    videoUrl: json["videoId"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "videoId": videoUrl,
  };
}

class SearchVideoDetails {
  SearchVideoDetails({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.liveBroadcastContent,
    this.publishTime,
  });

  DateTime? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  String? liveBroadcastContent;
  DateTime? publishTime;

  factory SearchVideoDetails.fromJson(Map<String, dynamic> json) => SearchVideoDetails(
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    channelId: json["channelId"],
    title: json["title"],
    description: json["description"],
    thumbnails: json["thumbnails"] == null ? null : Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: json["channelTitle"],
    liveBroadcastContent: json["liveBroadcastContent"],
    publishTime: json["publishTime"] == null ? null : DateTime.parse(json["publishTime"]),
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt?.toIso8601String(),
    "channelId": channelId,
    "title": title,
    "description": description,
    "thumbnails": thumbnails?.toJson(),
    "channelTitle": channelTitle,
    "liveBroadcastContent": liveBroadcastContent,
    "publishTime": publishTime?.toIso8601String(),
  };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
  });

  Default? thumbnailsDefault;
  Default? medium;
  Default? high;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: json["default"] == null ? null : Default.fromJson(json["default"]),
    medium: json["medium"] == null ? null : Default.fromJson(json["medium"]),
    high: json["high"] == null ? null : Default.fromJson(json["high"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault?.toJson(),
    "medium": medium?.toJson(),
    "high": high?.toJson(),
  };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  int? width;
  int? height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  int? totalResults;
  int? resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    totalResults: json["totalResults"],
    resultsPerPage: json["resultsPerPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults,
    "resultsPerPage": resultsPerPage,
  };
}

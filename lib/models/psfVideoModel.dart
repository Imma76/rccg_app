// To parse this JSON data, do
//
//     final psfVideosList = psfVideosListFromJson(jsonString);

//model class for the psf youtube channel videos api
import 'dart:convert';

PsfVideosList psfVideosListFromJson(String str) =>
    PsfVideosList.fromJson(json.decode(str));

String psfVideosListToJson(PsfVideosList data) => json.encode(data.toJson());

class PsfVideosList {
  PsfVideosList({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.psfvideos,
    this.pageInfo,
  });

  String? kind;
  String? etag;
  String? nextPageToken;
  List<PsfVideoItem>? psfvideos;
  PageInfo? pageInfo;

  factory PsfVideosList.fromJson(Map<String, dynamic> json) => PsfVideosList(
    kind: json["kind"],
    etag: json["etag"],
    nextPageToken: json["nextPageToken"],
    psfvideos: List<PsfVideoItem>.from(
        json["items"].map((x) => PsfVideoItem.fromJson(x))),
    pageInfo: PageInfo.fromJson(json["pageInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "nextPageToken": nextPageToken,
    "items": List<dynamic>.from(psfvideos!.map((x) => x.toJson())),
    "pageInfo": pageInfo!.toJson(),
  };
}

class PsfVideoItem {
  PsfVideoItem({
    this.kind,
    this.etag,
    this.id,
    this.psfsnippet,
  });

  String? kind;
  String? etag;
  String? id;
  PsfVideo? psfsnippet;

  factory PsfVideoItem.fromJson(Map<String, dynamic> json) => PsfVideoItem(
    kind: json["kind"],
    etag: json["etag"],
    id: json["id"],
    psfsnippet: PsfVideo.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "id": id,
    "snippet": psfsnippet!.toJson(),
  };
}

class PsfVideo {
  PsfVideo({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.playlistId,
    this.position,
    this.resourceId,
    this.videoOwnerChannelTitle,
    this.videoOwnerChannelId,
  });

  DateTime? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  String? playlistId;
  int? position;
  ResourceId? resourceId;
  String? videoOwnerChannelTitle;
  String? videoOwnerChannelId;

  factory PsfVideo.fromJson(Map<String, dynamic> json) => PsfVideo(
    publishedAt: DateTime.parse(json["publishedAt"]),
    channelId: json["channelId"],
    title: json["title"],
    description: json["description"],
    thumbnails: Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: json["channelTitle"],
    playlistId: json["playlistId"],
    position: json["position"],
    resourceId: ResourceId.fromJson(json["resourceId"]),
    videoOwnerChannelTitle: json["videoOwnerChannelTitle"],
    videoOwnerChannelId: json["videoOwnerChannelId"],
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt!.toIso8601String(),
    "channelId": channelId,
    "title": title,
    "description": description,
    "thumbnails": thumbnails!.toJson(),
    "channelTitle": channelTitle,
    "playlistId": playlistId,
    "position": position,
    "resourceId": resourceId!.toJson(),
    "videoOwnerChannelTitle": videoOwnerChannelTitle,
    "videoOwnerChannelId": videoOwnerChannelId,
  };
}

class ResourceId {
  ResourceId({
    this.kind,
    this.videoId,
  });

  String? kind;
  String? videoId;

  factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
    kind: json["kind"],
    videoId: json["videoId"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "videoId": videoId,
  };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  Default? thumbnailsDefault;
  Default? medium;
  Default? high;
  Default? standard;
  Default? maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: Default.fromJson(json["default"]),
    medium: Default.fromJson(json["medium"]),
    high: Default.fromJson(json["high"]),
    standard: null == json["standard"]
        ? null
        : Default.fromJson(json["standard"]),
    maxres:
    null == json["maxres"] ? null : Default.fromJson(json["maxres"]),
  );
  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault!.toJson(),
    "medium": medium!.toJson(),
    "high": high!.toJson(),
    "standard": standard!.toJson(),
    "maxres": maxres == null ? null : maxres!.toJson(),
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

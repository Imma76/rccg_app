// // To parse this JSON data, do
// //
// //     final allInfo = allInfoFromJson(jsonString);
//
// // model class for the rccg youtube channel videos api
// import 'dart:convert';
//
// AllInfo allInfoFromJson(String str) => AllInfo.fromJson(json.decode(str));
//
// String allInfoToJson(AllInfo data) => json.encode(data.toJson());
//
// class AllInfo {
//   AllInfo({
//     this.kind,
//     this.etag,
//     this.nextPageToken,
//     this.allvideos,
//     this.pageInfo,
//   });
//
//   String? kind;
//   String? etag;
//   String? nextPageToken;
//   List<AllVideoItem>? allvideos;
//   PageInfo? pageInfo;
//
//   factory AllInfo.fromJson(Map<String, dynamic> json) => AllInfo(
//         kind: json["kind"],
//         etag: json["etag"],
//         nextPageToken: json["nextPageToken"],
//         allvideos: List<AllVideoItem>.from(
//             json["items"].map((x) => AllVideoItem.fromJson(x))),
//         pageInfo: PageInfo.fromJson(json["pageInfo"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "kind": kind,
//         "etag": etag,
//         "nextPageToken": nextPageToken,
//         "items": List<dynamic>.from(allvideos!.map((x) => x.toJson())),
//         "pageInfo": pageInfo!.toJson(),
//       };
// }
//
// class AllVideoItem {
//   AllVideoItem({
//     this.kind,
//     this.etag,
//     this.id,
//     this.allvideo,
//   });
//
//   String kind;
//   String etag;
//   String id;
//   AllVideo allvideo;
//
//   factory AllVideoItem.fromJson(Map<String, dynamic> json) => AllVideoItem(
//         kind: json["kind"],
//         etag: json["etag"],
//         id: json["id"],
//         allvideo: AllVideo.fromJson(json["snippet"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "kind": kind,
//         "etag": etag,
//         "id": id,
//         "snippet": allvideo.toJson(),
//       };
// }
//
// class AllVideo {
//   AllVideo({
//     this.publishedAt,
//     this.channelId,
//     this.title,
//     this.description,
//     this.thumbnails,
//     this.channelTitle,
//     this.playlistId,
//     this.position,
//     this.resourceId,
//     this.videoOwnerChannelTitle,
//     this.videoOwnerChannelId,
//   });
//
//   DateTime publishedAt;
//   String channelId;
//   String title;
//   String description;
//   Thumbnails thumbnails;
//   String channelTitle;
//   String playlistId;
//   int position;
//   ResourceId resourceId;
//   String videoOwnerChannelTitle;
//   String videoOwnerChannelId;
//
//   factory AllVideo.fromJson(Map<String, dynamic> json) => AllVideo(
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         channelId: json["channelId"],
//         title: json["title"],
//         description: json["description"],
//         thumbnails: Thumbnails.fromJson(json["thumbnails"]),
//         channelTitle: json["channelTitle"],
//         playlistId: json["playlistId"],
//         position: json["position"],
//         resourceId: ResourceId.fromJson(json["resourceId"]),
//         videoOwnerChannelTitle: json["videoOwnerChannelTitle"],
//         videoOwnerChannelId: json["videoOwnerChannelId"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "publishedAt": publishedAt.toIso8601String(),
//         "channelId": channelId,
//         "title": title,
//         "description": description,
//         "thumbnails": thumbnails.toJson(),
//         "channelTitle": channelTitle,
//         "playlistId": playlistId,
//         "position": position,
//         "resourceId": resourceId.toJson(),
//         "videoOwnerChannelTitle": videoOwnerChannelTitle,
//         "videoOwnerChannelId": videoOwnerChannelId,
//       };
// }
//
// class ResourceId {
//   ResourceId({
//     this.kind,
//     this.videoId,
//   });
//
//   String kind;
//   String videoId;
//
//   factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
//         kind: json["kind"],
//         videoId: json["videoId"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "kind": kind,
//         "videoId": videoId,
//       };
// }
//
// class Thumbnails {
//   Thumbnails({
//     this.thumbnailsDefault,
//     this.medium,
//     this.high,
//     this.standard,
//     this.maxres,
//   });
//
//   Default thumbnailsDefault;
//   Default medium;
//   Default high;
//   Default standard;
//   Default maxres;
//
//   factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
//         thumbnailsDefault: Default.fromJson(json["default"]),
//         medium: Default.fromJson(json["medium"]),
//         high: Default.fromJson(json["high"]),
//         standard: null == json["standard"]
//             ? null
//             : Default.fromJson(json["standard"]),
//         maxres:
//             null == json["maxres"] ? null : Default.fromJson(json["maxres"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "default": thumbnailsDefault.toJson(),
//         "medium": medium.toJson(),
//         "high": high.toJson(),
//         "standard": standard.toJson(),
//         "maxres": maxres.toJson(),
//       };
// }
//
// class Default {
//   Default({
//     this.url,
//     this.width,
//     this.height,
//   });
//
//   String url;
//   int width;
//   int height;
//
//   factory Default.fromJson(Map<String, dynamic> json) => Default(
//         url: json["url"],
//         width: json["width"],
//         height: json["height"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "url": url,
//         "width": width,
//         "height": height,
//       };
// }
//
// class PageInfo {
//   PageInfo({
//     this.totalResults,
//     this.resultsPerPage,
//   });
//
//   int totalResults;
//   int resultsPerPage;
//
//   factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
//         totalResults: json["totalResults"],
//         resultsPerPage: json["resultsPerPage"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "totalResults": totalResults,
//         "resultsPerPage": resultsPerPage,
//       };
// }
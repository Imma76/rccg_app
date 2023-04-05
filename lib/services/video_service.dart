import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rccg_app/models/adeboye_sermon_model.dart';
import 'package:rccg_app/models/rccg_movie_search_model.dart';
import '../models/feastOfEsther.dart';
import '../models/holy_ghost_service.dart';
import '../models/mmp_channel_info_model.dart';
import '../models/mmp_video_model.dart';
import '../models/mount_zion_movies.dart';
import '../models/psfChannellnfo.dart';
import '../models/psfVideoModel.dart';
import '../models/rccg_channel_info.dart';
import '../models/rccg_program_model.dart';
import '../models/rccg_videos_playlist.dart';
import '../models/youth_convention_model.dart';
// service class id=s for getting the various programs videosList and channel from the api endpoint
class ProgramService {
  static const key = 'AIzaSyAk_kh4x-TjjsuxkQV-xCmAAAUEE6bE8x8';
      //'AIzaSyBJo-j8yDMT6A9alt5e2abjiuOyk3LXd-s';
  static const channel_id = 'UCHp4qCAPmz7-5BJ601FDFnA';
  static const baseUrl = 'youtube.googleapis.com';
  static const psf_channel_id = 'UC6ImVeZBcRIKamgXC9BkGww';
  static const mmp_channel_id = 'UC8JqsCeV4IT5fb-KWAjLQOQ';
  static const adeboyeSermonPlaylistId ='PLY2UjBLMXLF2eHzRHGaNZHQFaoic-X5Em';
  static const holyGhostServicePlaylistId = 'PLY2UjBLMXLF2sLHc3Oy-aPF07wq2aj2X5';
  static const youthConventionPlaylistId = 'PLY2UjBLMXLF2UeFa2_zDUAP_hjtGwWdfg';
  //     curl \
  // 'https://youtube.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=rccglive&access_token=AIzaSyBJo-j8yDMT6A9alt5e2abjiuOyk3LXd-s&key=[YOUR_API_KEY]' \
  // --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  // --header 'Accept: application/json' \
  // --compressed

// code for getting the rccg channel info
  static Future<RccgProgramChannelInfo> getRccgProgramInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': channel_id,
      'key': key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(baseUrl, '/youtube/v3/channels', parameters);
    Response response = await http.get(uri, headers: headers);
    //print(response.body);
    RccgProgramChannelInfo rccgProgram = rccgProgramFromJson(response.body);

    return rccgProgram;
  }
  static Future<ChristianMovieModel> getSearchedMovies() async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'type':'christian movies',
      'forMine':'0',
      'key': 'AIzaSyCqKNPqh9CJbjc4MSVbsiNFeiTDb31Aq6Q'
      //'AIzaSyB6N2UIi4BfnM9AzARoRlWfaEVo7VpRMJc',

    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.parse('https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=christian%20movies&type=video&videoDuration=long&access_token=AIzaSyB6N2UIi4BfnM9AzARoRlWfaEVo7VpRMJc&type=video&access_token=AIzaSyB6N2UIi4BfnM9AzARoRlWfaEVo7VpRMJc&key=$key');
    Response response = await http.get(uri, headers: headers);
    print(response.body);
    ChristianMovieModel rccgMovie = rccgMovieSearchModelFromJson(response.body);

    return rccgMovie;
  }

  static Future<MountZionMovies> getMountZionMovies() async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'type':'christian movies',
      'forMine':'0',
      'key': 'AIzaSyCqKNPqh9CJbjc4MSVbsiNFeiTDb31Aq6Q'
      //'AIzaSyB6N2UIi4BfnM9AzARoRlWfaEVo7VpRMJc',

    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.parse('https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=Mount%20zion%20movies&type=video&videoDuration=long&access_token=AIzaSyB6N2UIi4BfnM9AzARoRlWfaEVo7VpRMJc&type=video&access_token=AIzaSyB6N2UIi4BfnM9AzARoRlWfaEVo7VpRMJc&key=$key');
    Response response = await http.get(uri, headers: headers);
    print(response.body);
    MountZionMovies result = mountZionMoviesFromJson(response.body);

    return result;
  }
  static Future<FeastofEsther> getFeastOfEsther() async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'type':'christian movies',
      'forMine':'0',
      'key': 'AIzaSyCqKNPqh9CJbjc4MSVbsiNFeiTDb31Aq6Q'
      //'AIzaSyB6N2UIi4BfnM9AzARoRlWfaEVo7VpRMJc',

    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.parse('https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=feast%20movies&type=video&videoDuration=long&access_token=AIzaSyB6N2UIi4BfnM9AzARoRlWfaEVo7VpRMJc&type=video&access_token=AIzaSyB6N2UIi4BfnM9AzARoRlWfaEVo7VpRMJc&key=$key');
    Response response = await http.get(uri, headers: headers);
    print(response.body);
    FeastofEsther feastofEsther = feastofEstherFromJson(response.body);

    return feastofEsther;
  }


  static Future<RccgProgramModel> getRccgProgramModelVideos( {String? playlistId, String? pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId.toString(),
      'maxResults': '50',
      'pageToken': '',
      'key': key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(baseUrl, '/youtube/v3/playlistItems', parameters);
    Response response = await http.get(uri, headers: headers);
    print(response.body);
    RccgProgramModel? rccgProgramModel = rccgProgramModelFromJson(response.body);

    return rccgProgramModel;
  }

  static Future<PAdeboyeSermonModel> getPaAdeboyeVideos( {String? pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': adeboyeSermonPlaylistId,
      'maxResults': '50',
      'pageToken': '',
      'key': key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(baseUrl, '/youtube/v3/playlistItems', parameters);
    Response response = await http.get(uri, headers: headers);
    print(response.body);
    PAdeboyeSermonModel? pAdeboyeSermonModel =pAdeboyeSermonModelFromJson(response.body);

    return pAdeboyeSermonModel;
  }
  static Future<YouthConventionModel> getYouthConventionVideos( {String? pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': youthConventionPlaylistId,
      'maxResults': '50',
      'pageToken': '',
      'key': key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(baseUrl, '/youtube/v3/playlistItems', parameters);
    Response response = await http.get(uri, headers: headers);
    print(response.body);
    YouthConventionModel? youthConventionModel =youthConventionModelFromJson(response.body);

    return youthConventionModel;
  }

  static Future<HolyGhostServiceModel> getHolyGhostVideos( {String? pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': holyGhostServicePlaylistId,
      'maxResults': '50',
      'pageToken': '',
      'key': key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(baseUrl, '/youtube/v3/playlistItems', parameters);
    Response response = await http.get(uri, headers: headers);
    print(response.body);
    HolyGhostServiceModel
    ? holyGhostServiceModel
    =holyGhostServiceModelFromJson(response.body);

    return holyGhostServiceModel;
  }

// code for getting the psf channel info
  static Future<PsfChannelInfo> getPsfChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': psf_channel_id,
      'key': key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(baseUrl, '/youtube/v3/channels', parameters);
    Response response = await http.get(uri, headers: headers);
    //  print(response.body);
    PsfChannelInfo psfchannelInfo = psfChannelInfoFromJson(response.body);

    return psfchannelInfo;
  }

//code for getting the mmp channel info
  static Future<MmpChannelInfo> getMmpChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': mmp_channel_id,
      'key': key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(baseUrl, '/youtube/v3/channels', parameters);
    Response response = await http.get(uri, headers: headers);
    //  print(response.body);
    MmpChannelInfo mmpchannelInfo = mmpChannelInfoFromJson(response.body);

    return mmpchannelInfo;
  }

// code for getting the all videos list from rccg
//   static Future<AllInfo> getAllVideosList(
//       {String? playlistId, String? pageToken}) async {
//     Map<String, String> parameters = {
//       'part': 'snippet',
//       'playlistId': playlistId.toString(),
//       'maxResults': '50',
//       'pageToken': pageToken.toString(),
//       'key': key,
//     };
//     Map<String, String> headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };
//     Uri uri = Uri.https(baseUrl, '/youtube/v3/playlistItems', parameters);
//     Response response = await http.get(uri, headers: headers);
// // print(response.body);
//     AllInfo videoList = allInfoFromJson(response.body);
//     return videoList;
//   }

// code for getting the psf videos list
  static Future<PsfVideosList> getPsfVideosList(
      {String? playlistId, String? pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId.toString(),
      'maxResults': '50',
      'pageToken':'',
      'key': key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(baseUrl, '/youtube/v3/playlistItems', parameters);
    Response response = await http.get(uri, headers: headers);

    PsfVideosList videoList = psfVideosListFromJson(response.body);

    return videoList;
  }

//code for getting the mmp videosList
  static Future<MmpVideosList> getMmpVideosList(
      {String? playlistId, String? pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId.toString(),
      'maxResults': '50',
      'pageToken': '',
      'key': key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(baseUrl, '/youtube/v3/playlistItems', parameters);
    Response response = await http.get(uri, headers: headers);

    MmpVideosList videoList = mmpVideosListFromJson(response.body);

    return videoList;
  }
}

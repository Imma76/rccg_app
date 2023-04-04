import 'package:flutter/material.dart';
import 'package:rccg_app/models/adeboye_sermon_model.dart';
import 'package:rccg_app/models/mmp_channel_info_model.dart';
import 'package:rccg_app/models/mmp_video_model.dart';
import 'package:rccg_app/models/rccg_movie_search_model.dart';
import 'package:rccg_app/models/rccg_program_model.dart';
import 'package:rccg_app/services/video_service.dart';

import '../models/rccg_channel_info.dart';

class ProgramController extends ChangeNotifier{
  RccgProgramChannelInfo? rccgProgramChannelInfo;
  RccgProgramModel? rccgProgramModel;
  ChristianMovieModel?christianMovieModel;
  MmpChannelInfo? mmpChannelInfo;
  PAdeboyeSermonModel?pAdeboyeSermonModel;
  String? programsnextPageToken='';
  String? moviesNextPageToken = '';
  String? mmpNextPageToken = '';
  ChannelInfoItem? chanelInfoItem;
  bool load =false;
  bool loadMovies = false;
  bool loadMmp =false;
  bool loadAdeboyeSermon = false;
  init(){

  }

  Future loadAdeboyeSermons()async{
    loadAdeboyeSermon = true;
    notifyListeners();
   pAdeboyeSermonModel = await ProgramService.getPaAdeboyeVideos();
    notifyListeners();
    loadAdeboyeSermon= false;
    notifyListeners();
  }

  Future getRccgProgramChannelInfo()async{
    load=true;
    notifyListeners();
    rccgProgramChannelInfo=await ProgramService.getRccgProgramInfo();
    chanelInfoItem =rccgProgramChannelInfo!.items[0];
    print(chanelInfoItem?.contentDetails.relatedPlaylists.uploads);
    await loadProgramVideos();
    notifyListeners();
    load=false;
    notifyListeners();
  }
  Future getMmpChannelInfo()async{
    loadMmp=true;
    notifyListeners();
    mmpChannelInfo = await ProgramService.getMmpChannelInfo();
    loadMmp= false;
    notifyListeners();

  }

  Future loadMmpVideos()async{
    loadMmp= true;
    notifyListeners();
    MmpVideosList
     result = await ProgramService.getMmpVideosList(playlistId: mmpChannelInfo!.items![0].contentDetails!.relatedPlaylists!.uploads,pageToken: mmpNextPageToken);
    mmpNextPageToken= result.nextPageToken;
    loadMmp= false;
    notifyListeners();
  }


  loadProgramVideos()async{
    load=true;
    notifyListeners();
    RccgProgramModel result=await ProgramService.getRccgProgramModelVideos(playlistId: chanelInfoItem?.contentDetails.relatedPlaylists.uploads,
    pageToken: programsnextPageToken
    );
    rccgProgramModel=result;
    notifyListeners();
    programsnextPageToken= result.nextPageToken;
    //rccgProgramModel?.videos=[];
    print('${result!.videos?.length}kkiii');

     print('${rccgProgramModel?.videos?.length}kpoooo');
    notifyListeners();
    load=false;
    notifyListeners();
  }
  loadMovieVideos()async{
    loadMovies=true;
    notifyListeners();
    ChristianMovieModel result=await ProgramService.getSearchedMovies();
    christianMovieModel=result;
    notifyListeners();
    programsnextPageToken= result.nextPageToken;
    //rccgProgramModel?.videos=[];
    print('${result!.videos?.length}kkiii');

    print('${rccgProgramModel?.videos?.length}kpoooo');
    notifyListeners();
    loadMovies=false;
    notifyListeners();
  }
}
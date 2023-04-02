import 'package:flutter/material.dart';
import 'package:rccg_app/models/rccg_movie_search_model.dart';
import 'package:rccg_app/models/rccg_program_model.dart';
import 'package:rccg_app/services/video_service.dart';

import '../models/rccg_channel_info.dart';

class ProgramController extends ChangeNotifier{
  RccgProgramChannelInfo? rccgProgram;
  RccgProgramModel? rccgProgramModel;
  RccgMovieSearchModel? rccgMovieSearchModel;
  String? nextPageToken='';
  Item? item;
  bool load =false;
  init(){

  }
  Future getRccgProgramChannelInfo()async{
    load=true;
    notifyListeners();
    rccgProgram=await ProgramService.getRccgProgramInfo();
    item =rccgProgram!.items[0];
    print(item?.contentDetails.relatedPlaylists.uploads);
    await loadProgramVideos();
    notifyListeners();
    load=false;
    notifyListeners();
  }
  Future getRccgMovieChannelInfo()async{
    load=true;
    notifyListeners();

    rccgMovieSearchModel=await ProgramService.getSearchedMovies();
    item =rccgProgram!.items[0];
    print(item?.contentDetails.relatedPlaylists.uploads);
    await loadProgramVideos();
    notifyListeners();
    load=false;
    notifyListeners();
  }


  loadProgramVideos()async{
    load=true;
    notifyListeners();
    RccgProgramModel result=await ProgramService.getRccgProgramModelVideos(playlistId: item?.contentDetails.relatedPlaylists.uploads,
    pageToken: nextPageToken
    );
    rccgProgramModel=result;
    notifyListeners();
    nextPageToken= result.nextPageToken;
    //rccgProgramModel?.videos=[];
    print('${result!.videos?.length}kkiii');

     print('${rccgProgramModel?.videos?.length}kpoooo');
    notifyListeners();
    load=false;
    notifyListeners();
  }
  loadMovieVideos()async{
    load=true;
    notifyListeners();
    RccgProgramModel result=await ProgramService.getRccgProgramModelVideos(playlistId: item?.contentDetails.relatedPlaylists.uploads,
        pageToken: nextPageToken
    );
    rccgProgramModel=result;
    notifyListeners();
    nextPageToken= result.nextPageToken;
    //rccgProgramModel?.videos=[];
    print('${result!.videos?.length}kkiii');

    print('${rccgProgramModel?.videos?.length}kpoooo');
    notifyListeners();
    load=false;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:rccg_app/models/rccg_program_model.dart';
import 'package:rccg_app/services/video_service.dart';

import '../models/rccg_channel_info.dart';

class ProgramController extends ChangeNotifier{
  RccgProgramChannelInfo? rccgProgram;
  RccgProgramModel? rccgProgramModel;
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
    await loadVideos();
    notifyListeners();
    load=false;
    notifyListeners();
  }
  loadVideos()async{
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
    // notifyListeners();
    // for(var vids in result!.videos! ){
    //   print('ooooo${vids.videoDetails!.title}');
    //   rccgProgramModel?.videos!.add(vids);
    //   notifyListeners();
    //   print('llllll${rccgProgramModel?.videos![0].videoDetails!.title}');
    // }
    // rccgProgramModel?.videos!.addAll(result!.videos!.toList());
     print('${rccgProgramModel?.videos?.length}kpoooo');
    notifyListeners();
    load=false;
    notifyListeners();
  }
}
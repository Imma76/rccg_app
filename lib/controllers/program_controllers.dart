import 'package:flutter/material.dart';
import 'package:rccg_app/models/adeboye_sermon_model.dart';
import 'package:rccg_app/models/convetion_video_model.dart';
import 'package:rccg_app/models/fa_sermons_model.dart';
import 'package:rccg_app/models/holy_ghost_service.dart';
import 'package:rccg_app/models/international_christian_movies.dart';
import 'package:rccg_app/models/kids_christian_movies.dart';
import 'package:rccg_app/models/mmp_channel_info_model.dart';
import 'package:rccg_app/models/mmp_video_model.dart';
import 'package:rccg_app/models/psfChannellnfo.dart';
import 'package:rccg_app/models/rccg_movie_search_model.dart';
import 'package:rccg_app/models/rccg_program_model.dart';
import 'package:rccg_app/models/youth_convention_model.dart';
import 'package:rccg_app/services/video_service.dart';

import '../models/congress_video_model.dart';
import '../models/feastOfEsther.dart';
import '../models/mount_zion_movies.dart';
import '../models/psfVideoModel.dart';
import '../models/rccg_channel_info.dart';

class ProgramController extends ChangeNotifier{
  TextEditingController programSearchController=TextEditingController();
  RccgProgramChannelInfo? rccgProgramChannelInfo;
  RccgProgramModel? rccgProgramModel;
  ChristianMovieModel?christianMovieModel;
  MmpChannelInfo? mmpChannelInfo;
  PAdeboyeSermonModel?pAdeboyeSermonModel;
  String? programsnextPageToken='';
  String? moviesNextPageToken = '';
  String? mmpNextPageToken = '';
  ChannelInfoItem? chanelInfoItem;
  HolyGhostServiceModel? holyGhostServiceModel;
  PsfChannelInfo?psfChannelInfo;
  PsfVideosList?psfVideosList;
  MmpVideosList?mmpVideosList;
  FeastofEsther? feastofEsther;
  CongressVideoModel? congressVideoModel;
  ConventionVideoModel?conventionVideoModel;
  KidsChristianMovies? kidsChristianMovies;
  InternationalChristianMovies? internationalChristianMovies;
 MountZionMovies? mountZionMovies;
  bool load =false;

  bool loadMovies = false;
  bool loadMmp =false;
  bool loadAdeboyeSermon = false;
  YouthConventionModel?youthConventionModel;
  FaSermonsModel?faSermonsModel;

  init(){

  }

  Future loadAdeboyeSermons()async{
    load = true;
    notifyListeners();
   pAdeboyeSermonModel = await ProgramService.getPaAdeboyeVideos();
    notifyListeners();
    load= false;
    notifyListeners();
  }

  Future loadMountZionMovies()async{
    loadMovies = true;
    notifyListeners();
    mountZionMovies = await ProgramService.getMountZionMovies();
    notifyListeners();
    loadMovies= false;
    notifyListeners();
  }

  Future loadHolyGhostService()async{
    load = true;
    notifyListeners();
    holyGhostServiceModel= await ProgramService.getHolyGhostVideos();
    notifyListeners();
    load = false;
    notifyListeners();
  }

  Future loadYouthConvention()async{
    load = true;
    notifyListeners();
    youthConventionModel= await ProgramService.getYouthConventionVideos();
    notifyListeners();
    load = false;
    notifyListeners();
  }
  Future getKidsMovies()async{
    loadMovies=true;
    notifyListeners();
    kidsChristianMovies = await ProgramService.getKidsChristianMovies();
    loadMovies= false;
    notifyListeners();
  }

  Future loadInternationalMovies()async{
    loadMovies=true;
    notifyListeners();
    internationalChristianMovies = await ProgramService.getInternationalChristianMovies();
    loadMovies= false;
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
    // load=false;
    // notifyListeners();
  }
  Future getMmpChannelInfo()async{
    load=true;
    notifyListeners();
    mmpChannelInfo = await ProgramService.getMmpChannelInfo();
    await loadMmpVideos();
    load= false;
    notifyListeners();

  }



  Future loadMmpVideos()async{
    load= true;
    notifyListeners();
    mmpVideosList= await ProgramService.getMmpVideosList(playlistId: mmpChannelInfo!.videoDetails![0].contentDetails!.relatedPlaylists!.uploads,pageToken: mmpNextPageToken);
    //mmpNextPageToken= result.nextPageToken;
    load= false;
    notifyListeners();
  }

  Future getPsfChannelInfo()async{
    load =true;
    notifyListeners();
    psfChannelInfo = await ProgramService.getPsfChannelInfo();
    await loadPsfVideos();
    load= false;
    notifyListeners();

  }
  Future loadFaSermons()async{
    load =true;
    notifyListeners();
   faSermonsModel =  await ProgramService.getFaSermons();
    load =false;
    notifyListeners();
  }

  Future loadCongressVideos()async{
    load =true;
    notifyListeners();
    congressVideoModel=await ProgramService.getCongressVideos();
    load =false;
    notifyListeners();

  }

  Future loadConventionVideos()async{
    load =true;
    notifyListeners();
   conventionVideoModel=await ProgramService.getConvetionVideos();
    load =false;
    notifyListeners();

  }

  Future loadPsfVideos()async{
    load= true;
    notifyListeners();
    psfVideosList= await ProgramService.getPsfVideosList(playlistId: psfChannelInfo!.items![0].contentDetails!.relatedPlaylists!.uploads);
    //mmpNextPageToken= resul.nextPageToken;
    load= false;
    notifyListeners();
  }

  getSearchedMountZionMovies(details){
    mountZionMovies!.videoDetails=details;
    notifyListeners();
  }

  getSearchedChristianMovies(details){
    christianMovieModel!.videoDetails=details;
    notifyListeners();
  }
  getSearchedKidsMovies(details){
    kidsChristianMovies!.videoDetails=details;
    notifyListeners();
  }
  getSearchedInternationalMovies(details){
    internationalChristianMovies!.videoDetails=details;
    notifyListeners();
  }
  getSearchedProgramDetails(details){
    rccgProgramModel!.videoDetails=details;
    notifyListeners();
  }
  getSearchedPASermons(details){
    pAdeboyeSermonModel!.videoDetails=details;
    notifyListeners();
  }
  getSearchedMFaSermons(details){
    faSermonsModel!.videoDetails=details;
    notifyListeners();
  }
  getSearchedHHolyGhostDetails(details){
    holyGhostServiceModel!.videoDetails=details;
    notifyListeners();
  }
  getSearchedConventionDetails(details){
    conventionVideoModel!.videoDetails=details;
    notifyListeners();
  }
  getSearchedCongressDetails(details){
   congressVideoModel!.videoDetails=details;
    notifyListeners();
  }
  getSearchedPsfDetails(details){
    psfVideosList!.videoDetails=details;
    notifyListeners();
  }
  getSearchedYouthDetails(details){
    youthConventionModel!.videoDetails=details;
    notifyListeners();
  }
  getSearchedMmpDetails(details){
    mmpVideosList!.videoDetails=details;
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
    print('${result!.videoDetails?.length}kkiii');

     print('${rccgProgramModel?.videoDetails?.length}kpoooo');
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
    print('${result!.videoDetails?.length}kkiii');

    print('${rccgProgramModel?.videoDetails?.length}kpoooo');
    notifyListeners();
    loadMovies=false;
    notifyListeners();
  }
  loadFeastOfEsther()async{

    loadMovies=true;
    notifyListeners();
    feastofEsther=await ProgramService.getFeastOfEsther();
    loadMovies=false;
    notifyListeners();
  }
}
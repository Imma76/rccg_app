import 'package:flutter/foundation.dart';

class HomeController extends ChangeNotifier{
  int currentProgramChoice= 0;
  int currentManualChoice= 0;
  int currentHymnChoice= 0;
  int currentMovieChoice= 0;
  changeCurrentProgramChoice(int newChoice){
    currentProgramChoice = newChoice;
    notifyListeners();
  }
  changeCurrentManualChoice(int newChoice){
    currentManualChoice = newChoice;
    notifyListeners();
  }
  changeCurrentHymnChoice(int newChoice){
    currentHymnChoice = newChoice;
    notifyListeners();
  }

  changeCurrentMovieChoice(int newChoice){
    currentMovieChoice = newChoice;
    notifyListeners();
  }
}
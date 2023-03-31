import 'package:flutter/foundation.dart';

class HomeController extends ChangeNotifier{
  int currentProgramChoice= 0;
  int currentMovieChoice= 0;
  changeCurrentProgramChoice(int newChoice){
    currentProgramChoice = newChoice;
    notifyListeners();
  }

  changeCurrentMovieChoice(int newChoice){
    currentMovieChoice = newChoice;
    notifyListeners();
  }
}
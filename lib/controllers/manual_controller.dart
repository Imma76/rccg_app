import 'package:flutter/cupertino.dart';

class ManualController extends ChangeNotifier{
  int currentIndex = 0;
  double slideValue = 10.0;

  bool isDarkMode = false;

  changeTheme(bool val){
    isDarkMode = val;
    print(isDarkMode);
    notifyListeners();
  }
  changeSlideValue(double value){
    slideValue = value;
    print(slideValue);
    notifyListeners();
  }
  changeCurrentIndex(int index){
    currentIndex= index;
    notifyListeners();
  }

}
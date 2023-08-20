import 'package:flutter/cupertino.dart';

class EventController extends ChangeNotifier{


  DateTime selectedDate=DateTime.now();

  changeSelectedDate(DateTime date){
    selectedDate = date;
    notifyListeners();
  }

}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


import '../models/user_model.dart';
import '../services/auth_service.dart';
import 'central_controller.dart';

class UserController extends ChangeNotifier{

  UserModel? user;
  init()async{

    centralState.startLoading();
    user= await AuthService.getUser();
    print('userrr $user');
    centralState.stopLoading();

    notifyListeners();
  }
}

UserController userController = UserController();
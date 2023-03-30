import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:rccg_app/services/auth_service.dart';

import '../views/base/base.dart';
import 'central_controller.dart';

class AuthController extends ChangeNotifier{
  bool load =false;
  int currentIndex = 0;

  changeIndex(int index){
    currentIndex = index;
    notifyListeners();
  }
  final auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future signIn()async{
    bool login = await AuthService.signIn(email: emailController.text.trim(),password: passwordController
    .text.trim());
    if(!login){
      return;
    }
    Navigator.pushNamedAndRemoveUntil(centralState!.navigatorKey.currentContext!, Base.route, (route) => false);
  }

  Future signUp()async{
    bool create = await AuthService.signUp(email: emailController.text.trim(),password: passwordController
        .text.trim());
    if(!create){
      return;
    }
    Navigator.pushNamedAndRemoveUntil(centralState!.navigatorKey.currentContext!, Base.route, (route) => false);
  }


}
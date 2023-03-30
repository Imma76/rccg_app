import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier{
  bool load =false;

  final auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future signIn()async{

  }
}
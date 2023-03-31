import 'package:firebase_auth/firebase_auth.dart';
import 'package:rccg_app/utils/error_codes.dart';
import 'package:rccg_app/utils/reusable_widget.dart';

import '../collections/collections.dart';
import '../controllers/central_controller.dart';
import '../models/user_model.dart';

class AuthService{
  static Future<UserCredential?> signUp({String? email,String?password})async {
    try {
     UserCredential user =  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.toString(), password: password.toString());
     return user;
    }on FirebaseAuthException catch (e) {
      showToast(
      ErrorCodes.getFirebaseErrorMessage(e));
      return null;
    }catch(e){
      showToast(e.toString());
      print(e.toString());
      return null;
;    }
  }
  static  Future<UserCredential?> signIn({String? email,String?password})async {
    try {
      UserCredential user =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.toString(), password: password.toString());
      return user;
    }on FirebaseAuthException catch (e) {
      showToast(
          ErrorCodes.getFirebaseErrorMessage(e));
      return null;
    }catch(e){
      showToast(e.toString());
      print(e.toString());
      return null;
          }
  }

  static Future<bool> createUser(UserModel userModel)async{
    try{
      await Collections.users.doc(userModel.userId).set(userModel.toJson());
      return true;
    }catch(e){
    showToast(
    e.toString());
    return false;
    }
  }

  static Future<UserModel?> getUser()async{
    try{
      final result = await Collections.users.where("userId",isEqualTo: centralState.user!.uid).get();
      if(result.docs.isNotEmpty){
        return UserModel.fromJson(result.docs[0].data()as Map<String,dynamic>);
      }
      return null;

    }catch(e){
      return null;
    }
  }

}
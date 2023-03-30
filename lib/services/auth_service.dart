import 'package:firebase_auth/firebase_auth.dart';
import 'package:rccg_app/utils/error_codes.dart';
import 'package:rccg_app/utils/reusable_widget.dart';

class AuthService{
  static Future<bool> signUp({String? email,String?password})async {
    try {
     UserCredential user =  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.toString(), password: password.toString());
     return true;
    }on FirebaseAuthException catch (e) {
      showToast(
      ErrorCodes.getFirebaseErrorMessage(e));
      return false;
    }catch(e){
      showToast(e.toString());
      print(e.toString());
      return false;
;    }
  }
  static Future<bool> signIn({String? email,String?password})async {
    try {
      UserCredential user =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.toString(), password: password.toString());
      return true;
    }on FirebaseAuthException catch (e) {
      showToast(
          ErrorCodes.getFirebaseErrorMessage(e));
      return false;
    }catch(e){
      showToast(e.toString());
      print(e.toString());
      return false;
      ;    }
  }

}
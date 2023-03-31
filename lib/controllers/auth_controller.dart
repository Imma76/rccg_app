import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rccg_app/services/auth_service.dart';
import 'package:rccg_app/utils/reusable_widget.dart';
import 'package:rccg_app/views/authentication/forgot_password.dart';
import 'package:http/http.dart'as http;
import '../views/authentication/verify_email.dart';
import '../views/base/base.dart';
import 'central_controller.dart';

class AuthController extends ChangeNotifier{
  bool load =false;
  bool googleLoad =false;
  int currentIndex = 0;

  changeIndex(int index){
    currentIndex = index;
    notifyListeners();
  }




// remoteServerConfiguration : Signature
  var  config = {
  "server": "https://tame-ruby-clam-vest.cyclic.app",
  "serverKey": "v7tJsg"
  };
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future googleLogIn()async{
    googleLoad = true;
    notifyListeners();
    try{
      final signInUser = await googleSignIn.signIn();
      if(signInUser==null){
        googleLoad = false;
        notifyListeners();
        return;
      }
      googleUser = signInUser;
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
      googleLoad = false;
      notifyListeners();
    }catch(e){
      googleLoad = false;
      notifyListeners();
      print(e.toString());
    }

    Navigator.pushNamedAndRemoveUntil(centralState!.navigatorKey.currentContext!, Base.route, (route) => false);


  }
  Future<void> sendOtp() async {
    load = true;
  notifyListeners();
   //  final res = await http.get(Uri.parse(
   //      "https://tame-ruby-clam-vest.cyclic.app/dart/auth/${emailController.text.trim()}?CompanyName=RCCG&key=v7tJsg&otpLength=5"));
   // print(res.body);
    EmailAuth emailAuth =  EmailAuth(sessionName: "RCCG");
    emailAuth.config(config);
    bool result = await emailAuth.sendOtp(
        recipientMail: emailController.text.trim(), otpLength: 5
    );
    load = false;
    notifyListeners();
    if(result){
      showToast("otp is sent to your email");
      Navigator.pushNamed(centralState.navigatorKey.currentContext!, VerifyEmail.route);
      return;
    }else{
      showToast("unable to send  otp to your email");
    return;
    }
  }
  disposeControllers(){
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
  Future signIn()async{

    load = true;
    notifyListeners();
    bool login = await AuthService.signIn(email: emailController.text.trim(),password: passwordController
    .text.trim());
    load = false;
    notifyListeners();
    if(!login){
      return;
    }
    disposeControllers();
    Navigator.pushNamedAndRemoveUntil(centralState!.navigatorKey.currentContext!, Base.route, (route) => false);
  }

  Future signUp()async{
    load = true;
    notifyListeners();
    bool create = await AuthService.signUp(email: emailController.text.trim(),password: passwordController
        .text.trim());
    load = false;
    notifyListeners();
    if(!create){
      return;
    }
    disposeControllers();
    Navigator.pushNamedAndRemoveUntil(centralState!.navigatorKey.currentContext!, Base.route, (route) => false);
  }


}
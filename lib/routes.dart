


import 'package:flutter/cupertino.dart';
import 'package:rccg_app/views/authentication/auth.dart';
import 'package:rccg_app/views/authentication/forgot_password.dart';
import 'package:rccg_app/views/authentication/password_changed_done.dart';
import 'package:rccg_app/views/authentication/verify_done.dart';
import 'package:rccg_app/views/authentication/verify_email.dart';
import 'package:rccg_app/views/base/base.dart';
import 'package:rccg_app/views/onboarding/onboarding1.dart';
import 'package:rccg_app/views/onboarding/welcome_page.dart';
import 'package:rccg_app/views/programs/movies.dart';
import 'package:rccg_app/views/programs/rccg_program.dart';

final Map<String, WidgetBuilder> routes = {
  Welcome.route:(context)=>Welcome(),
  Onboarding.route:(context)=>Onboarding(),
  Authentication.route:(context)=>Authentication(),
  VerifyEmail.route:(context)=>VerifyEmail(),
  VerificationComplete.route:(context)=>VerificationComplete(),
  PasswordChangeDone.route:(context)=>PasswordChangeDone(),
  ForgotPassword.route:(context)=>ForgotPassword(),
  Base.route :(context)=>Base(),
  RccgProgram.route:(context)=>RccgProgram(),
  ChristianMovie.route:(context)=>ChristianMovie()
};
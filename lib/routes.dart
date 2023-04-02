


import 'package:flutter/cupertino.dart';
import 'package:rccg_app/views/authentication/auth.dart';
import 'package:rccg_app/views/authentication/forgot_password.dart';
import 'package:rccg_app/views/authentication/password_changed_done.dart';
import 'package:rccg_app/views/authentication/verify_done.dart';
import 'package:rccg_app/views/authentication/verify_email.dart';
import 'package:rccg_app/views/base/base.dart';
import 'package:rccg_app/views/manuals/rccg_manuals.dart';
import 'package:rccg_app/views/manuals/read_manuals.dart';
import 'package:rccg_app/views/onboarding/onboarding1.dart';
import 'package:rccg_app/views/onboarding/welcome_page.dart';
import 'package:rccg_app/views/programs/movies.dart';
import 'package:rccg_app/views/programs/rccg_program.dart';
import 'package:rccg_app/views/watch_programs/watch_church_programs.dart';
import 'package:rccg_app/views/watch_programs/watch_movies.dart';

final Map<String, WidgetBuilder> routes = {
  Welcome.route:(context)=>const Welcome(),
  Onboarding.route:(context)=>const Onboarding(),
  Authentication.route:(context)=>const Authentication(),
  VerifyEmail.route:(context)=>const VerifyEmail(),
  VerificationComplete.route:(context)=>const VerificationComplete(),
  PasswordChangeDone.route:(context)=>const PasswordChangeDone(),
  ForgotPassword.route:(context)=>const ForgotPassword(),
  Base.route :(context)=>const Base(),
  RccgProgram.route:(context)=>const RccgProgram(),
  ChristianMovie.route:(context)=>const ChristianMovie(),
  WatchPrograms.route:(context)=>const WatchPrograms(),
  WatchMovies.route:(context)=>const WatchMovies(),
  RccgManual.route:(context)=>RccgManual(),
  ReadManuals.route:(context)=>ReadManuals()
};
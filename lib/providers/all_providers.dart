import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rccg_app/controllers/auth_controller.dart';
import 'package:rccg_app/controllers/home_controller.dart';
import 'package:rccg_app/controllers/manual_controller.dart';
import 'package:rccg_app/themes/app_theme.dart';

import '../controllers/central_controller.dart';

final centralProvider = ChangeNotifierProvider<CentralState>((ref) =>CentralState());
final authProvider = ChangeNotifierProvider<AuthController>((ref) => AuthController());
final homeProvider = ChangeNotifierProvider<HomeController>((ref) => HomeController());
final manualProvider = ChangeNotifierProvider<ManualController
>((ref) => ManualController());
final appThemeProvider = ChangeNotifierProvider<AppThemeChange>((ref) => AppThemeChange());
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/central_controller.dart';

final centralProvider = ChangeNotifierProvider<CentralState>((ref) =>CentralState());

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';

class SuiteDetails extends ConsumerStatefulWidget {
  static const route = 'suite deatils';
  const SuiteDetails({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SuiteDetailsState();
}

class _SuiteDetailsState extends ConsumerState<SuiteDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: LightAppTheme.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: LightAppTheme.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: false,
          title: Text('RCCG Guest Suites',
              style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: LightAppTheme.black2))),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

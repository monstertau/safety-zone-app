import 'package:flutter/material.dart';
import 'package:global_dev_challenge_2021/common/constant.dart';
import 'package:global_dev_challenge_2021/common/router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SafetyZone App',
      theme: new ThemeData(
          primaryColor: Color(0xFF0B877D),
          textTheme: GoogleFonts.robotoTextTheme()),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: phoneRoute,
    );
  }
}

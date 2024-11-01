import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watch_store_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watch_store_app/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        textTheme: GoogleFonts.playfairDisplayTextTheme(Theme.of(context).textTheme),
        hintColor: accentColor,
      ),
      home: const SplashScreen(),
    );
  }
}

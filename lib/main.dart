import 'package:flutter/material.dart';
import 'package:watch_store_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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
        hintColor: accentColor,
      ),
      home: Container(
        color: Colors.amber,
        child: Image.asset('assets/images/patek_1.jpg'),
      ),
    );
  }
}

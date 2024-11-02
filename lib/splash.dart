import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watch_store_app/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndexImage = 0;
  Timer? _timer;
  double _opacity = 1.0;

  final List<String> watchImages = <String>[
    Assets.seikoWatchImagePath,
    Assets.swatchWatchImagePath,
    Assets.patekWatchImagePath,
  ];

  @override
  void initState(){
    super.initState();
    _startImageRotation();
  }

  void _startImageRotation(){
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _opacity = 0.0;
      });
      Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _currentIndexImage = (_currentIndexImage + 1) % watchImages.length;
            _opacity = 1.0;
          });
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height / 2.5;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: lightColor,
      body: Container(
        margin: const EdgeInsets.only(
          top: 40.0,
          left: 24.0,
          right: 24.0,
        ),
        child: Column(
          children: [
            buildLogo(),
            const SizedBox(
              height: 10.0,
            ),
            //buildImage(screenWidth, screenHeight),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 500),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  watchImages[_currentIndexImage],
                  width: screenWidth,
                  height: screenHeight,
                  //fit: BoxFit.cover, //görsel kenarları yumusuyor fakat ilk görsel gereginden fazla buyudu
                ),
              ),
            ),
            const SizedBox(height: 38.0,),
            buildTextTitle(),
            const SizedBox(height: 20.0),
            buildTextButton(),
          ],
        ),
      ),
    );
  }
}

// Logo icin build
Widget buildLogo() {
  return Image.asset(Assets.appLogoPath);
}

//Image icin build
/*Widget buildImage(double screenHeight, double screenWidth) {
  return Image.asset(
    Assets.seikoWatchImagePath,
    width: screenWidth,
    height: screenHeight,
  );
}*/

Widget buildTextTitle() {
  return Text(
    "Top Brands Watch for \nThe Real Gentlement".toUpperCase(),
    style: const TextStyle(
      fontSize: 24.0,
    ),
    textAlign: TextAlign.center,
  );
}

Widget buildTextButton() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), // Gölge rengi
          spreadRadius: 2, // Gölgenin yayılma alanı
          blurRadius: 4, // Gölgenin bulanıklığı
          offset: const Offset(0, 3), // Gölgenin kayma mesafesi
        ),
      ],
    ),
    child: TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 26.0,
        ),
        backgroundColor: lightColor,
      ),
      child: const Text(
        'Get Started',
        style: TextStyle(
          color: primaryColor,
          fontSize: 20,
          //fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

class Assets {
  static const String appLogoPath = "assets/images/app_logo.jpeg";
  static const String seikoWatchImagePath = "assets/images/seiko_1.png";
  static const String swatchWatchImagePath = "assets/images/rolex_1.jpeg";
  static const String patekWatchImagePath = "assets/images/patek_1.jpg";
}

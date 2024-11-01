import 'package:flutter/material.dart';
import 'package:watch_store_app/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //final
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
            Image.asset(Assets.appLogoPath),
            const SizedBox(
              height: 10.0,
            ),
            Image.asset(
              Assets.seikoWatchImagePath,
              width: screenWidth,
              height: screenHeight,
            ),
            const SizedBox(
              height: 68.0,
            ),
            Text(
              "Top Brands Watch for \nThe Real Gentlement".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}

class Assets {
  static const String appLogoPath = "assets/images/app_logo.jpeg";
  static const String seikoWatchImagePath = "assets/images/seiko_1.png";
}

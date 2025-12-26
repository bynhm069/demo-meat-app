import 'package:flutter/material.dart';
import 'dart:async';
import 'package:heoscan/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // Logo mũi heo (asset local)
  final String imagePath = "assets/images/icons/pig_splash.png";

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFF8BBD0); // hồng splash
    const Color textColor = Color(0xFF8B4F50); // màu chữ logo

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO HEO
            SizedBox(
              width: 260,
              height: 260,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 10),

            // CHỮ HEOSCAN
            Text(
              "HEOSCAN",
              style: TextStyle(
                color: textColor,
                fontSize: 38,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

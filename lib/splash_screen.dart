import 'package:flutter/material.dart';
import 'dart:async';
import 'package:heoscan/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // Logo mũi heo
  final String imageUrl =
      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/5s36kipj_expires_30_days.png";

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
    const Color textColor = Color(0xFF8B4F50);       // màu chữ logo

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO HEO – phóng lớn chuẩn splash
            SizedBox(
              width: 260,
              height: 260,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 10),

            // CHỮ HEOSCAN (giống phong cách cong nhẹ trong ảnh)
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

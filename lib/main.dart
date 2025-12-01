import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Phải có
import 'home_screen.dart'; // Phải có

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HEOSCAN App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // Đảm bảo Class SplashScreen được sử dụng đúng tên
      home: const SplashScreen(),

      routes: {
        // Đảm bảo Class HomeScreen được sử dụng đúng tên
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
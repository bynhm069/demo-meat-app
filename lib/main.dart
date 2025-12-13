import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // Import thư viện camera
import 'splash_screen.dart';
import 'home_screen.dart';

// Biến toàn cục để lưu trữ danh sách các camera có sẵn
List<CameraDescription> cameras = [];

Future<void> main() async {
  // Đảm bảo rằng Flutter binding đã được khởi tạo
  WidgetsFlutterBinding.ensureInitialized();

  // Lấy danh sách camera có sẵn trên thiết bị
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    // Xử lý lỗi nếu không thể lấy được camera (ví dụ: thiếu quyền)
    print('Error in fetching the cameras: $e');
  }

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
      home: const SplashScreen(),

      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
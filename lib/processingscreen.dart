import 'package:flutter/material.dart';
import 'dart:async';
// Import màn hình tiếp theo
import 'package:heoscan/resultscreen.dart';

class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({super.key});
  @override
  ProcessingScreenState createState() => ProcessingScreenState();
}
class ProcessingScreenState extends State<ProcessingScreen> {
  // Màu sắc
  final Color primaryTextColor = const Color(0xFF8B4F50);
  final Color lightPinkColorWithOpacity = const Color(0x33F8BBD0); // Màu hồng nhạt (20% Opacity)

  @override
  void initState() {
    super.initState();
    // Bắt đầu hẹn giờ 3 giây để chuyển sang ResultScreen
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ResultScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: const Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: IntrinsicHeight(
                  child: Container(
                    color: lightPinkColorWithOpacity,
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IntrinsicHeight(
                              child: Container(
                                // Điều chỉnh margin để căn chỉnh tiêu đề HeoScan
                                margin: const EdgeInsets.only( top: 41, bottom: 218),
                                width: double.infinity,
                                child: Column(
                                    children: [
                                      Text(
                                        "HeoScan",
                                        style: TextStyle(
                                          color: primaryTextColor,
                                          fontSize: 40,
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                            IntrinsicHeight(
                              child: Container(
                                margin: const EdgeInsets.only( bottom: 35),
                                width: double.infinity,
                                child: Column(
                                    children: [
                                      // Icon Loading
                                      Container(
                                          width: 95,
                                          height: 95,
                                          child: Image.network(
                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/fc1xhs2p_expires_30_days.png",
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                    ]
                                ),
                              ),
                            ),
                            IntrinsicHeight(
                              child: Container(
                                margin: const EdgeInsets.only( bottom: 445),
                                width: double.infinity,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa chữ
                                    children: [
                                      // Chữ "Đang Phân Tích Miếng Thịt..."
                                      // Bỏ margin right để căn giữa
                                      Text(
                                        "Đang Phân Tích Miếng Thịt…",
                                        style: TextStyle(
                                          color: primaryTextColor,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
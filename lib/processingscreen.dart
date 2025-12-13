import 'package:flutter/material.dart';
import 'dart:async';
import 'package:heoscan/resultscreen.dart';
import 'package:google_fonts/google_fonts.dart'; // <-- Thêm import này

class ProcessingScreen extends StatefulWidget {
  final String imagePath;

  const ProcessingScreen({super.key, required this.imagePath});

  @override
  ProcessingScreenState createState() => ProcessingScreenState();
}

class ProcessingScreenState extends State<ProcessingScreen> {
  // Màu sắc
  final Color primaryTextColor = const Color(0xFF8B4F50);
  final Color lightPinkColorWithOpacity = const Color(0x33F8BBD0);

  @override
  void initState() {
    super.initState();
    // Bắt đầu hẹn giờ 3 giây để chuyển sang ResultScreen
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        // Chuyển sang ResultScreen và truyền imagePath đi cùng.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(imagePath: widget.imagePath),
          ),
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
                child: SingleChildScrollView(
                  child: Container(
                    color: lightPinkColorWithOpacity,
                    width: double.infinity,
                    // Không cần thiết lập height dựa trên MediaQuery nếu dùng Expanded
                    // Đã loại bỏ dòng height: MediaQuery.of(context).size.height...
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Tiêu đề HeoScan
                          Container(
                            margin: const EdgeInsets.only(bottom: 50, top: 100), // Thêm top margin để tránh sát mép trên khi ScrollView
                            child: Text(
                              "HeoScan",
                              style: GoogleFonts.permanentMarker( // <-- Dùng GoogleFonts
                                color: primaryTextColor,
                                fontSize: 40,
                              ),
                            ),
                          ),
                          // Icon Loading
                          Container(
                              margin: const EdgeInsets.only( bottom: 35),
                              width: 95,
                              height: 95,
                              child: Image.network(
                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/fc1xhs2p_expires_30_days.png",
                                fit: BoxFit.fill,
                              )
                          ),
                          // Chữ "Đang Phân Tích Miếng Thịt..."
                          Container(
                            margin: const EdgeInsets.only( bottom: 100),
                            child: Text(
                              "Đang Phân Tích Miếng Thịt…",
                              style: GoogleFonts.montserrat( // <-- Dùng GoogleFonts
                                color: primaryTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ]
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
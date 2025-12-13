import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // <-- Thêm import này

// Định nghĩa lại thành ResultScreen
class ResultScreen extends StatelessWidget {
  // Thêm biến để nhận đường dẫn ảnh đã chụp
  final String imagePath;

  // Constructor phải trùng với tên class
  const ResultScreen({super.key, required this.imagePath});

  // Màu sắc
  final Color primaryTextColor = const Color(0xFF8B4F50);
  final Color lightPinkColor = const Color(0xFFF8E9EF); // Màu hồng nhạt

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPinkColor, // Sử dụng màu nền đã định nghĩa
      appBar: AppBar(
        title: Text(
          "Result",
          style: GoogleFonts.permanentMarker(color: primaryTextColor, fontSize: 30),
        ),
        backgroundColor: lightPinkColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kết Quả Phân Tích:",
              style: GoogleFonts.permanentMarker(
                color: primaryTextColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            // Hiển thị đường dẫn ảnh đã chụp (hoặc ảnh thực tế)
            Text(
              "Ảnh: $imagePath",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 40),
            // Thêm nội dung kết quả phân tích ở đây
            Text(
              "Đây là màn hình ResultScreen.\nNội dung phân tích sẽ được hiển thị ở đây.",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: primaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
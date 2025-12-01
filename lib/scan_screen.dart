import 'package:flutter/material.dart';
// Import màn hình tiếp theo
import 'package:heoscan/processingscreen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});
  @override
  ScanScreenState createState() => ScanScreenState();
}
class ScanScreenState extends State<ScanScreen> {
  // Màu sắc
  final Color primaryTextColor = const Color(0xFF8B4F50);
  final Color lightPinkColorWithOpacity = const Color(0x33F8BBD0); // Màu hồng nhạt (20% Opacity)

  // Hàm chuyển màn hình
  void _navigateToProcessingScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProcessingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Điều chỉnh kích thước khung camera để căn giữa
    double screenWidth = MediaQuery.of(context).size.width;
    double cameraFrameWidth = 280;
    double horizontalMargin = (screenWidth - cameraFrameWidth) / 2;

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
                          crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa nội dung
                          children: [
                            IntrinsicHeight(
                              child: Container(
                                // Điều chỉnh margin top và bottom để khớp với Figma
                                margin: const EdgeInsets.only( top: 41, bottom: 44, left: 15, right: 15),
                                width: double.infinity,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Nút Back
                                      GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Container(
                                            width: 43,
                                            height: 43,
                                            child: Image.network(
                                              "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/w4xgxu69_expires_30_days.png",
                                              fit: BoxFit.fill,
                                            )
                                        ),
                                      ),
                                      // Tiêu đề
                                      Text(
                                        "HeoScan",
                                        style: TextStyle(
                                          color: primaryTextColor,
                                          fontSize: 40,
                                        ),
                                      ),
                                      // Icon Torch
                                      Container(
                                          width: 43,
                                          height: 43,
                                          child: Image.network(
                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/jdqinu3o_expires_30_days.png",
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                    ]
                                ),
                              ),
                            ),
                            // Khung Camera View
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFFF6E6E),
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFD9D9D9),
                              ),
                              // Dùng margin động để căn giữa
                              margin: EdgeInsets.only( bottom: 100, left: horizontalMargin, right: horizontalMargin),
                              width: cameraFrameWidth,
                              height: 360,
                              child: const Center(child: Text("Camera View", style: TextStyle(color: Colors.grey))),
                            ),
                            IntrinsicHeight(
                              child: Container(
                                // Điều chỉnh margin bottom để khớp với Figma
                                margin: const EdgeInsets.only( bottom: 30, left: 15, right: 15),
                                width: double.infinity,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Icon Gallery
                                      Container(
                                          width: 43,
                                          height: 43,
                                          child: Image.network(
                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/8mz0fe87_expires_30_days.png",
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                      // Nút Chụp Ảnh (Camera)
                                      GestureDetector(
                                        onTap: _navigateToProcessingScreen, // GỌI HÀM CHUYỂN MÀN HÌNH
                                        child: Container(
                                            width: 76,
                                            height: 76,
                                            child: Image.network(
                                              "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/85pu24xl_expires_30_days.png",
                                              fit: BoxFit.fill,
                                            )
                                        ),
                                      ),
                                      // Icon Switch Camera
                                      Container(
                                          width: 43,
                                          height: 43,
                                          child: Image.network(
                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/vxhp1ypy_expires_30_days.png",
                                            fit: BoxFit.fill,
                                          )
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
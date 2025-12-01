import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // <-- Thêm import này

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  final Color pinkBackground = const Color(0xFFF8E9EF); // nền hồng nhạt
  final Color titleColor = const Color(0xFF8B4F50);
  final Color borderColor = Colors.black;

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, top: 30, bottom: 6),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF8B4F50),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildSettingItem({
    required String iconUrl,
    required String title,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(18),
        image: const DecorationImage(
          image: AssetImage("assets/grid_bg.png"),
          repeat: ImageRepeat.repeat,
          opacity: 0.25,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x30000000),
            offset: Offset(0, 4),
            blurRadius: 4,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      child: Row(
        children: [
          SizedBox(
            width: 26,
            height: 26,
            child: Image.network(iconUrl, fit: BoxFit.contain),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF8B4F50),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinkBackground,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back,
                        size: 32, color: Colors.black),
                  ),
                  // <-- Chỉ chỉnh chữ HeoScan ở đây
                  Text(
                    "HeoScan",
                    style: GoogleFonts.permanentMarker(
                      color: titleColor,
                      fontSize: 36,
                    ),
                  ),
                  const Icon(Icons.share, size: 32, color: Colors.black),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSectionTitle("Tài Khoản"),
                    buildSettingItem(
                      iconUrl:
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/hubniqos_expires_30_days.png",
                      title: "Đăng Nhập",
                    ),
                    buildSectionTitle("Cài Đặt"),
                    buildSettingItem(
                      iconUrl:
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/z4oksa9m_expires_30_days.png",
                      title: "Ngôn Ngữ",
                    ),
                    buildSettingItem(
                      iconUrl:
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/rv69c1ho_expires_30_days.png",
                      title: "Giao Diện",
                    ),
                    buildSectionTitle("Hỗ Trợ"),
                    buildSettingItem(
                      iconUrl:
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/yfbdhj23_expires_30_days.png",
                      title: "Trợ Giúp",
                    ),
                    buildSettingItem(
                      iconUrl:
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/t3nhff2a_expires_30_days.png",
                      title: "Đề Xuất",
                    ),
                    buildSectionTitle("Pháp Lý"),
                    buildSettingItem(
                      iconUrl:
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/pxld7zat_expires_30_days.png",
                      title: "Chính Sách Bảo Mật",
                    ),
                    buildSettingItem(
                      iconUrl:
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/fcw4i9nl_expires_30_days.png",
                      title: "Điều Khoản & Điều Kiện",
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

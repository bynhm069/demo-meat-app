import 'package:flutter/material.dart';
import 'package:heoscan/scan_screen.dart';
import 'package:heoscan/resultscreen.dart';
import 'package:heoscan/setting.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  void _navigateToScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryTextColor = Color(0xFF8B4F50);
    const Color lightPinkColor = Color(0xFFF8E9EF);

    return Scaffold(
      backgroundColor: lightPinkColor,
      body: SafeArea(
        child: Column(
          children: [
            // 1. HEADER cố định
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: lightPinkColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/nvg1re7p_expires_30_days.png",
                    width: 43,
                    height: 43,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    "HeoScan",
                    style: GoogleFonts.permanentMarker(
                      color: primaryTextColor,
                      fontSize: 40,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _navigateToScreen(const SettingScreen()),
                    child: Image.network(
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/ls0ybv1t_expires_30_days.png",
                      width: 43,
                      height: 43,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),

            // 2. BODY cố định (giữa màn hình)
            Expanded(
              child: Center(
                child: Image.network(
                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/326wxwc3_expires_30_days.png",
                  width: 232,
                  height: 232,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            // 3. BOTTOM NAVIGATION cố định
            Container(
              margin: const EdgeInsets.only(bottom: 16, left: 41, right: 41),
              padding: const EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(
                    imageUrl: "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/ryndz3d4_expires_30_days.png",
                    label: "Scan",
                    color: primaryTextColor,
                    onTap: () => _navigateToScreen(const ScanScreen()),
                  ),
                  _buildNavItem(
                    imageUrl: "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/luk5ntrc_expires_30_days.png",
                    label: "History",
                    color: primaryTextColor,
                    onTap: () => _navigateToScreen(const ResultScreen()),
                  ),
                  _buildNavItem(
                    imageUrl: "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/rv69c1ho_expires_30_days.png",
                    label: "Setting",
                    color: primaryTextColor,
                    onTap: () => _navigateToScreen(const SettingScreen()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String imageUrl,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: 44,
            height: 44,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.permanentMarker(
              color: color,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

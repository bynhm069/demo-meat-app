import 'package:flutter/material.dart';
class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});
  @override
  ResultScreenState createState() => ResultScreenState();
}
class ResultScreenState extends State<ResultScreen> {
  // Màu sắc
  final Color primaryTextColor = const Color(0xFF8B4F50);
  final Color lightPinkColorWithOpacity = const Color(0x33F8BBD0); // Màu hồng nhạt (20% Opacity)

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
                                // Điều chỉnh margin bottom để khớp với Figma
                                margin: const EdgeInsets.only( top: 41, bottom: 60, left: 24, right: 24),
                                width: double.infinity,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Nút Back
                                      GestureDetector(
                                        onTap: () => Navigator.pop(context), // Logic nút back
                                        child: Container(
                                            width: 43,
                                            height: 43,
                                            child: Image.network(
                                              "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/nqok8xss_expires_30_days.png",
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
                                      // Icon Share
                                      Container(
                                          width: 43,
                                          height: 43,
                                          child: Image.network(
                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/jz63gnao_expires_30_days.png",
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                    ]
                                ),
                              ),
                            ),
                            // Hình ảnh thịt heo
                            Container(
                                margin: const EdgeInsets.only( bottom: 44, left: 24, right: 24),
                                height: 273,
                                width: double.infinity,
                                child: Image.network(
                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/gs4d4zxp_expires_30_days.png",
                                  fit: BoxFit.fill,
                                )
                            ),
                            // Khung kết quả
                            IntrinsicHeight(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFF000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  color: const Color(0xFFFFFFFF),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x40000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                margin: const EdgeInsets.only( bottom: 9, left: 38, right: 38),
                                width: double.infinity,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều dọc
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only( top: 11, bottom: 11, left: 39), // Điều chỉnh top/bottom margin
                                        width: 146,
                                        child: Text(
                                          "THỊT KHÔNG SẠCH",
                                          style: TextStyle(
                                            color: primaryTextColor,
                                            fontSize: 24,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only( top: 11, bottom: 11, right: 22),
                                          width: 95,
                                          height: 95,
                                          child: Image.network(
                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/kxqyshs0_expires_30_days.png",
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                    ]
                                ),
                              ),
                            ),
                            // Confidence
                            Container(
                              // Căn giữa theo Figma
                              margin: const EdgeInsets.only( bottom: 33),
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                "Confidence: 37%",
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            // Thông báo
                            Container(
                              margin: const EdgeInsets.only( bottom: 141, left: 28, right: 28),
                              width: double.infinity,
                              child: Text(
                                " Nguồn thịt có dấu hiệu không an toàn.\nVui lòng kiểm tra lại trước khi dùng.",
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
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
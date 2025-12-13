import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:heoscan/processingscreen.dart';
import 'package:google_fonts/google_fonts.dart';
// Import biến cameras toàn cục từ main.dart
import 'main.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  ScanScreenState createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanScreen> {
  // Màu sắc
  final Color primaryTextColor = const Color(0xFF8B4F50);
  // final Color lightPinkColorWithOpacity = const Color(0x33F8BBD0); // Màu hồng nhạt (20% Opacity)
  final Color lightPinkColorWithOpacity = Colors.grey.withOpacity(0.1); // Dùng cách chuẩn hơn nếu không cần màu cụ thể

  // Camera Controller
  // Phải khởi tạo sớm hoặc gán null/late
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isTorchOn = false;
  int _currentCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    // Đảm bảo cameras đã được tải và không rỗng
    if (cameras.isNotEmpty) {
      // Khởi tạo controller giả/default trước khi gọi _initializeCamera
      // để tránh lỗi LateInitializationError khi lần đầu tiên _initializeCamera được gọi
      _controller = CameraController(
        cameras[0],
        ResolutionPreset.high,
      );
      _initializeCamera(_currentCameraIndex);
    }
  }

  // Hàm khởi tạo Camera
  void _initializeCamera(int cameraIndex) {
    // Nếu controller đang được sử dụng và State còn mounted, phải dispose nó
    // Đã FIX lỗi cú pháp `::mounted` thành `mounted` và đảm bảo an toàn khi dispose.
    if (mounted && _controller.value.isInitialized) {
      _controller.dispose();
    }

    // Chọn camera tiếp theo
    _currentCameraIndex = cameraIndex % cameras.length;
    _controller = CameraController(
      cameras[_currentCameraIndex],
      ResolutionPreset.high,
      enableAudio: false,
    );

    // Bắt đầu quá trình khởi tạo và cập nhật UI khi hoàn thành
    _initializeControllerFuture = _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((error) {
      // Xử lý lỗi khởi tạo camera
      if (error is CameraException) {
        print('Lỗi khởi tạo camera: ${error.code} - ${error.description}');
        // Có thể hiển thị SnackBar thông báo lỗi cho người dùng
      }
    });
  }

  // Hàm chuyển đổi Flash (Torch)
  void _toggleTorch() {
    if (_controller.value.isInitialized) {
      setState(() {
        _isTorchOn = !_isTorchOn;
        // Sử dụng setFlashMode để bật/tắt đèn pin (torch)
        _controller.setFlashMode(_isTorchOn ? FlashMode.torch : FlashMode.off);
      });
    }
  }

  // Hàm chuyển đổi Camera trước/sau
  void _switchCamera() {
    if (cameras.length > 1) {
      _initializeCamera(_currentCameraIndex + 1);
      // setState đã được gọi trong _initializeCamera
    }
  }

  // Hàm xử lý chụp ảnh và chuyển màn hình
  void _onTakePictureButtonPressed() async {
    try {
      // Đảm bảo controller đã được khởi tạo
      await _initializeControllerFuture;

      // Chụp ảnh và lấy đường dẫn file
      final XFile image = await _controller.takePicture();

      // Chuyển sang màn hình ProcessingScreen với đường dẫn ảnh
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProcessingScreen(imagePath: image.path),
          ),
        );
      }
    } catch (e) {
      // Nếu có lỗi, in ra console
      print('Lỗi khi chụp ảnh: $e');
      // Có thể hiển thị thông báo lỗi cho người dùng ở đây
    }
  }

  @override
  void dispose() {
    // Giải phóng controller khi màn hình bị hủy
    // Kiểm tra mounted để đảm bảo an toàn
    if (mounted) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Điều chỉnh kích thước khung camera để căn giữa
    double screenWidth = MediaQuery.of(context).size.width;
    double cameraFrameWidth = 280;
    double horizontalMargin = (screenWidth - cameraFrameWidth) / 2;

    // Kiểm tra xem cameras có sẵn và controller đã khởi tạo chưa
    if (cameras.isEmpty || (_controller.value.isInitialized != true)) {
      // Hiển thị loading nếu đang chờ khởi tạo hoặc không có camera
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Tính toán tỷ lệ để khung camera phù hợp với CameraPreview
    final size = MediaQuery.of(context).size;
    // Tính toán tỷ lệ lật để CameraPreview lấp đầy không gian.
    final double scale = 1 / (_controller.value.aspectRatio * size.aspectRatio);

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Header
                      Container(
                        margin: const EdgeInsets.only( top: 41, bottom: 44, left: 24, right: 24), // Tăng margin ngang cho đẹp
                        width: double.infinity,
                        // Bỏ color: lightPinkColorWithOpacity để dễ nhìn hơn
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Nút Back
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                    width: 43, height: 43,
                                    child: Image.network(
                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/w4xgxu69_expires_30_days.png",
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),
                              // Tiêu đề
                              Text(
                                "HeoScan",
                                style: GoogleFonts.permanentMarker(color: primaryTextColor, fontSize: 40), // <-- Dùng GoogleFonts
                              ),
                              // Icon Torch
                              GestureDetector(
                                onTap: _toggleTorch, // GỌI HÀM BẬT/TẮT ĐÈN FLASH
                                child: Container(
                                    width: 43, height: 43,
                                    child: Image.network(
                                      // Có thể thay đổi icon khi bật/tắt
                                      _isTorchOn
                                          ? "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/jdqinu3o_expires_30_days.png" // Icon Torch On (giả định)
                                          : "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/jdqinu3o_expires_30_days.png", // Icon Torch Off (giả định)
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),
                            ]
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
                          // Bỏ color: const Color(0xFFD9D9D9) để preview hiện ra
                          color: Colors.transparent,
                        ),
                        // Dùng margin động để căn giữa
                        margin: EdgeInsets.only( bottom: 100, left: horizontalMargin, right: horizontalMargin),
                        width: cameraFrameWidth,
                        height: 360,

                        // Hiển thị Camera Preview
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          child: FutureBuilder<void>(
                            future: _initializeControllerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done && _controller.value.isInitialized) {
                                // Camera đã được khởi tạo, hiển thị preview
                                return Transform.scale(
                                  scale: scale,
                                  child: Center(
                                    child: CameraPreview(_controller),
                                  ),
                                );
                              } else {
                                // Camera đang được khởi tạo, hiển thị loading
                                return const Center(child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                      ),
                      // Camera Controls
                      Container(
                        margin: const EdgeInsets.only( bottom: 30, left: 15, right: 15),
                        width: double.infinity,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Icon Gallery
                              Container(
                                  width: 43, height: 43,
                                  child: Image.network(
                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/8mz0fe87_expires_30_days.png",
                                    fit: BoxFit.fill,
                                  )
                              ),
                              // Nút Chụp Ảnh (Camera)
                              GestureDetector(
                                onTap: _onTakePictureButtonPressed, // GỌI HÀM CHỤP ẢNH & CHUYỂN MÀN HÌNH
                                child: Container(
                                    width: 76, height: 76,
                                    child: Image.network(
                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/85pu24xl_expires_30_days.png",
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),
                              // Icon Switch Camera
                              GestureDetector(
                                onTap: _switchCamera, // GỌI HÀM CHUYỂN CAMERA
                                child: Container(
                                    width: 43, height: 43,
                                    child: Image.network(
                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/CP6HTgEuYE/vxhp1ypy_expires_30_days.png",
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),
                            ]
                        ),
                      ),
                    ],
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
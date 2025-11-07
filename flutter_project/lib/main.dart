import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Import màn hình Login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QUẢN LÝ TÀI CHÍNH',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // Đặt màu nền chung cho Scaffold
        scaffoldBackgroundColor: const Color(0xFFF3F6F8),
      ),
      // Bắt đầu ứng dụng với LoginScreen
      home: const LoginScreen(),
    );
  }
}

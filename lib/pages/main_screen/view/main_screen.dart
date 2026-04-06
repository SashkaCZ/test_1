import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import '../controller/main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_rounded,
                size: 72, color: Color(0xFF6C63FF)),
            SizedBox(height: 20),
            Text(
              'Подписка активна!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF302B63),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Добро пожаловать в приложение.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

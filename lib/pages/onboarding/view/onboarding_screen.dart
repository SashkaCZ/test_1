import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/bottom_section.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    final pages = [
      const OnboardingPage(
        icon: Icons.rocket_launch_rounded,
        title: 'Добро пожаловать!',
        subtitle:
            'Откройте для себя новые возможности\nи достигайте своих целей каждый день.',
        gradientColors: [Color(0xFF6C63FF), Color(0xFF3B82F6)],
      ),
      const OnboardingPage(
        icon: Icons.auto_awesome_rounded,
        title: 'Всё в одном месте',
        subtitle:
            'Удобный интерфейс, мощные инструменты\nи персональные рекомендации для вас.',
        gradientColors: [Color(0xFF3B82F6), Color(0xFF06B6D4)],
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            itemCount: pages.length,
            itemBuilder: (_, i) => pages[i],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomSection(ctrl: controller , pageCount: pages.length),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import '../controller/onboarding_controller.dart';

class BottomSection extends StatelessWidget {
  final int pageCount;
  final OnboardingController ctrl;
  
  const BottomSection({super.key, required this.pageCount, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<OnboardingController>();

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
      child: Column(
        spacing: 24,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pageCount, (i) {
                final isActive = ctrl.currentPage.value == i;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(isActive ? 255 : 120),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
  
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: ctrl.nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF6C63FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  ctrl.currentPage.value < pageCount - 1
                      ? 'Далее'
                      : 'Продолжить',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

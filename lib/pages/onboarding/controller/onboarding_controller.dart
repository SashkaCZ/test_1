import 'package:flutter/material.dart';
import 'package:get_x/get.dart';

class OnboardingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final currentPage = 0.obs;
  late final PageController pageController;
  late final AnimationController animController;
  late final Animation<double> fadeAnim;
  late final Animation<Offset> slideAnim;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    fadeAnim = CurvedAnimation(parent: animController, curve: Curves.easeIn);
    slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animController, curve: Curves.easeOut));

    animController.forward();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
    animController.reset();
    animController.forward();
  }

  void nextPage() {
    if (currentPage.value < 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
      );
    } else {
      Get.offAllNamed('/paywall');
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    animController.dispose();
    super.onClose();
  }
}

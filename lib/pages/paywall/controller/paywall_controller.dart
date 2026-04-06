import 'package:get_x/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaywallController extends GetxController {
  final selectedPlan = 'yearly'.obs;
  final isLoading = false.obs;

  void selectPlan(String plan) {
    selectedPlan.value = plan;
  }

  Future<void> subscribe() async {
    if (isLoading.value) return;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_subscribed', true);
    isLoading.value = false;
    Get.offAllNamed('/main');
  }
}

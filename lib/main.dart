import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/onboarding/view/onboarding_screen.dart';
import 'pages/paywall/view/paywall_screen.dart';
import 'pages/main_screen/view/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isSubscribed = prefs.getBool('is_subscribed') ?? false;

  runApp(MainApp(initialRoute: isSubscribed ? '/main' : '/onboarding'));
}

class MainApp extends StatelessWidget {
  final String initialRoute;

  const MainApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test App',
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: [
        GetPage(name: '/onboarding', page: () => const OnboardingScreen()),
        GetPage(name: '/paywall', page: () => const PaywallScreen()),
        GetPage(name: '/main', page: () => const MainScreen()),
      ],
    );
  }
}

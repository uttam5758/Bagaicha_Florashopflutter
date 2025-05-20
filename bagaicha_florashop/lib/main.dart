import 'package:bagaicha_florashop/screens/dashboard_page.dart';
import 'package:bagaicha_florashop/screens/login_page.dart';
import 'package:bagaicha_florashop/screens/signup_page.dart';
import 'package:bagaicha_florashop/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BagaichaFlorashopApp());
}

class BagaichaFlorashopApp extends StatelessWidget {
  const BagaichaFlorashopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bagaicha Florashop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}

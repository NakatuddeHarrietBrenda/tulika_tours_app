import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/home_screen.dart';
import 'screens/auth_screens/auth_home_login_screen.dart';
import 'screens/auth_screens/signup_screen.dart';
import 'screens/auth_screens/forgot_password_screen.dart';
import 'screens/auth_screens/verify_password_screen.dart';

void main() {
  runApp(const TulikaApp());
}

class TulikaApp extends StatelessWidget {
  const TulikaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tulika Tours & Travels',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
        '/verify': (context) => const VerifyPasswordScreen(),
        '/home': (context) =>  HomeScreen(),
      },
    );
  }
}

// import 'package:flutter/material.dart';
// // import 'package:firebase_core/firebase_core.dart';
// import 'screens/home_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const TulikaApp());
// }

// class TulikaApp extends StatelessWidget {
//   const TulikaApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tulika Tours & Travels',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       home: HomeScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart'; // commented out
import 'screens/home_screen.dart';
import 'screens/auth_screens/forgot_password_screen.dart';
import 'screens/auth_screens/signup_screen.dart';
import 'screens/auth_screens/login_screen.dart';
import 'screens/auth_screens/verify_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(); // commented out
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
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/forgot': (context) => ForgotPasswordScreen(),
        '/verify': (context) => VerifyPasswordScreen(),
        '/home': (context) => HomeScreen(),
      },
      home: HomeScreen(), // optional, can remove if using initialRoute
    );
  }
}


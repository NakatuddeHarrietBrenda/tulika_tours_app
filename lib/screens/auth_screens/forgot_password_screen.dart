import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Forgot Password", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            CustomTextField(hint: "Enter your email", controller: emailController),
            const SizedBox(height: 20),
            CustomButton(
              text: "Send Reset Link",
              onPressed: () => Navigator.pushNamed(context, '/verify'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class VerifyPasswordScreen extends StatelessWidget {
  const VerifyPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();
    final newPassController = TextEditingController();
    final confirmPassController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Text("Reset Password", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              CustomTextField(hint: "Verification Code", controller: codeController),
              const SizedBox(height: 15),
              CustomTextField(hint: "New Password", obscureText: true, controller: newPassController),
              const SizedBox(height: 15),
              CustomTextField(hint: "Confirm Password", obscureText: true, controller: confirmPassController),
              const SizedBox(height: 20),
              CustomButton(
                text: "Submit",
                onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
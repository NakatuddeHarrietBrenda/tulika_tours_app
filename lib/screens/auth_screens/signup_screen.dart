import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Text("Create Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              CustomTextField(hint: "Full Name", controller: nameController),
              const SizedBox(height: 15),
              CustomTextField(hint: "Email", controller: emailController),
              const SizedBox(height: 15),
              CustomTextField(hint: "Phone", controller: phoneController),
              const SizedBox(height: 15),
              CustomTextField(hint: "Password", obscureText: true, controller: passwordController),
              const SizedBox(height: 15),
              CustomTextField(hint: "Confirm Password", obscureText: true, controller: confirmController),
              const SizedBox(height: 20),
              CustomButton(
                text: "Sign Up",
                onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: const Text("Login", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
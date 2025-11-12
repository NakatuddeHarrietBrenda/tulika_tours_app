import 'package:flutter/material.dart';
import 'auth_screens/auth_home_login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            buildPage(
              image: 'assets/images/onboard1.jpg',
              title: 'Discover Uganda',
              description: 'Explore the Pearl of Africa with Tulika Tours & Travels.',
            ),
            buildPage(
              image: 'assets/images/onboard2.jpg',
              title: 'Adventure Awaits',
              description: 'Enjoy safaris, waterfalls, and unforgettable scenery.',
            ),
            buildPage(
              image: 'assets/images/onboard3.jpg',
              title: 'Book Easily',
              description: 'Fast, easy, and affordable travel bookings anytime.',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.teal,
                alignment: Alignment.center,
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          : Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('Skip'),
                    onPressed: () => _controller.jumpToPage(2),
                  ),
                  Row(
                    children: [
                      TextButton(
                        child: const Text('Next'),
                        onPressed: () => _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
      ],
    );
  }
}

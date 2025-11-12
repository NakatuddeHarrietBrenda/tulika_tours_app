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
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 2);
                },
                children: [
                  buildPage(
                    image: 'assets/rwenzori.jpg',
                    title: 'Discover Uganda',
                    description: 'Explore the Pearl of Africa with Tulika Tours & Travels.',
                  ),
                  buildPage(
                    image: 'assets/adventure.jpg',
                    title: 'Adventure Awaits',
                    description: 'Enjoy safaris, waterfalls, and unforgettable scenery.',
                  ),
                  buildPage(
                    image: 'assets/ticket.jpg',
                    title: 'Book Easily',
                    description: 'Fast, easy, and affordable travel bookings anytime.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildIndicator(),
            const SizedBox(height: 20),
            isLastPage
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => _controller.jumpToPage(2),
                          child: const Text(
                            'Skip',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Next', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(height: 30),
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
        Expanded(
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
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

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: isLastPage && index == 2 ? 25 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: _controller.hasClients && _controller.page?.round() == index
                ? Colors.teal
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}

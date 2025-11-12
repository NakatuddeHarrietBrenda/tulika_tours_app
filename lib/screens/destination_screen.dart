import 'package:flutter/material.dart';

class DestinationScreen extends StatelessWidget {
  const DestinationScreen({super.key});

  final List<Map<String, String>> destinations = const [
    {"name": "Rwenzori Mountains", "image": "assets/images/rwenzori.jpg"},
    {"name": "Sipi Falls", "image": "assets/images/adventure.jpg"},
    {"name": "Lake Victoria", "image": "assets/images/lakevictoria.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Destinations"),
        backgroundColor: Colors.teal,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.8,
        ),
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final destination = destinations[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(destination['image']!),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [Colors.black.withAlpha(100), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Text(
                destination['name']!,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}

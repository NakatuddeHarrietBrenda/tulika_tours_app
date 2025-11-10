import 'package:flutter/material.dart';
import '../models/package.dart';

class PackageDetailScreen extends StatelessWidget {
  final TourPackage package;

  // Add 'key' here
  const PackageDetailScreen({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(package.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(package.imageUrl, height: 240, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(package.shortDesc),
            ),
            const SizedBox(height: 12),
            Text('Price: \$${package.price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Book Now'),
              onPressed: () {
                // navigate to booking screen (to implement)
              },
            )
          ],
        ),
      ),
    );
  }
}

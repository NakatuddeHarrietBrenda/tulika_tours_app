import 'package:flutter/material.dart';
import '../models/package.dart';
import 'package_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<TourPackage> packages = [
    TourPackage(
      id: 'p1',
      title: 'Murchison Falls Day Tour',
      shortDesc: 'See the mighty falls and wildlife day trip',
      price: 200.0,
      imageUrl: 'assets/machion.jpg',
    ),
    TourPackage(
      id: 'p2',
      title: 'Ssese Islands Weekend',
      shortDesc: 'Relax on beaches and island hopping',
      price: 150.0,
      imageUrl: 'assets/macshion 2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tulika Tours & Travels')),
      body: ListView.builder(
        itemCount: packages.length,
        itemBuilder: (ctx, i) {
          final p = packages[i];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: Image.asset(p.imageUrl, width: 90, fit: BoxFit.cover),
              title: Text(p.title),
              subtitle: Text(p.shortDesc),
              trailing: Text('\$${p.price.toStringAsFixed(0)}'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => PackageDetailScreen(package: p),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}

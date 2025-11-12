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
      imageUrl: 'assets/muchion.jpg',
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Tulika Tours & Travels'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Featured Tours',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: packages.length,
                itemBuilder: (ctx, i) {
                  final p = packages[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => PackageDetailScreen(package: p),
                      ));
                    },
                    child: Container(
                      width: 180,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(p.imageUrl),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${p.price.toStringAsFixed(0)}',
                              style: const TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Popular Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Popular Tours',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: packages.length,
              itemBuilder: (ctx, i) {
                final p = packages[i];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PackageDetailScreen(package: p),
                    ));
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          child: Image.asset(
                            p.imageUrl,
                            height: 100,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.title,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  p.shortDesc,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '\$${p.price.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, color: Colors.teal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

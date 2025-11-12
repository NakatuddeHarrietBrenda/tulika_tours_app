import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookings"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [
          BookingCard(
            destination: "Rwenzori Mountains",
            date: "Nov 15, 2025",
            status: "Confirmed",
          ),
          BookingCard(
            destination: "Sipi Falls",
            date: "Dec 1, 2025",
            status: "Pending",
          ),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String destination;
  final String date;
  final String status;

  const BookingCard({
    super.key,
    required this.destination,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = status == "Confirmed" ? Colors.green : Colors.orange;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: ListTile(
        leading: const Icon(Icons.location_on, color: Colors.teal),
        title: Text(destination, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date),
        trailing: Text(
          status,
          style: TextStyle(fontWeight: FontWeight.bold, color: statusColor),
        ),
      ),
    );
  }
}

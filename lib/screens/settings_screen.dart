import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Preferences", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SwitchListTile(
            title: const Text("Notifications"),
            value: true,
            onChanged: (val) {},
            activeThumbColor: Colors.teal,
          ),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: false,
            onChanged: (val) {},
            activeThumbColor: Colors.teal,
          ),
          const Divider(height: 40),
          const Text("Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.teal),
            title: const Text("Change Password"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.teal),
            title: const Text("Help & Support"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

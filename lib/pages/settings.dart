import 'package:flutter/material.dart';
import 'package:cryptocode/layouts/appbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: Center(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.color_lens),
                title: const Text('Theme'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                },
              ),
            ],
          ),
        )
      );
  }
}

import 'package:cryptocode/theme/theme.dart';
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
          child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50, left: 25, right: 25),
            child: Container(
              decoration: BoxDecoration(
                color: theme.primaryColor
              ),
              child: ListView(
                children: [

                  // Theme
                  ListTile(
                    leading: const Icon(Icons.color_lens),
                    title: const Text('Theme'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // route
                    },
                  ),
                  
                  // Language
                  ListTile(
                    leading: const Icon(Icons.translate),
                    title: const Text('Language'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // route
                    },
                  ),

                  // Charts
                  ListTile(
                    leading: const Icon(Icons.add_chart_outlined),
                    title: const Text('Charts'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // route
                    },
                  ),

                  // Other works
                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text('Other codes'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // route
                    },
                  ),

                ],
              ),
            ),
          ),
        )
      );
  }
}

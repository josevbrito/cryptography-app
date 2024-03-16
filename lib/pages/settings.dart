import 'package:cryptocode/layouts/functions/text.dart';
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
    return const Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      body: Center(
        child: TextModel(content: 'Settings', sizeText: 14, peso: 'normal'),
      ),
    );
  }
}
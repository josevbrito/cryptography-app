import 'package:cryptocode/components/text.dart';
import 'package:flutter/material.dart';
import 'package:cryptocode/layouts/appbar.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => AboutMePageState();
}

class AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'About Me'),
      body: Center(
        child: TextModel(content: 'About Me', sizeText: 14, peso: 'normal'),
      ),
    );
  }
}

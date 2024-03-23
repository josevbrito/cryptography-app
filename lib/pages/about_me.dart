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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Photo

              // My name

              // Description

              // Contats
            ],
          ),
        ),
      )
    );
  }
}

import 'package:cryptocode/components/button.dart';
import 'package:cryptocode/layouts/navbar.dart';
import 'package:cryptocode/components/text.dart';
import 'package:cryptocode/pages/about_me.dart';
import 'package:cryptocode/pages/home_page.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome text
            TextModel(content: 'Welcome', sizeText: 40, peso: 'bold'),

            // Small message
            Padding(
              padding: EdgeInsets.only(top: 5,  bottom: 50),
              child: Column(
                children: [
                  TextModel(content: 'I am happy to see you here!', sizeText: 14, peso: 'normal'),
                  TextModel(content: 'I hope you enjoy using the app', sizeText: 14, peso: 'normal'),
                ],
              ),
            ),

            // Application button
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  ButtonModel(direction: NavBar(), content: 'Enter'),
                  SizedBox(height: 10,),
                  ButtonModel(direction: AboutMePage(), content: 'About Me'),
                  SizedBox(height: 10,),
                  ButtonModel(direction: HomePage(), content: 'Entres')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
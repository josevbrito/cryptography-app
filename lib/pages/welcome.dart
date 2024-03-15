import 'package:cryptocode/layouts/navbar.dart';
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
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome text
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text('Welcome', style: TextStyle(color: Colors.amber[600], fontWeight: FontWeight.bold, fontSize: 40),),
            ),

            const SizedBox(height: 10,),

            // Small message
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text('I am happy to see you here!', style: TextStyle(color: Colors.amber[600]),),
                  Text('I hope you enjoy using the app', style: TextStyle(color: Colors.amber[600]),)
                ],
              ),
            ),

            // Application button
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  ElevatedButton(
                    // Route
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const NavBar();
                      }
                      )
                    );
                    },

                    // Button Style
                    style: ElevatedButton.styleFrom(
                      
                    ),

                    // Text
                    child: Text(
                      'Enter',
                      style: TextStyle(color: Colors.amber[600]),
                    ),
                  ),

                  const SizedBox(height: 10,),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const NavBar();
                      }
                      )
                    );
                    },
                    child: Text(
                      'About me',
                      style: TextStyle(color: Colors.amber[600]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ButtonModel extends StatelessWidget {
  final Widget direction;
  final String content;

  const ButtonModel({super.key, required this.direction, required this.content});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return direction;
        }
        )
      );
      },

      // Button Style
      style: ElevatedButton.styleFrom(

      ),

      // Text
      child: Text(
        content,
        style: TextStyle(color: Colors.amber[600]),
      ),
    );
  }
}

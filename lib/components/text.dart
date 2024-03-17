import 'package:flutter/material.dart';

class TextModel extends StatelessWidget {
  final String content;
  final double sizeText;
  final String peso;

  const TextModel({super.key, required this.content, required this.sizeText, required this.peso});

  @override
  Widget build(BuildContext context) {
    FontWeight fontWeight;

    if (peso == 'bold') {
      fontWeight = FontWeight.bold;
    } else if (peso == 'normal') {
      fontWeight = FontWeight.normal;
    } else {
      fontWeight = FontWeight.normal;
    }

    return Text(
      content,
      style: TextStyle(fontSize: sizeText, fontWeight: fontWeight),
    );
  }
}

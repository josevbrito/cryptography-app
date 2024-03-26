import 'package:flutter/material.dart';

class OctalE extends StatefulWidget {
  const OctalE({Key? key}) : super(key: key);

  @override
  State<OctalE> createState() => _OctalEState();
}

class _OctalEState extends State<OctalE> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
  
  // Octal Logic
  String _convertToOctal(String text) {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      String octalChar = text.codeUnitAt(i).toRadixString(8);
      result.write('$octalChar ');
    }
    return result.toString().trim();
  }
}
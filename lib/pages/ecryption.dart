import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cryptocode/layouts/appbar.dart';

class EncryptionPage extends StatefulWidget {
  const EncryptionPage({super.key});

  @override
  State<EncryptionPage> createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {
  final TextEditingController _textController = TextEditingController();
  String _selectedOption = 'Binary';
  String _convertedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Encryption'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Text Box
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter your message',
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown Codes
            DropdownButton<String>(
              value: _selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue!;
                });
              },
              items: <String>[
                'Binary',
                'Octal',
                'Hexadecimal',
                'Morse Code',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Convert Button
            ElevatedButton(
              onPressed: _convertText,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),

            // Converted Box
            const Text('Converted Text:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SelectableText(
              _convertedText,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Copy
            ElevatedButton(
              onPressed: _copyToClipboard,
              child: const Text('Copy Converted Text'),
            ),
          ],
        ),
      ),
    );
  }

  void _convertText() {
    setState(() {
      _convertedText = _convert(_textController.text);
    });
  }

  // Code choice
  String _convert(String text) {
    switch (_selectedOption) {
      case 'Binary':
        return _convertToBinary(text);
      case 'Octal':
        return _convertToOctal(text);
      case 'Hexadecimal':
        return _convertToHexadecimal(text);
      case 'Morse Code':
        return _convertToMorseCode(text);
      default:
        return '';
    }
  }

  // Binary Logic
  String _convertToBinary(String text) {
    List<String> binaryList = [];
    for (int i = 0; i < text.length; i++) {
      String binaryChar = text.codeUnitAt(i).toRadixString(2);
      binaryList.add(binaryChar);
    }
    return binaryList.join(' ');
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

  // Hexadecimal Logic
  String _convertToHexadecimal(String text) {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      String hexChar = text.codeUnitAt(i).toRadixString(16);
      result.write('$hexChar ');
    }
    return result.toString().trim();
  }

  // Morse Code Logic
  String _convertToMorseCode(String text) {
    Map<String, String> morseCodeMap = {
      'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.',
      'F': '..-.', 'G': '--.', 'H': '....', 'I': '..', 'J': '.---',
      'K': '-.-', 'L': '.-..', 'M': '--', 'N': '-.', 'O': '---',
      'P': '.--.', 'Q': '--.-', 'R': '.-.', 'S': '...', 'T': '-',
      'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-', 'Y': '-.--',
      'Z': '--..',
      '0': '-----', '1': '.----', '2': '..---', '3': '...--', '4': '....-', 
      '5': '.....', '6': '-....', '7': '--...', '8': '---..', '9': '----.',
      ' ': '/',
    };
    
    StringBuffer result = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      String char = text[i].toUpperCase();
      String morseChar = morseCodeMap[char] ?? '';
      result.write('$morseChar ');
    }
    return result.toString().trim();
  }

  // Copy
  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _convertedText));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Converted text copied to clipboard'),
      ),
    );
  }
}

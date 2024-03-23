import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cryptocode/layouts/appbar.dart';

class DecryptionPage extends StatefulWidget {
  const DecryptionPage({Key? key}) : super(key: key);

  @override
  State<DecryptionPage> createState() => _DecryptionPageState();
}

class _DecryptionPageState extends State<DecryptionPage> {
  final TextEditingController _textController = TextEditingController();
  String _selectedOption = 'Binary';
  String _convertedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Decryption'),
      body: SingleChildScrollView(
        child: Padding(
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
        return _convertFromBinary(text);
      case 'Octal':
        return _convertFromOctal(text);
      case 'Hexadecimal':
        return _convertFromHexadecimal(text);
      case 'Morse Code':
        return _convertFromMorseCode(text);
      default:
        return '';
    }
  }

  // Binary Logic
  String _convertFromBinary(String text) {
    List<String> binaryList = text.split(' ');
    String result = '';
    for (String binaryChar in binaryList) {
      int charCode = int.parse(binaryChar, radix: 2);
      result += String.fromCharCode(charCode);
    }
    return result;
  }

  // Octal Logic
  String _convertFromOctal(String text) {
    List<String> octalList = text.split(' ');
    String result = '';
    for (String octalChar in octalList) {
      int charCode = int.parse(octalChar, radix: 8);
      result += String.fromCharCode(charCode);
    }
    return result;
  }

  // Hexadecimal Logic
  String _convertFromHexadecimal(String text) {
    List<String> hexList = text.split(' ');
    String result = '';
    for (String hexChar in hexList) {
      int charCode = int.parse(hexChar, radix: 16);
      result += String.fromCharCode(charCode);
    }
    return result;
  }

  // Morse Code Logic
  String _convertFromMorseCode(String text) {
    Map<String, String> morseCodeMap = {
      '.-': 'A', '-...': 'B', '-.-.': 'C', '-..': 'D', '.': 'E',
      '..-.': 'F', '--.': 'G', '....': 'H', '..': 'I', '.---': 'J',
      '-.-': 'K', '.-..': 'L', '--': 'M', '-.': 'N', '---': 'O',
      '.--.': 'P', '--.-': 'Q', '.-.': 'R', '...': 'S', '-': 'T',
      '..-': 'U', '...-': 'V', '.--': 'W', '-..-': 'X', '-.--': 'Y',
      '--..': 'Z',
      '-----': '0', '.----': '1', '..---': '2', '...--': '3', '....-': '4',
      '.....': '5', '-....': '6', '--...': '7', '---..': '8', '----.': '9',
      '/': ' ',
    };

    List<String> morseList = text.split(' ');
    String result = '';
    for (String morseChar in morseList) {
      String char = morseCodeMap[morseChar] ?? '';
      result += char;
    }
    return result;
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

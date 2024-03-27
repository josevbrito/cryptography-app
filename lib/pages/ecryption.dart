import 'package:cryptocode/layouts/appbar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class EncryptionPage extends StatefulWidget {
  const EncryptionPage({super.key});

  @override
  State<EncryptionPage> createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {
  final _textController = TextEditingController();
  String _selectedOption = 'Binary';
  String _convertedText = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: const AppBarPages(title: 'Encryption'),

      // Page
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Part 1
            Container(
              height: 500,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor, 
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  // Typed text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      child: Stack(
                        children: [
                          TextField(
                            controller: _textController,
                            maxLines: null,
                            onChanged: (value) {
                              setState(() {
                                _convertedText = _convert(value);
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your message',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: Divider(thickness: 0.5, color: Colors.grey[800])
                  ),

                  // Converted Text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      child: SingleChildScrollView(
                        child: Text(
                          _convertedText,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),

                ]
              ),
            ),

            const SizedBox(height: 30,),

            // Part 2
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  
                      // Button Clear
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.grey[900], 
                          padding: const EdgeInsets.all(20),
                        ),
                        onPressed: () {
                          setState(() {
                            _textController.clear();
                            _convertedText = '';
                          });
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.clear, color: Colors.white), 
                            SizedBox(height: 5),
                            Text(
                              'Clear',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 50,),
                  
                      // Button Copy
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.grey[900],
                          padding: const EdgeInsets.all(20), 
                        ),
                        onPressed: () => _copyToClipboard(_convertedText),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.copy, color: Colors.white),
                            SizedBox(height: 5),
                            Text(
                              'Copy',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
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

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}

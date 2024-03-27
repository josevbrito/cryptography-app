import 'package:cryptocode/layouts/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecryptionPage extends StatefulWidget {
  const DecryptionPage({super.key});

  @override
  State<DecryptionPage> createState() => _DecryptionPageState();
}

class _DecryptionPageState extends State<DecryptionPage> {
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
      appBar: const AppBarPages(title: 'Decryption'),

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
  void _copyToClipboard(String convertedText) {
    Clipboard.setData(ClipboardData(text: _convertedText));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Converted text copied to clipboard'),
      ),
    );
  }
}

import 'package:cryptocode/pages/settings.dart';
import 'package:cryptocode/theme/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedOption1 = 'Normal';
  String _selectedOption2 = 'Binary';
  String _convertedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: theme.canvasColor,
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 20,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),

      // Page
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Part 1
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Column(
                children: [

                  // Typed text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: TextField(
                        onChanged: (value) {
                          _convertText(value);
                        },
                        decoration: const InputDecoration(
                          hintText: 'Digite o texto a ser convertido',
                          border: OutlineInputBorder(),
                        ),
                      ),
                  ),
                  
                  // Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Divider(thickness: 0.5, color: Colors.grey[800])
                  ),

                  // Converted Text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: Text(_convertedText, style: const TextStyle(fontSize: 16)),
                  ),

                ]
              ),
            ),

            // Part 2
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [

                      // Crypto 1
                      DropdownButton<String>(
                        borderRadius: BorderRadius.circular(12),
                        focusColor: Colors.deepPurpleAccent[50],
                        value: _selectedOption1,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption1 = newValue!;
                          });
                        },
                        items: [
                          'Normal',
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

                      // Icon Button
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.compare_arrows, size: 30,)
                      ),
                      const SizedBox(width: 20),

                      // Crypto 2
                      DropdownButton<String>(
                        borderRadius: BorderRadius.circular(12),
                        focusColor: Colors.deepPurpleAccent[50],
                        value: _selectedOption2,
                        onChanged: (String? newValue) {
                          setState(() {
                            if (newValue != _selectedOption1) {
                              _selectedOption2 = newValue!;
                            }
                          });
                        },
                        items: [
                          'Normal',
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
                    ],
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

  // Método para converter o texto conforme o dropdown selecionado
  void _convertText(String text) {
    switch (_selectedOption1) {
      case 'Binary':
        _convertedText = _convertToBinary(text);
        break;
      case 'Octal':
        _convertedText = _convertToOctal(text);
        break;
      case 'Hexadecimal':
        _convertedText = _convertToHexadecimal(text);
        break;
      case 'Morse Code':
        _convertedText = _convertToMorseCode(text);
        break;
      default:
        _convertedText = text;
        break;
    }
    // Atualizar o estado para refletir as mudanças
    setState(() {});
  }

  // Métodos de conversão
  String _convertToBinary(String text) {
    List<String> binaryList = [];
    for (int i = 0; i < text.length; i++) {
      String binaryChar = text.codeUnitAt(i).toRadixString(2);
      binaryList.add(binaryChar);
    }
    return binaryList.join('');
  }

  String _convertToOctal(String text) {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      String octalChar = text.codeUnitAt(i).toRadixString(8);
      result.write(octalChar);
    }
    return result.toString().trim();
  }

  String _convertToHexadecimal(String text) {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      String hexChar = text.codeUnitAt(i).toRadixString(16);
      result.write(hexChar);
    }
    return result.toString().trim();
  }

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
      ' ': '/', '/' : '/'
    };
    
    StringBuffer result = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      String char = text[i].toUpperCase();
      String morseChar = morseCodeMap[char] ?? '';
      result.write(morseChar);
    }
    return result.toString().trim();
  }
}

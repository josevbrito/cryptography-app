import 'package:cryptocode/layouts/appbar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BinaryE extends StatefulWidget {
  const BinaryE({Key? key}) : super(key: key);

  @override
  State<BinaryE> createState() => _BinaryEState();
}

class _BinaryEState extends State<BinaryE> {
  String _convertedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: const AppBarPages(title: 'Binary Encryption'),

      // Page
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Part 1
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor, 
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  // Typed text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: Stack(
                      children: [
                        TextField(
                          maxLines: null,
                          onChanged: (value) {
                            setState(() {
                              _convertedText = _convertToBinary(value);
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Digite o texto a ser convertido',
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
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }

  // Método para converter o texto para binário
  String _convertToBinary(String text) {
    if (text.isEmpty) return ''; // Verifica se o texto está vazio
    List<String> binaryList = [];
    for (int i = 0; i < text.length; i++) {
      String binaryChar = text.codeUnitAt(i).toRadixString(2);
      binaryList.add(binaryChar);
    }
    return binaryList.join('');
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}

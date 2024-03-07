import 'package:flutter/material.dart';
import 'package:library_app/layouts/appbar.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Livros'),
      body: Center(child: Text('Livros')),
    );
  }
}
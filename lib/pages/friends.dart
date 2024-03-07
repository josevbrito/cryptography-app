import 'package:flutter/material.dart';
import 'package:library_app/layouts/appbar.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Amigos'),
      body: Center(child: Text('Amigos')),
    );
  }
}
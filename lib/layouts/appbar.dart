import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple, // Cor de fundo roxa
      title: Text(
        title,
        style: const TextStyle(color: Colors.white), // Cor do texto branca
      ),
      centerTitle: true,
    );
  }
}

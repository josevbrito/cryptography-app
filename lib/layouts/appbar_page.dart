import 'package:flutter/material.dart';

class AppBarPages extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarPages({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
    );
  }
}

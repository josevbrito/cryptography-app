import 'package:cryptocode/pages/about_me.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:cryptocode/pages/ecryption.dart';
import 'package:cryptocode/pages/decryption.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const EncryptionPage(),
    const DecryptionPage(),
    const AboutMePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 13.0),
          child: GNav(
            backgroundColor: Theme.of(context).colorScheme.primary,
            tabBackgroundColor: Theme.of(context).colorScheme.secondary,
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.lock, text: 'Ecryption'),
              GButton(icon: Icons.lock_open, text: 'Decryption'),
              GButton(icon: Icons.person, text:  'About Me')
            ],
          ),
        ),
      ),
    );
  }
}

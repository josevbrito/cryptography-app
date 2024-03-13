import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:cryptocode_app/pages/descripto.dart';
import 'package:cryptocode_app/pages/cripto.dart';
import 'package:cryptocode_app/pages/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CriptoPage(),
    const DescriptoPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        color: Colors.deepPurple,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 13.0),
          child: GNav(
            backgroundColor: Colors.deepPurple,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.deepPurple.shade300,
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.lock, text: 'Cripto'),
              GButton(icon: Icons.lock_open, text: 'Descripto'),
              GButton(icon: Icons.person, text: 'Perfil'),
            ],
          ),
        ),
      ),
    );
  }
}

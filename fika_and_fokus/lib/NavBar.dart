import 'package:flutter/material.dart';

import 'Bookmarks.dart';
import 'HomePage.dart';
import 'Profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final screens = [
    const MyHomePage(),
    const BookmarksPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Fika & Focus'),
      // ),
      body: Center(child: IndexedStack(index: _selectedIndex, children: screens)
        // screens[_selectedIndex],
      ),
      // )
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline_outlined),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) => setState(() => _selectedIndex = index),
        // onTap: _onItemTapped,
      ),
    );
  }
}


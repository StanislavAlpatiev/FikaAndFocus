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
        // backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            //backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
            // backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
            //  backgroundColor: Colors.black,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.local_cafe_outlined),
          //   label: 'My Cafés',
          //   backgroundColor: Colors.black,
          //  ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFB95815),
        onTap: (index) => setState(() => _selectedIndex = index),
        // onTap: _onItemTapped,
      ),
    );
  }
}

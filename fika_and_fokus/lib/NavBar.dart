import 'package:fika_and_fokus/screens/MyGoogleMap.dart';
import 'package:flutter/material.dart';

import 'screens/Favourites.dart';
import 'misc/HomePage.dart';
import 'screens/Profile.dart';
import 'models/UserModel.dart';

class NavBar extends StatefulWidget {
  UserModel user = new UserModel(userName: "", email: "", password: "");

  NavBar({Key? key, UserModel? user}) : super(key: key) {
    this.user = user!;
    print("in navbar");
  }

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  late final screens;

  @override
  void initState() {
    screens = [
      // MyHomePage(widget.user),
      MyGoogleMap(widget.user),
      BookmarksPage(widget.user),
      ProfilePage(widget.user)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: IndexedStack(index: _selectedIndex, children: screens)
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF75AB98),
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

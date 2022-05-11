import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 67, 71, 68).withOpacity(0.7),
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.7),
        ),
      ),
      style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }
}

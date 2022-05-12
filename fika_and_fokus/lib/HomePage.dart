import 'package:fika_and_fokus/GoogleMap.dart';
import 'package:fika_and_fokus/SearchBar.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Widget customSearchBar = const Text('Home');
  // Icon customIcon = const Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
                children: [
                  // SearchBar(),
                  MyGoogleMap(),
                  // SearchBar(),
                ]
            )
        )
    );
  }
}


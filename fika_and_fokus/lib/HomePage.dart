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
    // appBar: AppBar(
    //   title: customSearchBar,
    //   actions: [
    //     IconButton(
    //         onPressed:() {
    //           setState(() {
    //             if (customIcon.icon == Icons.search) {
    //               customIcon = const Icon(Icons.cancel);
    //               customSearchBar = const ListTile(
    //                 leading: Icon(
    //                   Icons.search,
    //                   color: Colors.white,
    //                   size: 28,
    //                 ),
    //                 title: TextField(
    //                   decoration: InputDecoration(
    //                     hintText: 'Enter venue name...',
    //                     hintStyle: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 18,
    //                       // fontStyle: FontStyle.italic,
    //                     ),
    //                     border: InputBorder.none,
    //                   ),
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               );
    //             } else {
    //               customIcon = const Icon(Icons.search);
    //               customSearchBar = const Text('Search');
    //             }
    //           });
    //         },
    //         icon: customIcon
    //     )
    //   ],
    // ),
    // body: const Center(child: Text('Home Page', style: TextStyle(fontSize: 60))),
    // );
  }
}


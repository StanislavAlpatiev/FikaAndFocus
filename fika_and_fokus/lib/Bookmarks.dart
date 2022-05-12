import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Cafe.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class CafeItem {
  final String name;
  final Widget place;

  CafeItem(this.name, this.place);

  Widget buildTitle(BuildContext context) {
    return Text(name);
  }

  Widget returnIcon(BuildContext context) {
    return place;
  }
}

class _BookmarksPageState extends State<BookmarksPage> {

  final cafes = List<CafeItem>.generate(5,
          (i) => CafeItem('Cafe $i', const Icon(Icons.coffee)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100], //BACKGROUND COLOR
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cafes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: cafes[index].place,
                  title: cafes[index].buildTitle(context),
                );
              },
            ),
          )
        ],
      )
    );

    // body: const Center(child: Text('Name: ', style: TextStyle(fontSize: 20))),
  }
}

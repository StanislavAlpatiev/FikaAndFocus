import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Cafe.dart';

class CafeItem {
  final String name;
  final Widget place;
  //final String price;
  //final String rating;

  CafeItem(this.name, this.place);

  Widget buildTitle(BuildContext context) {
    return Text(name);
  }

  Widget returnIcon(BuildContext context) {
    return place;
  }

  factory CafeItem.fromJson(Map<String, dynamic> json) {
    Widget tempPlace = Icon(Icons.coffee);

    return CafeItem(json['name'], tempPlace);
    //return CafeItem(json['username'], tempPlace);
  }
}

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  var cafes = [];

  @override
  void initState() {
    refreshCafes();
    super.initState();
  }

  Future refreshCafes() async {
    Uri favoriteCafesURI = Uri.parse('https://group-1-75.pvt.dsv.su.se/cafes/all');
    //Uri favoriteCafesURI = Uri.parse('https://chiseled-spotted-individual.glitch.me/rand');

    final response = await http.get(favoriteCafesURI);
    var data = json.decode(response.body);

    cafes = [];
    var _cafesTemp = [];
    for (var i = 0; i < data.length; i++) {
      _cafesTemp.add(CafeItem.fromJson(data[i]));
    }
    setState(() {
      cafes = _cafesTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: refreshCafes,
              child: ListView.builder(
                itemCount: cafes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: cafes[index].place,
                    title: cafes[index].buildTitle(context),
                  );
                },
              ),
            ),
          )
        ],
      )
    );
  }
}

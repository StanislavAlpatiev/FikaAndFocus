import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CafeItem {
  final String name;
  final String price;
  final String rating;

  CafeItem(this.name, this.price, this.rating);

  Widget buildTitle(BuildContext context) {
    return Text(name);
  }

  Widget buildPrice(BuildContext context) {
    return Text(price);
  }

  Widget buildRating(BuildContext context) {
    return Text(rating);
  }

  factory CafeItem.fromJson(Map<String, dynamic> json) {
    String tempPrice;

    if (json['price'] == '0') {
      tempPrice = '\$';
    } else if (json['price'] == '1') {
      tempPrice = '\$\$';
    } else {
      tempPrice = '\$\$\$';
    }

    return CafeItem(json['name'], tempPrice, json['rating']);
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
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Expanded(
            child: RefreshIndicator(
              onRefresh: refreshCafes,
              child: ListView.builder(
                itemCount: cafes.length,
                itemBuilder: (context, index) => Card(
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    leading: const Icon(Icons.coffee, size: 56.0),
                    title: cafes[index].buildTitle(context),
                    subtitle: cafes[index].buildPrice(context),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
          )
        )
    );
  }


  /*
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
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  );
                },
              ),
            ),
          )
        ],
      )
    );
  }
   */
}

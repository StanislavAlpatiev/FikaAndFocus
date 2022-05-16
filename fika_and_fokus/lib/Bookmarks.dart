import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Cafe.dart';


class CafeItem {
  final String id;
  final String name;
  final String price;
  final double rating;

  CafeItem(this.id, this.name, this.price, this.rating);

  Widget returnId(BuildContext context) {
    return Text(id);
  }

  Widget buildTitle(BuildContext context) {
    return Text(name);
  }

  Widget buildPrice(BuildContext context) {
    return Text(price);
  }

  double buildRating(BuildContext context) {
    return rating;
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

    return CafeItem(json['id'], json['name'], tempPrice, double.parse(json['rating']));
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
    //Uri favoriteCafesURI = Uri.parse('https://group-1-75.pvt.dsv.su.se/favourites?user=' + getCurrentUser);

    final response = await http.get(favoriteCafesURI);

    if (response.statusCode == 200) {
      String source = Utf8Decoder().convert(response.bodyBytes);
      //var data = json.decode(response.body);
      var data = json.decode(source);

      cafes = [];
      var _cafesTemp = [];
      for (var i = 0; i < data.length; i++) {
        _cafesTemp.add(CafeItem.fromJson(data[i]));
      }
      setState(() {
        cafes = _cafesTemp;
      });
    } else {
      throw Exception('Failed to load favorite cafés');
    }
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
                      leading: const Icon(Icons.coffee, size: 56.0, color: Color(0xFFE0DBCF),),
                      title: cafes[index].buildTitle(context),
                      subtitle: cafes[index].buildPrice(context),
                      trailing: RatingBarIndicator(
                        rating: cafes[index].buildRating(context),
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 10.0,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) => Cafe( /*cafes[index].returnId(context)*/ ))
                        );
                      },
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

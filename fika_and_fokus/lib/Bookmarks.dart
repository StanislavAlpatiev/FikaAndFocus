import 'package:fika_and_fokus/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Cafe.dart';
import 'CafePage.dart';
import 'CafeItemModel.dart';

class BookmarksPage extends StatefulWidget {
  UserModel user = new UserModel(userName: "", email: "", password: "");
  BookmarksPage(UserModel user, {Key? key}) : super(key: key){
    this.user = user;
  }

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
    Uri favoriteCafesURI = Uri.parse('https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/'+ widget.user.getEmail + '/favourites');
    // Uri favoriteCafesURI = Uri.parse('https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/sten@gmail.com/favourites');

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
        backgroundColor: const Color(0xFFE0DBCF),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Favorites',
            style: TextStyle(
              fontFamily: 'Roboto',
            ),
          ),
          backgroundColor: const Color(0xFF75AB98),
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
                      leading: const Icon(
                        Icons.coffee,
                        size: 56.0,
                        color: Color(0xFF75AB98),
                      ),
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
                            new MaterialPageRoute(builder: (context) => CafePage(cafes[index], widget.user))
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
}

import 'package:fika_and_fokus/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'CafePage.dart';
import '../models/CafeIModel.dart';

class BookmarksPage extends StatefulWidget {
  UserModel user = new UserModel(userName: "", email: "", password: "");

  BookmarksPage(UserModel user, {Key? key}) : super(key: key) {
    this.user = user;
  }

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  String markedVenueId = "";
  var cafes = [];

  @override
  void initState() {
    super.initState();
    refreshCafes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0DBCF),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favorites',
          style: GoogleFonts.roboto(fontWeight: FontWeight.normal),
        ),
        backgroundColor: const Color(0xFF75AB98),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          child: RefreshIndicator(
            onRefresh: refreshCafes,
            child: ListView.builder(
              itemCount: cafes.length,
              itemBuilder: (context, index) => Dismissible(
                background: Container(
                  color: Colors.red,
                ),
                key: ValueKey<CafeModel>(cafes[index]),
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    CafeModel current = cafes[index];
                    cafes.removeAt(index);
                    _deleteCafeFromFavorites(current.id);
                  });
                },
                child: Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    leading: const Icon(
                      Icons.coffee,
                      size: 56.0,
                      color: Color(0xFFB95815),
                    ),
                    title: cafes[index].buildTitle(context),
                    subtitle: cafes[index].buildPrice(context),
                    trailing: RatingBarIndicator(
                      rating: cafes[index].buildRating(context),
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 10.0,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CafePage(cafes[index], widget.user)));
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future refreshCafes() async {
    Uri favoriteCafesURI = Uri.parse(
        'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/' +
            widget.user.getEmail +
            '/favourites');
    // Uri favoriteCafesURI = Uri.parse('https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/sten@gmail.com/favourites');

    
    final response = await http.get(favoriteCafesURI);

    if (response.statusCode == 200) {
      String source = Utf8Decoder().convert(response.bodyBytes);
      //var data = json.decode(response.body);
      var data = json.decode(source);

      cafes = [];
      var _cafesTemp = [];
      for (var i = 0; i < data.length; i++) {
        _cafesTemp.add(CafeModel.fromJson(data[i]));
      }

      _cafesTemp.sort((a, b) => a.name.compareTo(b.name));
      print(_cafesTemp.toString());
      setState(() {
        cafes = _cafesTemp;
      });
    } else {
      throw Exception('Failed to load favorite cafés');
    }
  }

  _deleteCafeFromFavorites(String mvid) async {
    Uri deleteFavouriteUrl =
        Uri.parse('https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/'
            'cafes/${widget.user.getEmail}/removefavourite/${mvid}');

    final response = await http.delete(deleteFavouriteUrl);
  }
}

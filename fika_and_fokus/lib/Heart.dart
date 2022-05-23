// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CafeItemModel.dart';
import 'CafePage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:map_launcher/map_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CafeItemModel.dart';

class Heart extends StatefulWidget {
  CafeItem currentCafe;
  Heart({Key? key, required this.currentCafe}) : super(key: key);

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  FaIcon notFilledHeart = FaIcon(FontAwesomeIcons.heart, color: Colors.red);
  FaIcon filledHeart = FaIcon(FontAwesomeIcons.solidHeart, color: Colors.red);
  late FaIcon heart;
  late bool isHeartFilled;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ShapeBorder.lerp(CircleBorder(), CircleBorder(), 2),
      child: FutureBuilder(
          future: _checkIfCafeIsFavorite(),
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return IconButton(
                  onPressed: () {
                    _toggleHeart();
                  },
                  iconSize: 35,
                  icon: filledHeart);
            } else {
              return IconButton(
                  onPressed: () {
                    _toggleHeart();
                  },
                  iconSize: 35,
                  icon: notFilledHeart);
            }
          }),
    );
  }

  _toggleHeart() async {
    var isFavorite = await _checkIfCafeIsFavorite();
    print(isFavorite.toString());
    print(widget.currentCafe.id);
    if (isFavorite == false) {
      _addCafeToDataBase();
      Uri addFavouriteUrl = Uri.parse(
          'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${"sten@gmail.com"}/addfavourite/${widget.currentCafe.id}');

      final response = await http.post(addFavouriteUrl);

      setState(() {
        heart = filledHeart;
        isHeartFilled = true;
      });
    } else {
      Uri deleteFavouriteUrl = Uri.parse(
          'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${"sten@gmail.com"}/removefavourite/${widget.currentCafe.id}');

      final response = await http.delete(deleteFavouriteUrl);

      setState(() {
        heart = notFilledHeart;
        isHeartFilled = false;
      });
    }
  }

  Future<bool> _checkIfCafeIsFavorite() async {
    Uri getFavouritesUrl = Uri.parse(
        'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${"sten@gmail.com"}/favourites');

    final response = await http.get(getFavouritesUrl);

    if (response.statusCode == 200) {
      String source = Utf8Decoder().convert(response.bodyBytes);
      var data = json.decode(source);

      List favorites = [];
      for (var i = 0; i < data.length; i++) {
        favorites.add(CafeItem.fromJson(data[i]));
      }

      for (CafeItem item in favorites) {
        if (item.id == widget.currentCafe.id) {
          setState(() {
            isHeartFilled = true;
          });
          return true;
        }
      }

      return false;
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  _addCafeToDataBase() async {
    //  OBS: MÅSTE ÄNDRA SÅ ATT DET ÄR "...group-1-75.." - URL:en
    Uri addCafeUrl = Uri.parse(
        'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/add?'
        'id=${widget.currentCafe.id}&'
        'address=${widget.currentCafe.address}&'
        'name=${widget.currentCafe.name}&'
        'lat=${widget.currentCafe.lat}&'
        'lng=${widget.currentCafe.long}&'
        'price=${widget.currentCafe.price}&'
        'rating=${widget.currentCafe.rating}');

    print(widget.currentCafe.lat);
    print(widget.currentCafe.long);
    // print(widget.markedPriceLevel);
    // print(widget.markedRating);
    final response = await http.post(addCafeUrl);
    print(response.body);
  }
}

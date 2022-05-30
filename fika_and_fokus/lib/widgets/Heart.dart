import 'package:flutter/material.dart';
import '../models/CafeModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/UserModel.dart';

class Heart extends StatefulWidget {
  final CafeModel currentCafe;
  UserModel user = UserModel(userName: "", email: "", password: "");

  Heart({Key? key, required this.currentCafe, required this.user})
      : super(key: key);

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  FaIcon notFilledHeart = const FaIcon(FontAwesomeIcons.heart, color: Colors.red);
  FaIcon filledHeart = const FaIcon(FontAwesomeIcons.solidHeart, color: Colors.red);
  late FaIcon heart;

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

    if (isFavorite == false) {
      _addCafeToDataBase();
      Uri addFavouriteUrl = Uri.parse(
          'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${widget.user.getEmail}/addfavourite/${widget.currentCafe.id}');

      final response = await http.post(addFavouriteUrl);

      if(response.statusCode == 200) {
        setState(() {
          heart = filledHeart;
        });
      } else {
        throw Exception('Failed add favourite');
      }
    } else {
      Uri deleteFavouriteUrl = Uri.parse(
          'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${widget.user.getEmail}/removefavourite/${widget.currentCafe.id}');

      final response = await http.delete(deleteFavouriteUrl);

      if(response.statusCode == 200) {
        setState(() {
          heart = notFilledHeart;
        });
      } else {
        throw Exception('Failed delete favourite');
      }
    }
  }

  Future<bool> _checkIfCafeIsFavorite() async {
    Uri getFavouritesUrl = Uri.parse(
        // 'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${widget.user.getEmail}/favourites');
      'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/user/${widget.user.getEmail}/favourites/${widget.currentCafe.id}');

    final response = await http.get(getFavouritesUrl);

    if (response.statusCode == 200) {
      // String source = const Utf8Decoder().convert(response.bodyBytes);
      // var data = json.decode(source);
      //
      // List favorites = [];
      // for (var i = 0; i < data.length; i++) {
      //   favorites.add(CafeModel.fromJson(data[i]));
      // }
      //
      // for (CafeModel item in favorites) {
      //   if (item.id == widget.currentCafe.id) {
      //     return true;
      //   }
      // }

      return true;
    } else if (response.statusCode == 404) {
      return false;
    } else {
      throw Exception('Failed to connect to database');
    }
  }

  _addCafeToDataBase() async {
    Uri addCafeUrl = Uri.parse(
        'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/add?'
        'id=${widget.currentCafe.id}&'
        'address=${widget.currentCafe.address}&'
        'name=${widget.currentCafe.name}&'
        'lat=${widget.currentCafe.lat}&'
        'lng=${widget.currentCafe.long}&'
        'price=${widget.currentCafe.price}&'
        'rating=${widget.currentCafe.rating}');

    final response = await http.post(addCafeUrl);

    if(response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to add café to database');
    }
  }
}

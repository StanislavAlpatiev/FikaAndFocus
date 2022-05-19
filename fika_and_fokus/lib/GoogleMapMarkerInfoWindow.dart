// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CafeItemModel.dart';
import 'CafePage.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MarkerInfoWindow extends StatefulWidget {

  String markedVenueName;
  double markedRating;
  String markedAddress;
  double markedLong;
  double markedLat;
  String markedVenueId;
  String markedDistance;
  int markedPriceLevel;

  MarkerInfoWindow({
    Key? key,
    required this.markedVenueName,
    required this.markedRating,
    required this.markedAddress,
    required this.markedLong,
    required this.markedLat,
    required this.markedVenueId,
    required this.markedDistance,
    required this.markedPriceLevel
  }) : super(key: key);

  @override
  State<MarkerInfoWindow> createState() => _MarkerInfoWindowState();
}

class _MarkerInfoWindowState extends State<MarkerInfoWindow> {
  Icon notFilledHeart = Icon(CupertinoIcons.heart, color: Colors.red);
  Icon filledHeart = Icon(CupertinoIcons.heart_fill, color: Colors.red);
  late Icon heart;
  late bool isHeartFilled;

  void goToGoogleMapsApp() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(

      child: GestureDetector(

        child: Container(

          // color: Colors.red,
            decoration: BoxDecoration(
                color:Colors.white,
                // border: Border.all(
                //     color: Colors.red
                // ),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                //borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(2,3)
                  )
                ]
            ),
            child: Container(
              // color: Color(0xFF75AB98),
              margin:
              EdgeInsets.only(left: 60.0, top: 0.0, right: 60.0, bottom: 0.0),
              height: 170,
              // width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    // could be sizebox instead of row
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(widget.markedVenueName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Oswald',
                                fontSize: 30,
                                decoration: TextDecoration.none),
                            textAlign: TextAlign.left),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(widget.markedRating.toString(), textAlign: TextAlign.left, style: TextStyle(fontSize: 25,),),
                        Icon(Icons.star),
                      ]),
                      Text(" " + widget.markedDistance, textAlign: TextAlign.left, style: TextStyle(fontSize: 25,))
                    ],
                  ),
                  SizedBox(
                    height: 0.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: IconButton(
                          iconSize: 50,
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // CafeItem cafeItem = CafeItem(widget.markedVenueId, widget.markedVenueName, widget.markedPriceLevel.toString(), widget.markedRating);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CafePage(CafeItem(widget.markedVenueId, widget.markedVenueName, widget.markedAddress, widget.markedLat, widget.markedLong, widget.markedPriceLevel.toString(), widget.markedRating)))                            );
                          },
                        ),
                      ),
                      FutureBuilder(
                            future: _checkIfCafeIsFavorite(),
                            builder: (context, snapshot) {
                            if (snapshot.data == true) {
                              return IconButton(
                                  onPressed: () {
                                    _toggleHeart();
                                  },
                                  iconSize: 50,
                                  icon: filledHeart
                              );
                            } else {
                              return IconButton(
                                  onPressed: () {
                                    _toggleHeart();
                                  },
                                  iconSize: 50,
                                  icon: notFilledHeart
                              );
                            }
                          }
                      ),
                      Container(
                        // height: 50,
                        // width: 100,
                        child: IconButton(
                          onPressed: () { },
                          iconSize: 50,
                          icon: Icon(
                            Icons.directions_walk,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
  
  _toggleHeart() async {
    var isFavorite = await _checkIfCafeIsFavorite();
    print(isFavorite.toString());
    print(widget.markedVenueId);
    if (isFavorite == false) {
      Uri addFavouriteUrl = Uri.parse(
          'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${"sten@gmail.com"}/addfavourite/${widget
              .markedVenueId}');

      final response = await http.post(addFavouriteUrl);

      setState(() {
        heart = filledHeart;
        isHeartFilled = true;
      });
    } else {
      Uri deleteFavouriteUrl = Uri.parse(
          'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${"sten@gmail.com"}/removefavourite/${widget
              .markedVenueId}');

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
        if (item.id == widget.markedVenueId) {
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
}

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
import 'Heart.dart';

class MarkerInfoWindow extends StatefulWidget {
  String markedVenueName;
  double markedRating;
  String markedAddress;
  double markedLong;
  double markedLat;
  String markedVenueId;
  String markedDistance;
  int markedPriceLevel;

  MarkerInfoWindow(
      {Key? key,
      required this.markedVenueName,
      required this.markedRating,
      required this.markedAddress,
      required this.markedLong,
      required this.markedLat,
      required this.markedVenueId,
      required this.markedDistance,
      required this.markedPriceLevel})
      : super(key: key);

  @override
  State<MarkerInfoWindow> createState() => _MarkerInfoWindowState();
}

class _MarkerInfoWindowState extends State<MarkerInfoWindow> {
  List<TextDecoration> dec = [
    TextDecoration.overline,
    TextDecoration.underline
  ];
  FaIcon notFilledHeart = FaIcon(FontAwesomeIcons.heart, color: Colors.red);
  FaIcon filledHeart = FaIcon(FontAwesomeIcons.solidHeart, color: Colors.red);
  late FaIcon heart;
  late bool isHeartFilled;

  void goToGoogleMapsApp() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: const [
                    0.05,
                    0.4,
                    0.7,
                  ],
                  colors: const [
                    Color(0xFFE0DBCF),
                    Color(0xFF75AB98),
                    Color(0xFF696969),
                  ],
                ),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(2, 3))
                ]),
            child: Container(
              margin: EdgeInsets.only(
                  left: 40.0, top: 0.0, right: 40.0, bottom: 0.0),
              height: 170,
              // width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 5),
                        child: Text(widget.markedVenueName,
                            style: GoogleFonts.oswald(
                              textStyle: const TextStyle(letterSpacing: .5),
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                              color: Color(0xFFFFFFFF)),
                            textAlign: TextAlign.left),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                           Row(children: [
                            Text(
                              widget.markedRating.toString(),
                              textAlign: TextAlign.left,
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Icon(
                                Icons.star,
                                color: Colors.white,
                                // color: Colors.amber,
                                size: 25,
                              ),
                            ),
                          ]),
                        Text(" " + widget.markedDistance,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 25,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0x22FFFFFF),
                        borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: IconButton(
                              iconSize: 56,
                              icon: Icon(
                                CupertinoIcons.info_circle,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // CafeItem cafeItem = CafeItem(widget.markedVenueId, widget.markedVenueName, widget.markedPriceLevel.toString(), widget.markedRating);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CafePage(CafeItem(
                                            widget.markedVenueId,
                                            widget.markedVenueName,
                                            widget.markedAddress,
                                            widget.markedLat,
                                            widget.markedLong,
                                            widget.markedPriceLevel.toString(),
                                            widget.markedRating))));
                              },
                            ),
                          ),
                        ),
                        Heart(currentCafe: CafeItem(
                            widget.markedVenueId,
                            widget.markedVenueName,
                            widget.markedAddress,
                            widget.markedLat,
                            widget.markedLong,
                            widget.markedPriceLevel.toString(),
                            widget.markedRating)),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: IconButton(
                              onPressed: () async {
                                // if (await MapLauncher.isMapAvailable(MapType.google)) {
                                // await MapLauncher.showMarker(
                                //   mapType: MapType.google,
                                //   coords: Coords(widget.markedLat, widget.markedLong),
                                //   title: "going to " + widget.markedVenueName,
                                //   // description: description,
                                // );
                                if (MapLauncher != null){
                                  if (await MapLauncher.isMapAvailable(MapType.googleGo) as bool) {
                                    await MapLauncher.showDirections(
                                      mapType: MapType.googleGo,
                                      destination: Coords(widget.markedLat, widget.markedLong),
                                      //origin: Coords(59.2971115,17.7642534);
                                      destinationTitle: "going to " + widget.markedVenueName,
                                      // description: description,
                                    );
                                  }
                                  else if (await MapLauncher.isMapAvailable(MapType.google) as bool) {
                                    await MapLauncher.showDirections(
                                      mapType: MapType.google,
                                      destination: Coords(widget.markedLat, widget.markedLong),
                                      //origin: Coords(59.2971115,17.7642534);
                                      destinationTitle: "going to " + widget.markedVenueName,
                                      // description: description,
                                    );
                                  }
                                }
                              },
                              iconSize: 44,
                              icon: FaIcon(
                                FontAwesomeIcons.personWalking,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
      _addCafeToDataBase();
      Uri addFavouriteUrl = Uri.parse(
          'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${"sten@gmail.com"}/addfavourite/${widget.markedVenueId}');

      final response = await http.post(addFavouriteUrl);

      setState(() {
        heart = filledHeart;
        isHeartFilled = true;
      });
    } else {
      Uri deleteFavouriteUrl = Uri.parse(
          'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${"sten@gmail.com"}/removefavourite/${widget.markedVenueId}');

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

  _addCafeToDataBase() async {
    //  OBS: MÅSTE ÄNDRA SÅ ATT DET ÄR "...group-1-75.." - URL:en
    Uri addCafeUrl = Uri.parse(
        'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/add?'
        'id=${widget.markedVenueId}&'
        'address=${widget.markedAddress}&'
        'name=${widget.markedVenueName}&'
        'lat=${widget.markedLat}&'
        'lng=${widget.markedLong}&'
        'price=${widget.markedPriceLevel}&'
        'rating=${widget.markedRating}');

    print(widget.markedLat);
    print(widget.markedLong);
    print(widget.markedPriceLevel);
    print(widget.markedRating);
    final response = await http.post(addCafeUrl);
    print(response.body);
  }
}

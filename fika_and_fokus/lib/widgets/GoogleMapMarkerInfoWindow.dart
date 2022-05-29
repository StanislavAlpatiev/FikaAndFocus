// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:fika_and_fokus/widgets/DirectionButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/CafeIModel.dart';
import '../screens/CafePage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:map_launcher/map_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Heart.dart';
import '../models/CafeIModel.dart';
import '../models/UserModel.dart';
import 'DirectionButton.dart';

class MarkerInfoWindow extends StatefulWidget {
  CafeModel currentCafe;
  UserModel user = new UserModel(userName: "default", email: "", password: "");
  MarkerInfoWindow({Key? key,required this.currentCafe, required this.user}) : super(key: key);

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
                        child: Text(widget.currentCafe.name,
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
                            widget.currentCafe.rating.toString(),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CafePage(widget.currentCafe, widget.user)));
                              },
                            ),
                          ),
                        ),
                        Heart(currentCafe: widget.currentCafe, user: widget.user),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: DirectionButton(currentCafe: widget.currentCafe),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

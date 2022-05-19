// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CafeItemModel.dart';
import 'CafePage.dart';

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
                      Container(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {  },
                          child: Icon(
                            Icons.directions_walk,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF871801),
                            side: BorderSide(width: 1.0, color: Colors.black),
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
}

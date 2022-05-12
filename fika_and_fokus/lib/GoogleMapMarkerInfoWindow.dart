// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'ReportPage.dart';
// import 'TransitionPageRoute.dart';

class MarkerInfoWindow extends StatelessWidget {
  // Color green = Color(0xFF56E115);
  // Color red = Color(0xE11515);
  final String markedVenueName;
  final double markedRating;
  final String markedVenueId;
  final String markedDistance;

  const MarkerInfoWindow({
    Key? key,
    required this.markedVenueName,
    required this.markedRating,
    required this.markedVenueId,
    required this.markedDistance,
  }) : super(key: key);

  void goToGoogleMapsApp() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

      color: Color(0xFF75AB98),
      // padding: EdgeInsets.all(40.0),
      padding:
          EdgeInsets.only(left: 60.0, top: 10.0, right: 60.0, bottom: 30.0),
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(markedVenueName,
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
                Text(markedRating.toString(), textAlign: TextAlign.left, style: TextStyle(fontSize: 25,),),
                Icon(Icons.star),
              ]),
              Text(" " + markedDistance, textAlign: TextAlign.left, style: TextStyle(fontSize: 25,))
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // width: 70,
                // height: 70,
                // color: Color(0xFF871801),

                  child: IconButton(
                    iconSize: 60,
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),

              ),
              Container(
                height: 60,
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

                // child: CircleAvatar(
                //   radius: 40,
                //   backgroundColor: Color(0xFF871801),
                //   child: IconButton(
                //     // iconSize: 70,
                //     icon: Icon(
                //       Icons.directions_walk,
                //       color: Colors.white,
                //     ),
                //     onPressed: () {
                //     },
                //   ),
                // ),
              )
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    ));
  }
}

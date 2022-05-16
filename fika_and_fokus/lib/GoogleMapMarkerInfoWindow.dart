// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MarkerInfoWindow extends StatefulWidget {

  String markedVenueName;
  double markedRating;
  String markedVenueId;
  String markedDistance;

  MarkerInfoWindow({
    Key? key,
    required this.markedVenueName,
    required this.markedRating,
    required this.markedVenueId,
    required this.markedDistance,
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
                border: Border.all(
                    color: Colors.black
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(2,3)
                  )
                ]
            ),
            // child: Container(
            //   height: 200,
            //   child:Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: <Widget>[
            //     Container(
            //       height: 40, // x-button height
            //
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         crossAxisAlignment: CrossAxisAlignment.stretch,
            //         children: <Widget>[
            //           Expanded(
            //             child: Container(
            //               // color: Colors.red,
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: <Widget>[
            //                   // Text('Left', textAlign: TextAlign.center),
            //                 ],
            //               ),
            //             ),
            //           ),
            //           Expanded(
            //             child: Container(
            //               // color: Colors.green,
            //
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: <Widget>[
            //                   Text('x', textAlign: TextAlign.center),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Expanded(
            //       child: Container(
            //         // color: Colors.blue,
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: <Widget>[
            //             Text('Bottom', textAlign: TextAlign.center),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),),



            child: Container(
              // color: Color(0xFF75AB98),
              margin:
              EdgeInsets.only(left: 60.0, top: 0.0, right: 60.0, bottom: 00.0),
              height: 170,
              width: double.infinity,
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
                          onPressed: () {},
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

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'ReportPage.dart';
// import 'TransitionPageRoute.dart';

class MarkerInfoWindow extends StatelessWidget {
  // Color green = Color(0xFF56E115);
  // Color red = Color(0xE11515);
  const MarkerInfoWindow({
    Key? key,
  }) : super(key: key);

  void goToGoogleMapsApp() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(40.0),
          height: 600,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Availability',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 20,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.left),
                  Container(
                    width: 40,
                    height: 25,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                        ),
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: const Text('Location, City',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 25,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.left),
                  ),
                  Text('X,XX SEK/min', textAlign: TextAlign.left)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Station name'),
                  Text('X,XX SEK/min', textAlign: TextAlign.left)
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text('Google Maps',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 25,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.left),
                  ),
                  Container(
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        color: Color(0xffC4C4C4),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.of(context)
                        //     .push(TransitionPageRoute(child: ReportPage()));
                      },
                      child: Text(
                        'START',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  const Text('Availability',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 25,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.left),
                  Text('X,XX SEK/min', textAlign: TextAlign.left)
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  const Text('Availability',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 25,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.left),
                  Text('X,XX SEK/min', textAlign: TextAlign.left)
                ],
              )
            ],
          ),
    ));
  }
}

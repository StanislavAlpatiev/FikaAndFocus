import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'LogIn.dart';
import 'GoogleMapMarkerInfoWindow.dart';
import 'Cafe.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fika&Focus",
      home: LogIn(),
      // home: Cafe(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'LogIn.dart';
import 'GoogleMapMarkerInfoWindow.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fika&Focus",
      home: LogIn(),
    ),
  );
}

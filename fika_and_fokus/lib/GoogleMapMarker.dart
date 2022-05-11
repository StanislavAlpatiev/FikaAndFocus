import 'package:flutter/material.dart';
import 'dart:convert';

class GoogleMapMarker {
  final String venueName;
  final String venueId;
  final String venueAddress;
  final double rating;
  final int priceLevel;
  // final String title;
  // final String snippet;
  final double long;
  final double lat;

  GoogleMapMarker({
    required this.venueName,
    required this.venueId,
    required this.venueAddress,
    required this.rating,
    required this.priceLevel,
    // required this.title,
    // required this.snippet,
    required this.long,
    required this.lat
  });

  Widget buildTitle(BuildContext context) {
    return Text(venueName);
  }

  // Widget returnIcon(BuildContext context) {
  //   return place;
  // }

  factory GoogleMapMarker.fromJson(Map<String, dynamic> json) {

    // Marker(
    //   markerId: MarkerId('venueName'),
    //   draggable: false,
    //   infoWindow: InfoWindow(
    //     title: 'title',
    //     snippet: 'snippet',
    //
    //   ),
    //   onTap: () {
    //     print('Market Taped');
    //   },
    //   position: LatLng(long, lat),
    // )

    return GoogleMapMarker(venueName : json['venue_name'], venueId : json['venue_id'], venueAddress : json['venue_address'], priceLevel : json['price_level'], rating : json['rating'], long : json['venue_lng'], lat : json['venue_lat']);
  }
}



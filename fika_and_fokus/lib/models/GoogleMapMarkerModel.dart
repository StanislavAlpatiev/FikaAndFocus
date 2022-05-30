import 'package:flutter/material.dart';
import 'dart:convert';
import 'CafeModel.dart';

class GoogleMapMarkerModel {
  CafeModel cafeItem;

  GoogleMapMarkerModel({
    required this.cafeItem,
  });

  Widget buildTitle(BuildContext context) {
    return Text(cafeItem.name);
  }

  factory GoogleMapMarkerModel.fromJson(Map<String, dynamic> json) {
    CafeModel tempCafeItem = CafeModel(
        json['venue_id'],
        json['venue_name'],
        json['venue_address'],
        json['venue_lat'],
        json['venue_lng'],
        json['price_level'].toString(),
        json['rating']);
    return GoogleMapMarkerModel(cafeItem : tempCafeItem);
  }
}

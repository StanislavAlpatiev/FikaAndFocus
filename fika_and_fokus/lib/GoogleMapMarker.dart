import 'package:flutter/material.dart';
import 'dart:convert';
import 'CafeItemModel.dart';

class GoogleMapMarker {
  CafeItem cafeItem;

  GoogleMapMarker({
    required this.cafeItem,
  });

  Widget buildTitle(BuildContext context) {
    return Text(cafeItem.name);
  }

  factory GoogleMapMarker.fromJson(Map<String, dynamic> json) {
    CafeItem tempCafeItem = CafeItem(
        json['venue_id'],
        json['venue_name'],
        json['venue_address'],
        json['venue_lat'],
        json['venue_lng'],
        json['price_level'].toString(),
        json['rating']);
    return GoogleMapMarker(cafeItem : tempCafeItem);
  }
}

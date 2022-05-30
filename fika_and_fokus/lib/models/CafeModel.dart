import 'package:flutter/material.dart';

class CafeModel {
  final String id;
  final String name;
  final String address;
  final double lat;
  final double long;
  final String price;
  final double rating;

  CafeModel(this.id, this.name, this.address, this.lat, this.long, this.price, this.rating);

  Widget returnId(BuildContext context) {
    return Text(id);
  }

  Widget buildTitle(BuildContext context) {
    return Text(name);
  }

  Text buildPrice(BuildContext context) {
    return Text(price);
  }

  double buildRating(BuildContext context) {
    return rating;
  }

  factory CafeModel.fromJson(Map<String, dynamic> json) {
    String tempPrice;

    if (json['price'] == '0') {
      tempPrice = '\$';
    } else if (json['price'] == '1') {
      tempPrice = '\$\$';
    } else {
      tempPrice = '\$\$\$';
    }

    return CafeModel(json['id'], json['name'], json['address'],  double.parse(json['lat']),  double.parse(json['lng']), tempPrice, double.parse(json['rating']));
  }
}
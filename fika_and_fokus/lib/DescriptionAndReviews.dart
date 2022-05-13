import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GoogleMap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'GoogleMapMarkerInfoWindow.dart';

class DescriptionAndReviews extends StatefulWidget {

  String venueName;


  DescriptionAndReviews ({Key? key, required this.venueName, }) :super(key: key);

  @override
  State<DescriptionAndReviews> createState() => _DescriptionAndReviewsState(venueName: venueName);

}

class _DescriptionAndReviewsState extends State<DescriptionAndReviews> {
  var venueName;


  _DescriptionAndReviewsState ({required this.venueName});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return Container(
        alignment: Alignment.center,
        child: Text(venueName),
      
    );





    throw UnimplementedError();
  }







  }

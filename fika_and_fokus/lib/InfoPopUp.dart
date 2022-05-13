import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GoogleMap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'GoogleMapMarkerInfoWindow.dart';

class InfoPopUp extends StatefulWidget {

  final Widget child;
  final Function callback;
  String venueName;
  double venueRating;
  String venueId;
  InfoPopUp ({Key? key, required this.child, required this.callback, required this.venueName, required this.venueRating, required this.venueId}) :super(key: key);


  @override
  State<InfoPopUp> createState() => _InfoPopUpState(callback: callback, venueName: venueName, venueRating: venueRating, venueId: venueId);

}

class _InfoPopUpState extends State<InfoPopUp> {



  _InfoPopUpState ({required this.callback,required this.venueName, required this.venueRating, required this.venueId});

  bool isVisable = true;
  bool isInfoVisable = true;
  String venueName;
  double venueRating;
  String venueId;

  final Function callback;

  Widget build(BuildContext context) {
    // TODO: implement build
    return Visibility(
      visible: isInfoVisable,
      maintainInteractivity: false,
      child: MarkerInfoWindow(markedVenueName:venueName,markedVenueId: venueId, markedRating: venueRating, markedDistance: '', ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>

      DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
        ),
      );


}
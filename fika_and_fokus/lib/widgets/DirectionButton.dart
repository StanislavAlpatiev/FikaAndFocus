import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:map_launcher/map_launcher.dart';

import '../models/CafeIModel.dart';

class DirectionButton extends StatefulWidget {
  CafeModel currentCafe;

  DirectionButton({Key? key, required this.currentCafe}) : super(key: key) {
    currentCafe = currentCafe;
  }


  @override
  State<DirectionButton> createState() => _DirectionButtonState();
}

class _DirectionButtonState extends State<DirectionButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        // if (await MapLauncher.isMapAvailable(MapType.google)) {
        // await MapLauncher.showMarker(
        //   mapType: MapType.google,
        //   coords: Coords(widget.markedLat, widget.markedLong),
        //   title: "going to " + widget.markedVenueName,
        //   // description: description,
        // );
        if (MapLauncher != null) {
          if (await MapLauncher.isMapAvailable(
              MapType.googleGo) as bool) {
            await MapLauncher.showDirections(
              mapType: MapType.googleGo,
              destination: Coords(
                  widget.currentCafe.lat,
                  widget.currentCafe.long),
              //origin: Coords(59.2971115,17.7642534);
              destinationTitle:
              "going to " + widget.currentCafe.name,
              // description: description,
            );
          } else if (await MapLauncher.isMapAvailable(
              MapType.google) as bool) {
            await MapLauncher.showDirections(
              mapType: MapType.google,
              destination: Coords(
                  widget.currentCafe.lat,
                  widget.currentCafe.long),
              //origin: Coords(59.2971115,17.7642534);
              destinationTitle:
              "going to " + widget.currentCafe.name,
              // description: description,
            );
          }
        }
      },
      iconSize: 44,
      icon: FaIcon(
        FontAwesomeIcons.personWalkingArrowRight,
        color: Colors.white,
      ),
    );
  }
}




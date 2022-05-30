import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import '../models/CafeModel.dart';

class DirectionButton extends StatefulWidget {
  final CafeModel currentCafe;

  const DirectionButton({Key? key, required this.currentCafe})
      : super(key: key);

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
        if (MapLauncher != null) {
          if (await MapLauncher.isMapAvailable(MapType.googleGo) as bool) {
            await MapLauncher.showDirections(
              mapType: MapType.googleGo,
              destination:
                  Coords(widget.currentCafe.lat, widget.currentCafe.long),
              destinationTitle: "going to " + widget.currentCafe.name,
            );
          } else if (await MapLauncher.isMapAvailable(MapType.google) as bool) {
            await MapLauncher.showDirections(
              mapType: MapType.google,
              destination:
                  Coords(widget.currentCafe.lat, widget.currentCafe.long),
              destinationTitle: "going to " + widget.currentCafe.name,
            );
          }
        }
      },
      iconSize: 44,
      icon: const FaIcon(
        FontAwesomeIcons.personWalkingArrowRight,
        color: Colors.white,
      ),
    );
  }
}

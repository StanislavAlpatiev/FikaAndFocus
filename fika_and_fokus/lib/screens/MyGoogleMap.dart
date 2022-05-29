//import 'dart:html';

// import 'dart:html';

import 'package:fika_and_fokus/widgets/FilterWindow.dart';
import 'package:fika_and_fokus/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/GoogleMapMarkerModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/GoogleMapMarkerInfoWindow.dart';
import '../models/CafeIModel.dart';

// import 'package:location/location.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';

class MyGoogleMap extends StatefulWidget {
  late UserModel user = new UserModel(userName: "", email: "", password: "");
  MyGoogleMap(UserModel user, {Key? key}) : super(key: key){
    this.user = user;
  }


  // @override
  State<MyGoogleMap> createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  late GoogleMapController mapController;

  // final Geolocator geolocator = Geolocator();
  late Position _currentPosition;
  List<Marker> allMarkers = [];

  bool isVisible = false;

  CafeModel currentCafe = CafeModel("", "", "", 0.0, 0.0, "", 0.0);
  bool isInfoVisible = false;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  //callback from FilterWindow Widget/Class
  callback(businessLevel, radius, callbackStatus) {
    setState(() {
      if (callbackStatus == "search") {
        _createMarkers(
            businessLevel.round().toString(), radius.round().toString());
      }
      _changeVisibility();
      //test för att se i konsollen
      print(businessLevel);
      print(radius);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      // SearchBar(),
      GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(59.32967345111922, 18.068326509937545), zoom: 17.0),
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        onMapCreated: _onMapCreated,
        compassEnabled: false,
        mapToolbarEnabled: false,
        // myLocationEnabled: true,
        buildingsEnabled: true,
        tiltGesturesEnabled: false,
        markers: Set<Marker>.of(allMarkers),
        // mapToolbarEnabled: true,
        padding: EdgeInsets.only(top: 0, right: 0),
      ),

      Positioned(
          bottom: 11,
          right: 30,
          child: ElevatedButton(
              child: Icon(Icons.attribution, color: Color(0xFFB95815)),
              style: ElevatedButton.styleFrom(primary: Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )
              ),
              onPressed: _animateToUser)),

      Positioned(
          bottom: 11,
          right: 110,
          child: Visibility(
            visible: true,
            maintainInteractivity: false,
            child: ElevatedButton(
                child: Icon(Icons.search, color: Color(0xFFFFFFFF)),
                // style: TextButton.styleFrom(backgroundColor: Colors.blue),
                style: ElevatedButton.styleFrom(primary: Color(0xFF75AB98),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  )
                ),
                onPressed: _changeVisibility),
          )),

      Align(
        alignment: Alignment.topRight,
        child: Visibility(
          visible: isVisible,
          maintainInteractivity: false,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: FilterWindow(
                child: ElevatedButton(
                    onPressed: _changeVisibility, child: Text("cancel")),
                callback: callback,
              )),
        ),
      ),

      Align(
        alignment: Alignment.bottomCenter,
        child: Dismissible(
          child: Visibility(
            // visible: true, // for development purposes, so you don't need to click markers
            visible: isInfoVisible, // correct one
            maintainInteractivity: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: GestureDetector(
                  child: MarkerInfoWindow(
                    user: widget.user,
                    currentCafe: currentCafe,
              )),
            ),
          ),
          direction: DismissDirection.vertical,
          key: UniqueKey(),
          onDismissed: (DismissDirection direction) {
            print("dismissed");
            // _disableInfoVisibility();
          },
        ),
      )
    ]));
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    final position = await GeolocatorPlatform.instance.getCurrentPosition();
    setState(() {
      _currentPosition = position;
    });
  }

  _animateToUser() async {
    _disableInfoVisibility(); // hindrar info window att visas
    _getCurrentPosition();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
      zoom: 17.0,
    )));
  }

  Future _createMarkers(String businessLevel, String radius) async {
    Uri sampleFriendsURI = Uri.parse(
        "https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/locations?busy_min=0&busy_max=" +
            businessLevel +
            "&radius=" +
            radius +
            // "&lng=" +
            // "18.068326509937545" +
            // "&lat=" +
            // "59.32967345111922"
        "&lng=" + _currentPosition.longitude.toString() + "&lat=" + _currentPosition.latitude.toString()
        );
    final response = await http.get(sampleFriendsURI);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print(response.body);
      _removeMarker();
      Map<String, dynamic> responseJson = json.decode(response.body);
      List venues = responseJson['venues'];
      List<GoogleMapMarkerModel> venuesData =
          venues.map((dynamic item) => GoogleMapMarkerModel.fromJson(item)).toList();
      List<Marker> _markers = [];
      for (GoogleMapMarkerModel venue in venuesData) {
        _markers.add(Marker(
          markerId: MarkerId(venue.cafeItem.id),
          draggable: false,
          infoWindow: InfoWindow(
            title: venue.cafeItem.name,
            snippet: venue.cafeItem.address,
          ),
          onTap: () {
            // info-window related - Anton
            setState(() {
              currentCafe = venue.cafeItem;
            });
            _enableInfoVisibility();
          },
          position: LatLng(venue.cafeItem.lat, venue.cafeItem.long),
        ));
      }
      setState(() {
        allMarkers = _markers;
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // info window related - Anton
  _enableInfoVisibility() async {
    setState(() {
      // isInfoVisible = !isInfoVisible;
      if (!isInfoVisible) {
        isInfoVisible = true;
      }
    });
  }

  // info window related - Anton
  _disableInfoVisibility() async {
    setState(() {
      // isInfoVisible = !isInfoVisible;
      if (isInfoVisible) {
        isInfoVisible = false;
      }
    });
  }

  _removeMarker() async {
    setState(() {
      allMarkers.clear();
    });
  }

  _search() async {
    Position location = await GeolocatorPlatform.instance.getCurrentPosition();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(location.latitude, location.longitude),
      zoom: 17.0,
    )));
  }

  _changeVisibility() async {
    setState(() {
      _disableInfoVisibility(); // prevents this setState from showing info window
      isVisible = !isVisible;
    });
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled =
        await GeolocatorPlatform.instance.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      GeolocatorPlatform.instance.requestPermission();

      return false;
    }

    permission = await GeolocatorPlatform.instance.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await GeolocatorPlatform.instance.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        GeolocatorPlatform.instance.requestPermission();

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      GeolocatorPlatform.instance.openLocationSettings();
      // GeolocatorPlatform.instance.requestPermission();
      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return true;
  }
}

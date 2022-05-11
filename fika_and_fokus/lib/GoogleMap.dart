import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'GoogleMapMarker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:location/location.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class MyGoogleMap extends StatefulWidget {
  const MyGoogleMap({Key? key}) : super(key: key);

  // @override
  State<MyGoogleMap> createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  late GoogleMapController mapController;

  // final Geolocator geolocator = Geolocator();
  late Position _currentPosition;
  List<Marker> allMarkers = [];

  // late String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    // allMarkers.add(
    //     Marker(
    //         markerId: MarkerId('Test Marker'),
    //         draggable: false,
    //         onTap: () {
    //           print('Market Taped');
    //         },
    //         position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
    //     ));
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
            myLocationButtonEnabled: true,
            onMapCreated: _onMapCreated,

            // myLocationEnabled: true,
            buildingsEnabled: true,
            tiltGesturesEnabled: false,
            markers: Set<Marker>.of(allMarkers),
            // mapToolbarEnabled: true,
            padding: EdgeInsets.only(top: 510, right: 10),
          ),
          // SearchBar(),
          Positioned(
              bottom: 11,
              right: 60,
              child: ElevatedButton(
                  child: Icon(Icons.attribution, color: Colors.deepOrangeAccent),
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: _animateToUser
              )),
          Positioned(
              bottom: 60,
              right: 60,
              child: ElevatedButton(
                  child: Icon(Icons.pin_drop, color: Colors.white),
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  // onPressed: _addMarker
                onPressed: _createMarkers,
              )),
          Positioned(
              bottom: 11,
              right: 140,
              child: ElevatedButton(
                  child: Icon(Icons.search, color: Colors.white),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  // onPressed: _removeMarker
                  onPressed: _removeMarker,
              )),
        ]));
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    });
  }

  _animateToUser() async {
    Position location = await GeolocatorPlatform.instance.getCurrentPosition();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(location.latitude, location.longitude),
      zoom: 17.0,
    )));
  }

  _addMarker() async {
    setState(() {
      allMarkers.add(Marker(
        markerId: MarkerId('Test Marker'),
        draggable: false,
        infoWindow: InfoWindow(
          title: 'This is a info window!',
          snippet: 'this is Snipet text',

        ),
        onTap: () {
          print('Market Taped');
        },
        position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
      ));
    });
  }

  Future _createMarkers() async {
    Uri sampleFriendsURI =
    Uri.parse('https://besttime.app/api/v1/venues/filter?'
        'api_key_private=pri_50709d58bc7444f3aa6739695d46050a&busy_min=0&'
        'busy_max=50&types=CAFE&lat=59.406845369242845&lng=17.945222498470716&radius=10000&'
        'order_by=now%2Cnow&order=asc%2Cdesc&foot_traffic=both&limit=5&page=0');
    //https://glitch.com/edit/#!/chiseled-spotted-individual
    final response = await http.get(sampleFriendsURI);
    // var data = json.decode(response.body);
    Map<String, dynamic> responseJson = json.decode(response.body);
    List data = responseJson['venues'];
    List<GoogleMapMarker> venues =
    data.map((dynamic item) => GoogleMapMarker.fromJson(item)).toList();
    for(GoogleMapMarker venue in venues) {
      // List<Marker> _markers = [];
      //var _friendsTemp = [];
      // for (var i = 0; i < data.length; i++) {
      //   print(data.toString());
      //   print(responseJson['venues'].toString());
      //_markers.add(GoogleMapMarker.fromJson(data[i]));
      setState(() {
        allMarkers.add(Marker(
          markerId: MarkerId(venue.venueName),
          draggable: false,
          infoWindow: InfoWindow(
            title: venue.venueName,
            snippet: 'venue snippet text',

          ),
          onTap: () {
            print('Market Taped');
          },
          position: LatLng(venue.lat, venue.long),
        ));
      });
      // }
    }
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
}
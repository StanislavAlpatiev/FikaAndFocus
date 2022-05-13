//import 'dart:html';

import 'package:fika_and_fokus/FilterWindow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'GoogleMapMarker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'GoogleMapMarkerInfoWindow.dart';

// import 'package:location/location.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';

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

  bool isVisible = true;
  var businessLevel;
  var radius;


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

  //callback from FilterWindow Widget/Class
  callback(businessLevel, radius){
    setState(() {
      this.businessLevel = businessLevel;
      this.radius = radius;
      _createMarkers();
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
                onPressed: _requestLocationPermission,
              )),
          Positioned(
              bottom: 11,
              right: 140,
              child: Visibility(

                visible: true,
                maintainInteractivity: false,

                child: ElevatedButton(
                    child: Icon(Icons.search, color: Colors.white),
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: _removeMarker
                    //onPressed:
                ),
              )),
          Positioned(
              bottom: 550,
              right: 320,
              child: Visibility(

                visible: true,
                maintainInteractivity: false,

                child: ElevatedButton(
                  child: Icon(Icons.info, color: Colors.white),
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  // onPressed: _removeMarker
                  onPressed: _changeVisibility,
                ),
              )),
          Align(
              alignment: Alignment.topRight,
              child: Visibility(

                visible: isVisible,
                maintainInteractivity: false,

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,40,5,0),
                  child: FilterWindow(
                    child: ElevatedButton(
                          onPressed: _changeVisibility,
                          child: Text("cancel")),
                    callback: callback,

                    )
                  ),
                ),
              ),

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
    mapController.animateCamera(CameraUpdate.newCameraPosition(const CameraPosition(
      // target: LatLng(location.latitude, location.longitude),
      target: LatLng(59.3247819, 18.0699477),
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
    // Uri.parse("https://besttime.app/api/v1/venues/filter?api_key_private=pri_50709d58bc7444f3aa6739695d46050a&busy_min=0&busy_max=100&types=CAFE&lat=59.3247819&lng=18.0699477&radius=2000&order_by=now%2Cnow&order=asc%2Cdesc&foot_traffic=both&limit=5&page=0");
    //Uri.parse("http://group-1-75.pvt.dsv.su.se/cafes/locations?busy_min=0&busy_max=100&radius=500&lng=18.0699477&lat=59.3247819");
    Uri.parse("http://group-1-75.pvt.dsv.su.se/cafes/locations?busy_min=0&busy_max=" + businessLevel.round().toString() + "&radius="  + radius.round().toString() + "&lng=18.0699477&lat=59.3247819");
    // Uri.parse("http://192.168.1.80:8080/cafes/locations?busy_min=0&busy_max=100&radius=500&lng=18.0699477&lat=59.3247819");
    // Uri.parse("http://192.168.0.14:8080/cafes/locations?busy_min=0&busy_max=100&radius=500&lng=18.0699477&lat=59.3247819");
    // {"status":"OK","venues":[{"day_info":{"day_int":3,"day_max":49,"day_mean":29,"day_rank_max":4,"day_rank_mean":4,"day_text":"Thursday","venue_closed":17,"venue_open":8},"day_int":3,"day_raw":[0,0,10,15,20,20,25,35,45,50,35,0,0,0,0,0,0,0,0,0,0,0,0,0],"day_raw_whole":[0,0,10,15,20,20,25,35,45,50,35,0,0,0,0,0,0,0,0,0,0,0,0,0],"price_level":2,"rating":4.2,"reviews":958,"venue_address":"Stora Nygatan 32 111 27 Stockholm Sweden","venue_dwell_time_max":60,"venue_dwell_time_min":30,"venue_id":"ven_496233356c534f6569305552593058334a2d56455958624a496843","venue_lat":59.3238939,"venue_lng":18.0696015,"venue_name":"Caf\u00e9 Kladdkakan","venue_type":"CAFE"},{"day_info":{"day_int":3,"day_max":20,"day_mean":9,"day_rank_max":3,"day_rank_mean":4,"day_text":"Thursday","venue_closed":20,"venue_open":10},"day_int":3,"day_raw":[0,0,0,0,0,5,10,15,20,20,10,5,5,5,0,0,0,0,0,0,0,0,0,0],"day_raw_whole":[0,0,0,0,0,5,10,15,20,20,10,5,5,5,0,0,0,0,0,0,0,0,0,0],"price_level":0,"rating":4.4,"reviews":172,"venue_address":"Skomakargatan 9 111 29 Stockholm Sweden","venue_dwell_time_max":60,"venue_dwell_time_min":30,"venue_id":"ven_7758763247775f495a433152593058334a4f394b6535674a496843","venue_lat":59.3244017,"venue_lng":18.0709397,"venue_name":"Coffee Stop","venue_type":"CAFE"},{"day_info":{"day_int":3,"day_max":49,"day_mean":33,"day_rank_max":6,"day_rank_mean":5,"day_text":"Thursday","venue_closed":20,"venue_open":7},"day_int":3,"day_raw":[0,10,20,30,40,50,50,45,45,50,45,30,15,5,0,0,0,0,0,0,0,0,0,0],"day_raw_whole":[0,10,20,30,40,50,50,45,45,50,45,30,15,5,0,0,0,0,0,0,0,0,0,0],"price_level":2,"rating":4.2,"reviews":763,"venue_address":"V\u00e4sterl\u00e5nggatan 57 111 29 Stockholm Sweden","venue_dwell_time_max":60,"venue_dwell_time_min":30,"venue_id":"ven_30755f585479317a7a5f4f52593058334a2d39373877764a496843","venue_lat":59.3240556,"venue_lng":18.0707138,"venue_name":"Espresso House","venue_type":"CAFE"},{"day_info":{"day_int":3,"day_max":37,"day_mean":22,"day_rank_max":5,"day_rank_mean":4,"day_text":"Thursday","venue_closed":21,"venue_open":9},"day_int":3,"day_raw":[0,0,0,5,5,10,25,35,35,30,20,25,30,30,15,0,0,0,0,0,0,0,0,0],"day_raw_whole":[0,0,0,5,5,10,25,35,35,30,20,25,30,30,15,0,0,0,0,0,0,0,0,0],"price_level":2,"rating":3.9,"reviews":576,"venue_address":"Stora Nygatan 37 111 27 Stockholm Sweden","venue_dwell_time_max":0,"venue_dwell_time_min":0,"venue_id":"ven_347145374a71636876366952593058334a652d374d52744a496843","venue_lat":59.3235766,"venue_lng":18.0703647,"venue_name":"Caf\u00e9 Kronan","venue_type":"CAFE"},{"day_info":{"day_int":3,"day_max":58,"day_mean":33,"day_rank_max":3,"day_rank_mean":4,"day_text":"Thursday","venue_closed":22,"venue_open":9},"day_int":3,"day_raw":[0,0,0,15,25,30,35,40,45,55,60,55,40,25,10,5,0,0,0,0,0,0,0,0],"day_raw_whole":[0,0,0,15,25,30,35,40,45,55,60,55,40,25,10,5,0,0,0,0,0,0,0,0],"price_level":2,"rating":4.2,"reviews":724,"venue_address":"Stortorget 20 111 29 Stockholm Sweden","venue_dwell_time_max":0,"venue_dwell_time_min":0,"venue_id":"ven_4953584f30694d6431344552593058334a2d593058346c4a496843","venue_lat":59.3249056,"venue_lng":18.0703528,"venue_name":"Kaffekoppen","venue_type":"CAFE"}],"venues_n":5,"window":{"day_window":"Thursday 6AM until Friday 5AM","day_window_end_int":4,"day_window_end_txt":"Friday","day_window_start_int":3,"day_window_start_txt":"Thursday","time_local":18,"time_local_12":"6PM","time_local_index":12,"time_window_end":5,"time_window_end_12h":"5AM","time_window_end_ix":23,"time_window_start":6,"time_window_start_12h":"6AM","time_window_start_ix":0}}
    final response = await http.get(sampleFriendsURI);
    print(response.body);
    Map<String, dynamic> responseJson = json.decode(response.body);
    List venues = responseJson['venues'];
    List<GoogleMapMarker> venuesData = venues.map((dynamic item) => GoogleMapMarker.fromJson(item)).toList();
    List<Marker> _markers = [];
    for(GoogleMapMarker venue in venuesData) {

      _markers.add(Marker(
        markerId: MarkerId(venue.venueId),
        draggable: false,
        infoWindow: InfoWindow(
          title: venue.venueName,
          snippet: venue.venueAddress,

        ),
        onTap: () {

          // Tar dig till infosida (bör vara popup istället)
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  MarkerInfoWindow(markedDistance: "3km",
                    markedRating: venue.rating,
                    markedVenueId: venue.venueId,
                  markedVenueName: venue.venueName,),

            ),
          );

          print("--- my venue id is " + venue.venueId);
          print("--- my venue name is " + venue.venueName);
        },
        position: LatLng(venue.lat, venue.long),
      ));

    }
    setState(() {
      allMarkers = _markers;
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
      isVisible = !isVisible;
    });
  }

  _requestLocationPermission() async {
    final serviceStatusLocation = await Permission.locationWhenInUse.status;
    final serviceStatusLocationAlways = await Permission.locationAlways.status;

    // bool isLocation = serviceStatusLocation == ServiceStatus.enabled;

    final status = await Permission.locationWhenInUse.request();

    if (!serviceStatusLocationAlways.isGranted) {
      await Permission.locationAlways.request();
    }
    if (serviceStatusLocationAlways.isGranted) {
      _createMarkers();
    } else {
      // showToast("Camera needs to access your microphone, please provide permission", position: ToastPosition.bottom);
      // await openAppSettings();
    }
  }
}


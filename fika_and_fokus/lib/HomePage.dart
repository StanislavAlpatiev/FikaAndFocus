import 'package:fika_and_fokus/GoogleMap.dart';
import 'package:fika_and_fokus/SearchBar.dart';
import 'package:fika_and_fokus/UserModel.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {

  UserModel user = new UserModel(userName: "", email: "", password: "");
  MyHomePage(UserModel user, {Key? key}) : super(key: key){
    this.user = user;
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
                children: [
                  MyGoogleMap(),
                ]
            )
        )
    );
  }

  Future<Widget?> requestLocationPermission() async {
    final serviceStatusLocation = await Permission.locationWhenInUse.status;
    final serviceStatusLocationAlways = await Permission.locationAlways.status;

    bool isLocation = serviceStatusLocation == ServiceStatus.enabled;

    final status = await Permission.locationWhenInUse.request();

    if (!serviceStatusLocationAlways.isGranted) {
      await Permission.locationAlways.request();
    }
    if (serviceStatusLocationAlways.isGranted) {
      return const MyGoogleMap();
    } else {
      // showToast("Camera needs to access your microphone, please provide permission", position: ToastPosition.bottom);
      await openAppSettings();
    }
    return null;
  }
}


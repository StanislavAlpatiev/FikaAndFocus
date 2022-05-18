import 'package:fika_and_fokus/HomePageGoogle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SignUp.dart';
import 'LogIn.dart';
import 'GoogleMapMarkerInfoWindow.dart';
import 'package:firebase_core/firebase_core.dart';
import 'GoogleSignIn.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    // const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: "Fika&Focus",
    //   home: LogIn(),
    // ),
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  static final String title = 'Main Page';

  // ChangeNotifierProvider enables state management between screens
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        // theme: ThemeData.dark().copyWith(),
        home: HomePageGoogle(),
      )
  );
}
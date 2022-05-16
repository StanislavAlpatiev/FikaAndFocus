import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LogIn.dart';
import 'LoggedInWidgetTutorial.dart';

class HomePageTutorial extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasData) {
        // change in final version
        return LoggedInWidgetTutorial();
      } else if (snapshot.hasError) {
        return Center(child: Text('Something went wrong!'));
      } else {
        // return SignUpWidget();
        return LogIn();
      }
    },
    )
  );
}
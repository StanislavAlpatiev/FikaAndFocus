import 'package:fika_and_fokus/misc/HomePage.dart';
import 'package:fika_and_fokus/screens/Profile.dart';
import 'package:fika_and_fokus/screens/SignOut.dart';
import 'package:fika_and_fokus/screens/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/LogIn.dart';
import 'models/UserModel.dart';

class HomePageGoogle extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasData) {
        // change in final version
        return ProfilePage(new UserModel(userName: 'Username', email: 'SomeEmail@ok.com', password: 'idk'));
        // return LoggedInWidgetTutorial();
      } else if (snapshot.hasError) {
        return Center(child: Text('Something went wrong!'));
      } else {
        return LogIn();
      }
    },
    )
  );
}
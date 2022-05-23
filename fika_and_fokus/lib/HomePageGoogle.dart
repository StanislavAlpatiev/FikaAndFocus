import 'package:fika_and_fokus/HomePage.dart';
import 'package:fika_and_fokus/Profile.dart';
import 'package:fika_and_fokus/SignOut.dart';
import 'package:fika_and_fokus/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LogIn.dart';
import 'UserModel.dart';

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
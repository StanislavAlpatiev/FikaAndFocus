import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'google_sign_in.dart';

class LoggedInWidgetTutorial extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logged in'),
        centerTitle: true,
        actions: [
          TextButton(
            child: Text('Logout'),
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(
                  context, listen: false);
              provider.logout();
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 32),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(height: 8),
            Text(
              'Name: ' + user.displayName!,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              'Email: ' + user.email!,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        )
      ),
    );
  }
}
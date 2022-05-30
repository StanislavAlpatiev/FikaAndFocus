import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  // data from user
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future<bool> loginWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      log("Google user id: ");
      if (googleUser == null) return false;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final String googleEmail =  googleUser.email;
      // if (
      // do get query on this email isnt in database){
      // call signup endpoint using no password
      // call sign in endpoint using no password}
      // else call sign in endpoint;
      // }
      // i think this solution works because only google user will be able to create an account using no password
      // and using sign in using no password


      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      log("google user: "+ _user.toString());
      log("verkar ha funkat, slutet av: loginGoogle");

      if (googleUser == null){
        return false;
      }
      return true;

    } catch (e) {
      print("Error: " + e.toString());
    }

    return false;
    // updates UI
  }

  Future signOutWithGoogle() async {
    try {
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
    } catch (e) {print("Error: " + e.toString());}
  }
}
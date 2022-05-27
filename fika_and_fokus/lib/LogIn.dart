import 'dart:convert';

import 'package:fika_and_fokus/GoogleMap.dart';
import 'package:fika_and_fokus/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'GoogleSignIn.dart';
import 'signup.dart';
import 'UserModel.dart';
import 'dart:developer';

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : '';
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : '';
  }
}

//Test
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>(); //a globalkey for validation.

  UserModel user = UserModel.login("", ""); //For creating a user.
  UserModel getLoggedInUser() {
    return user;
  }

  // TextEditingController userCtrl =
  //     TextEditingController(); //A variable to store username
  // TextEditingController passCtrl =
  //     TextEditingController(); //A variable to store password

  String loginMessage = "hej";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFFE0DBCF),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
              child: ListView(
                shrinkWrap: true,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  // ignore: prefer_const_constructors
                  Image.asset('images/logo-white.png', width: 600, height: 200),
                  Center(
                    child: Text(
                      "ACCOUNT LOGIN",
                      style: GoogleFonts.oswald(
                          textStyle: const TextStyle(color: Color(0xFF75AB98)),
                          fontSize: 45.00,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Card(
                      // ignore: prefer_const_constructors
                      child: TextFormField(
                        cursorColor: Color(0xFF75AB98),
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                          border: InputBorder.none,
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: FaIcon(
                              FontAwesomeIcons.solidUser,
                              color: Color(0xFF696969),
                            ),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Color(0xFF696969),
                            fontSize: 20,
                          ),
                        ),
                        style: GoogleFonts.roboto(fontWeight: FontWeight.w300),
                        validator: (value) {
                          EmailFieldValidator.validate(value!);
                        },
                        controller: TextEditingController(text: user.getEmail),
                        onChanged: (val) {
                          user.email = val;
                        },
                      ),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Card(
                      child: TextFormField(
                        cursorColor: Color(0xFF75AB98),
                        obscureText: true,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                          border: InputBorder.none,
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: FaIcon(
                              FontAwesomeIcons.lock,
                              color: Color(0xFF696969),
                            ),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Color(0xFF696969),
                            fontSize: 20,
                          ),
                        ),
                        style: GoogleFonts.roboto(fontWeight: FontWeight.w300),
                        validator: (value) {
                          PasswordFieldValidator.validate(value!);
                        },
                        controller:
                            TextEditingController(text: user.getPassword),
                        onChanged: (val) {
                          user.password = val;
                        },
                      ),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // save();

                          login(user.getEmail, user.getPassword).then((value) {
                            setState(() {
                              loginMessage = value;

                              final snackBar =
                                  SnackBar(content: Text(loginMessage));

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          });

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const NavBar(),
                          //   ),
                          // );
                        },
                        child: Text(
                          'LOG IN',
                          style: GoogleFonts.oswald(
                              fontSize: 28, fontWeight: FontWeight.normal),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF696969),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: ElevatedButton.icon(
                      icon: Image.asset(
                        "images/google_logo.png",
                        width: 32,
                      ),
                      label: Text(
                        'Log in with Google',
                        style: GoogleFonts.roboto(
                            fontSize: 20.00, fontWeight: FontWeight.w300),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        final isloggedInWithGoogle = provider.loginWithGoogle();
                        log("kommer jag hit???");
                        //bool isLoggedInWithGoogle = false;
                        //provider.loginWithGoogle().then((value) {

                        //  isLoggedInWithGoogle = value;
                        //} );
                        //log("isLoggedInWithGoogle: "+ isLoggedInWithGoogle.toString());
                        //if (isLoggedInWithGoogle)

                        user.email = provider.user.email;
                        user.password = "google";
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar(user: user)));

                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgotten password/username?",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: Color(0xFF871801), letterSpacing: .5),
                          fontSize: 15.00,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          'SIGN UP',
                          style: GoogleFonts.oswald(
                              fontSize: 28.00, fontWeight: FontWeight.normal),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF75AB98),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> login(String email, String password) async {
    if (email.isEmpty) return "Email is empty";
    if (password.isEmpty) return "Password is empty";

    Uri url = Uri.parse(
        "https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/user/login?"
                "email=" +
            email +
            "&password=" +
            password);

    var response = await http.get(url);
    print(response.toString());

    if (response.statusCode == 200) {
      print("log in successfull");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavBar(user: user),
        ),
      );
    } else {
      print("login failed: wrong username or password");
      return "login failed: wrong username or password";
    }
    return "";
  }
}

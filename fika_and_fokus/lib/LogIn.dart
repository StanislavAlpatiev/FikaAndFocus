import 'dart:convert';

import 'package:fika_and_fokus/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'google_sign_in.dart';
import 'signup.dart';
import 'UserModel.dart';

//Test
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>(); //a globalkey for validation.
  UserModel user = UserModel.login("", ""); //For creating a user.
  // TextEditingController userCtrl =
  //     TextEditingController(); //A variable to store username
  // TextEditingController passCtrl =
  //     TextEditingController(); //A variable to store password

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: const AssetImage("images/bg_white.jpg"),
        //     fit: BoxFit.cover,
        //     colorFilter: ColorFilter.mode(
        //         Colors.brown.withOpacity(0.9), BlendMode.dstATop),
        //   ),
        // ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFFE0DBCF),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: ListView(
                shrinkWrap: true,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  // ignore: prefer_const_constructors
                  Image.asset('images/logo-white.png',width:600,height:200),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      "ACCOUNT LOGIN",
                      style: GoogleFonts.oswald(
                          textStyle: const TextStyle(color: Color(0xFF75AB98)),
                          fontSize: 45.00,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  // CircleAvatar(
                  //   radius: 77,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(80),
                  //     child: Image.network(
                  //       "https://img.freepik.com/free-vector/mysterious-mafia-man-wearing-hat_52683-34829.jpg?t=st=1648889842~exp=1648890442~hmac=6ff53459fbf62e0b08f8a44b8d1f71a84b693415923df79ea74a1c74e9d423a9&w=740",
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  Card(
                    // ignore: prefer_const_constructors
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                        border: InputBorder.none,
                        prefixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: FaIcon(
                            FontAwesomeIcons.solidUser,
                            color: Color(0xFF696969),
                          ),
                        ),
                        labelText: 'Username or email',
                        labelStyle: TextStyle(
                          color: Color(0xFF696969),
                          fontSize: 20,
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      style: GoogleFonts.roboto(fontWeight: FontWeight.w300),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is empty';
                        }
                        return '';
                      },
                      controller: TextEditingController(text: user.email),
                      onChanged: (val) {
                        user.email = val;
                      },
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
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
                        if (value == null || value.isEmpty) {
                          return 'Password is empty';
                        }
                        return '';
                      },
                      controller: TextEditingController(text: user.password),
                      onChanged: (val) {
                        user.password = val;
                      },
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                    child: ElevatedButton(
                      onPressed: () {
                        // save();
                        login(user.email, user.getPassword);
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
                            fontSize: 28,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF696969),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // side: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  const SizedBox(
                    //Margin between elements.
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgotten password/username?",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(color: Color(0xFF871801),
                              letterSpacing: .5),
                          fontSize: 15.00,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    icon: FaIcon(FontAwesomeIcons.google),
                    label: Text('Sign up with Google'),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context, listen: false);
                      provider.googleLogin();
                    },
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
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
                                fontSize: 20.00,
                                fontWeight: FontWeight.w500),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF75AB98),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Future login(String email, String password) async {
    Uri url = Uri.parse("http://192.168.0.14:8080/user/login?"
        "email=" + email +
        "&password=" + password
    );

    var response = await http.get(url);
    print(response.toString());

    if (response.statusCode == 200) {
      print("ok");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NavBar(),
        ),
      );
    } else {
      print("fail");
      return null;
    }
    // if (response.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //   // print(response.body);
    //   Map<String, dynamic> responseJson = json.decode(response.body);
    //   List status = responseJson['status'];
    //   setState(() {
    //
    //   });
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load album');
    // }
    // print(response.body);
  }
}

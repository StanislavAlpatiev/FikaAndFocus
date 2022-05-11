import 'dart:convert';

import 'package:fika_and_fokus/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'signup.dart';
import 'User.dart';

//Test
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>(); //a globalkey for validation.
  User user = User("", ""); //For creating a user.
  // TextEditingController userCtrl =
  //     TextEditingController(); //A variable to store username
  // TextEditingController passCtrl =
  //     TextEditingController(); //A variable to store password
  var url = Uri.parse("http://localhost:8080/login");
  Future save() async {
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
    print(response.body);
  }

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
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: ListView(
                shrinkWrap: true,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  // ignore: prefer_const_constructors
                  Image.asset('images/logo-black-2.png',width:600,height:200),
                  Padding(padding: const EdgeInsets.fromLTRB(20, 5, 20, 5)),
                  Center(
                    child: Text(
                      "ACCOUNT LOGIN",
                      style: GoogleFonts.roboto(
                          fontSize: 35.00,
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
                  Padding(padding: const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                  Card(
                    // ignore: prefer_const_constructors
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                        border: InputBorder.none,
                        prefixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: FaIcon(
                            FontAwesomeIcons.solidUser,
                            color: Colors.white,
                          ),
                        ),
                        labelText: 'Username or email',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      style: GoogleFonts.roboto(fontWeight: FontWeight.w300),
                          //   TextStyle(
                          // color: Color.fromARGB(255, 255, 255, 255),
                          // fontSize: 20,
                          // fontWeight: FontWeight.bold),
                      //To check the input value.
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
                    color: const Color.fromARGB(51, 183, 183, 185),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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
                            FontAwesomeIcons.key,
                            color: Colors.white,
                          ),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white,
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
                    color: Color.fromARGB(51, 183, 183, 185),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavBar(),
                          ),
                        );
                      },
                      child: Text(
                        'Log In',
                        style: GoogleFonts.roboto(
                          fontSize: 28,
                          fontWeight: FontWeight.normal
                          ),
                        //     TextStyle(
                        //   color: Color.fromARGB(255, 255, 255, 255),
                        //   fontSize: 28,
                        //   fontWeight: FontWeight.bold,
                        //   fontFamily: 'Pacifico',
                        // ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 105, 105, 105),
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
                    child: const Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: Color.fromARGB(200, 219, 219, 223),
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'No Account? ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
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
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Pacifico',
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(51, 161, 161, 165),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(
                                color: Colors.teal,
                              ),
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
}

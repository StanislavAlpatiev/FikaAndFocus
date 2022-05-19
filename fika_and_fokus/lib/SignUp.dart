import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'UserModel.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userCtrl = TextEditingController();
  TextEditingController mailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController confPassCtrl = TextEditingController();
  late UserModel userModel;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 20,
        fontWeight: FontWeight.normal);
    TextStyle labelStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 20,
    );

    return MaterialApp(
      home: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: const AssetImage("images/bg1.jpg"),
        //     fit: BoxFit.cover,
        //     colorFilter: ColorFilter.mode(
        //         Colors.brown.withOpacity(0.5), BlendMode.dstATop),
        //   ),
        // ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFF75AB98),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    // ignore: prefer_const_constructors
                    Center(

                        // child: const Text(
                        //   "Sign Up",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.white,
                        //     fontSize: 46,
                        //     backgroundColor: Color.fromARGB(51, 183, 183, 186),
                        //     fontFamily: 'Pacifico',
                        //   ),
                        // ),
                        ),
                    Image.asset('images/logo-white.png',
                        width: 600, height: 200),
                    const SizedBox(
                      height: 10,
                    ),
                    // IconButton(
                    //   icon: Icon(
                    //     Icons.photo,
                    //     color: Colors.white,
                    //   ),
                    //   onPressed: () {},
                    //   iconSize: 85,
                    // ),
                    Card(
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        child: TextFormField(
                          controller: userCtrl,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your username';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 0),
                            border: InputBorder.none,
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: FaIcon(
                                FontAwesomeIcons.solidUser,
                                color: Color(0xFF696969),
                              ),
                            ),
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              color: Color(0xFF696969),
                              fontSize: 20,
                            ),
                          ),
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.w300),
                        ),
                      ),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        child: TextFormField(
                          controller: mailCtrl,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 0),
                            border: InputBorder.none,
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: FaIcon(
                                FontAwesomeIcons.at,
                                color: Color(0xFF696969),
                              ),
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Color(0xFF696969),
                              fontSize: 20,
                            ),
                          ),
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.w300),
                        ),
                      ),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        child: TextFormField(
                          controller: passCtrl,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your username';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 0),
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
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.w300),
                        ),
                      ),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        child: TextFormField(
                          controller: confPassCtrl,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your username';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 0),
                            border: InputBorder.none,
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: FaIcon(
                                FontAwesomeIcons.lock,
                                color: Color(0xFF696969),
                              ),
                            ),
                            labelText: 'Confirm password',
                            labelStyle: TextStyle(
                              color: Color(0xFF696969),
                              fontSize: 20,
                            ),
                          ),
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.w300),
                        ),
                      ),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 4),
                      child: ElevatedButton(
                        onPressed: () async {
                          String username = userCtrl.text;
                          String email = mailCtrl.text;
                          String pass = passCtrl.text;
                          //String confirmPass = confPassCtrl.text;

                          registerUser(email, username, pass, context);
                          // UserModel user = await registerUser(
                          //     username, email, pass, confirmPass, context);
                          userCtrl.text = '';
                          mailCtrl.text = '';
                          passCtrl.text = '';
                          confPassCtrl.text = '';
                          // setState(() {
                          //   userModel = user;
                          // });
                        },
                        child: Text(
                          'SIGN UP',
                          style: GoogleFonts.oswald(
                              fontSize: 28, fontWeight: FontWeight.normal),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF871801),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: Color(0xFFFFFFFF), letterSpacing: .5),
                              fontSize: 15.00,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),

                        // ignore: prefer_const_constructors
                        InkWell(
                          child: Text(
                            " Log in here",
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  color: Color(0xFF871801),
                                ),
                                fontSize: 15.00,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<UserModel> registerUser(String email, String username, String password,
      BuildContext context) async {
    print("test");
    Uri url = Uri.parse("http://192.168.0.14:8080/user/add?"
            "email=" +
        email +
        "&username=" +
        username +
        "&password=" +
        password);
    print(url.toString());
    final response = await http.post(url);
    print("passed request");

    if (response.statusCode == 200) {
      print("200");
      UserModel user =
          UserModel(email: email, userName: username, password: password);
      print(user.toString());
      return user;
    } else {
      throw "Error: " + response.statusCode.toString();
    }
  }
}

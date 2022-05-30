
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../models/UserModel.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

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
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      home: Container(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFF75AB98),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/logo-white.png',
                          width: 600, height: 200),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: TextFormField(
                            cursorColor: Color(0xFF75AB98),
                            controller: userCtrl,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter your username';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 5),
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: TextFormField(
                            cursorColor: Color(0xFF75AB98),
                            controller: mailCtrl,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter your email';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 5),
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: TextFormField(
                            cursorColor: Color(0xFF75AB98),
                            controller: passCtrl,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter your password';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 5),
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: TextFormField(
                            cursorColor: Color(0xFF75AB98),
                            controller: confPassCtrl,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter password';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 5),
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
                            if (!_formKey.currentState!.validate()) return;

                            final snackBar = SnackBar(
                                content: Text("passwords don't seem to match"));

                            String username = userCtrl.text;
                            String email = mailCtrl.text;
                            String pass = passCtrl.text;
                            String confirmPass = confPassCtrl.text;

                            if (pass != confirmPass) {
                              rootScaffoldMessengerKey.currentState!
                                  .showSnackBar(snackBar);
                              return;
                            }

                            registerUser(
                                email, username, pass, confirmPass, context);

                            userCtrl.text = '';
                            mailCtrl.text = '';
                            passCtrl.text = '';
                            confPassCtrl.text = '';
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
                        children: <Widget>[
                          Text(
                            "Already have an account?",
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    letterSpacing: .5),
                                fontSize: 15.00,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          ),

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
      ),
    );
  }

  Future<UserModel> registerUser(String email, String username, String password,
      String confirmPass, BuildContext context) async {
    Uri url = Uri.parse(
        "https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/user/add?" +
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

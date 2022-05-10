import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'UserModel.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

// Future<UserModel> registerUser(String userName, String email, String pass,
//     String confirmPass, BuildContext context) async {
//   var url = "http://localhost:8080/add";
//   var response = await http.post(
//     Uri.parse(url),
//     headers: <String, String>{"Content-Type": "application/json"},
//     body: jsonEncode(
//       <String, String>{
//         "username": userName,
//         "email": email,
//         "pass": pass,
//         "confirmedPass": confirmPass
//       },
//     ),
//   );
//   String responseString = response.body;
//
//   if (response.statusCode == 200) {
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext dialogContext) {
//         return MyAlertDialog(title: 'Backend Response', content: response.body);
//       },
//     );
//   }
// }

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
        fontWeight: FontWeight.bold);
    TextStyle labelStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );

    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("images/bg1.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.brown.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    // ignore: prefer_const_constructors
                    Center(
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 46,
                          backgroundColor: Color.fromARGB(51, 183, 183, 186),
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.photo,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                      iconSize: 85,
                    ),
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
                          decoration: InputDecoration(
                            labelText: 'User Name',
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 32,
                            ),
                            labelStyle: labelStyle,
                          ),
                          style: textStyle,
                        ),
                      ),
                      color: Color.fromARGB(51, 198, 198, 215),
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
                          decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 32,
                            ),
                            labelStyle: labelStyle,
                          ),
                          style: textStyle,
                        ),
                      ),
                      color: const Color.fromARGB(51, 183, 183, 185),
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
                          decoration: InputDecoration(
                            labelText: 'Password',
                            icon: const Icon(
                              Icons.lock_sharp,
                              color: Colors.white,
                              size: 32,
                            ),
                            labelStyle: labelStyle,
                          ),
                          style: textStyle,
                        ),
                      ),
                      color: const Color.fromARGB(51, 183, 183, 185),
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
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            icon: Icon(
                              Icons.lock_sharp,
                              color: Colors.white,
                              size: 32,
                            ),
                            labelStyle: labelStyle,
                          ),
                          style: textStyle,
                        ),
                      ),
                      color: const Color.fromARGB(51, 183, 183, 185),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
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
                          String confirmPass = confPassCtrl.text;

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
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        InkWell(
                          child: const Text(
                            'Login here',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
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
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    required this.title,
    required this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: TextStyle(color: Colors.white),
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

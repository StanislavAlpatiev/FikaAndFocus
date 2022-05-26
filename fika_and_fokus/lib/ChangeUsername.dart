import 'package:fika_and_fokus/AccountSettings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangeUserName extends StatefulWidget {
  const ChangeUserName({Key? key}) : super(key: key);

  @override
  State<ChangeUserName> createState() => _ChangeUserNamePageState();
}

class _ChangeUserNamePageState extends State<ChangeUserName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0DBCF),
      appBar: AppBar(
        title: Text('Change username',
          style: GoogleFonts.roboto(fontWeight: FontWeight.normal),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF75AB98),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                '  Current username: ',
                //TODO - here we need unit test to check that the correct name is called!
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        color: Color(0xFF696969),
                        letterSpacing: 0.5),
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Center(
              child: Card(
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Color(0xFF75AB98),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0,
                        vertical: 5),
                    border: InputBorder.none,
                    prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: FaIcon(
                        FontAwesomeIcons.solidUser,
                        color: Color(0xFF696969),
                        size: 20,
                      ),
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Color(0xFF696969),
                      fontSize: 20,
                    ),
                  ),
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w300),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is empty';
                    }
                    return '';
                  },
                  controller: TextEditingController(),
                  //onChanged: (val) {
                  //user.password = val;
                  //},
                ),
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                '  New username: ',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      color: Color(0xFF696969),
                      letterSpacing: 0.5),
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Center(
              child: Card(
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Color(0xFF75AB98),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0,
                        vertical: 5),
                    border: InputBorder.none,
                    prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: FaIcon(
                        FontAwesomeIcons.solidUser,
                        color: Color(0xFF696969),
                        size: 20,
                      ),
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Color(0xFF696969),
                      fontSize: 20,
                    ),
                  ),
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w300),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is empty';
                    }
                    return '';
                  },
                  controller: TextEditingController(),
                  //onChanged: (val) {
                  //user.password = val;
                  //},
                ),
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                  child: Container(
                      child: TextButton(
                          onPressed: () => {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const AccountSettings(),
                            ))
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF696969),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text('SAVE',
                            style: GoogleFonts.oswald(
                                textStyle: TextStyle(color: Color(0xFFFFFFFF)),
                                fontSize: 18.00,
                                fontWeight: FontWeight.normal),
                          )
                      )
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}

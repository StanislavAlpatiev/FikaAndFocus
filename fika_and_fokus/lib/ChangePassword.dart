import 'package:fika_and_fokus/AccountSettings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0DBCF),
      appBar: AppBar(
        title: const Text('Change password'),
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF75AB98),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text('   '),
            const Text(
              '  FROM: ', //TODO - here we need unit test to check that the correct password is called!
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 25, fontFamily: 'Roboto', color: Color(0xFF75AB98)),
            ),
            Center(
              child: Card(
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                    border: InputBorder.none,
                    prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.lock,
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
            const Text('   '),
            const Text('   '),
            const Text(
              '  TO: ',
              style: TextStyle(
                  fontSize: 25, fontFamily: 'Roboto', color: Color(0xFF75AB98)),
            ),
            Center(
              child: Card(
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                    border: InputBorder.none,
                    prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.lock,
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
            const Text('   '),
            const Text('   '),
            Center(
                child: Card(
                    child: TextButton(
                        onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AccountSettings(),
                                  ))
                            },
                        child: const Text(
                          'SAVE',
                          style:
                              TextStyle(fontSize: 40, color: Color(0xFF75AB98)),
                        ))))
          ],
        ),
      ),
    );
  }
}

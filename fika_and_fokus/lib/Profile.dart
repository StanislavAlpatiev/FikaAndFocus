import 'package:fika_and_fokus/LogIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AccountSettings.dart';
import 'SignOut.dart';
import 'package:provider/provider.dart';
import 'GoogleSignIn.dart';
import 'UserModel.dart';

class ProfilePage extends StatefulWidget {

  late UserModel user = new UserModel(userName: "", email: "", password: "");
  ProfilePage(UserModel user, {Key? key}) : super(key: key){
    this.user = user;
  }

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0DBCF), //BACKGROUND COLOR
      appBar: AppBar(
        title: Text('Profile',
          style: GoogleFonts.roboto(fontWeight: FontWeight.normal),
        ),
        backgroundColor: const Color(0xFF75AB98),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                          'Settings'), //Account - account settings such as change name or phonenumber
                    ),
                    const PopupMenuDivider(),
                    PopupMenuItem<int>(
                        value: 1,
                        child: Row(
                          children: const [
                            Icon(Icons.logout, color: Colors.amber),
                            SizedBox(width: 8),
                            Text('Sign out'),
                          ],
                        )),
                  ])
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      // backgroundImage: NetworkImage(user.photoURL!.replaceAll("s96-c", "s192-c")),
                      backgroundImage: AssetImage('images/profile_coffee.jpg'),
                    ),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                       child: Text(
                        // 'WELCOME ' + user.displayName!,
                         'Hi ' + widget.user.getEmail + ' !',
                         style: GoogleFonts.oswald(
                           fontWeight: FontWeight.normal,
                           fontSize: 25,
                           color: const Color(0xFF696969),
                           letterSpacing: 2.5,
                           height: 2,
                        ),
                       ),
                     ),
                    const Text(
                      '___________________________________________________________',
                      style: TextStyle(color: Color(0xFF696969)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
              child: Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: FaIcon(
                              Icons.coffee,
                              color: Color(0xFF75AB98),
                              size: 35,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Visited cafés: ',
                              style: GoogleFonts.oswald(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                                color: const Color(0xFF696969),
                                letterSpacing: 2.5,
                                ),
                            )
                          ),
                          Text('10',
                            style: GoogleFonts.oswald(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xFF75AB98),
                              letterSpacing: 2.5,
                            ),
                          )
                        ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 50),
                              child: FaIcon(
                                Icons.rate_review,
                                color: Color(0xFF75AB98),
                                size: 35,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('Posted reviews: ',
                                  style: GoogleFonts.oswald(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xFF696969),
                                    letterSpacing: 2.5,
                                  ),
                                )
                            ),
                            Text('10',
                              style: GoogleFonts.oswald(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                                color: const Color(0xFF75AB98),
                                letterSpacing: 2.5,
                              ),
                            )
                          ]
                      ),
                    ),//Creates space
                    // Text.rich(
                    //   TextSpan(
                    //     children: [
                    //       TextSpan(text: '     '), //Creates space
                    //       WidgetSpan(
                    //         child: Icon(
                    //           Icons.rate_review,
                    //           color: Color(0xFF75AB98),
                    //           size: 35,
                    //         ),
                    //       ),
                    //       TextSpan(
                    //         text: '  Posted reviews: -NR- ',
                    //         style: TextStyle(
                    //           fontSize: 25,
                    //           fontFamily: 'Roboto',
                    //           fontWeight: FontWeight.w300,
                    //           color: Color(0xFF75AB98),
                    //           letterSpacing: 2.5,
                    //           height: 2,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AccountSettings()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SignOut()),
        );
        break;
    }
  }
}

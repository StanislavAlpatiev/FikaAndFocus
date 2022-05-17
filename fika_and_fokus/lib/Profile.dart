import 'package:flutter/material.dart';
import 'AccountSettings.dart';
import 'SignOut.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0DBCF), //BACKGROUND COLOR
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: const Color(0xFF75AB98),
        // automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                          'Account'), //Account - account settings such as change name or phonenumber
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
            const Text('                           '), //Creates space
            const Text('                           '), //Creates space
            Center(
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('images/profile_avatar.jpg'),
                  ),
                  Text(
                    //TODO get name of individual
                    'WELCOME -NAME- !',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF75AB98),
                      letterSpacing: 2.5,
                      height: 2,
                    ),
                  ),
                  Text(
                    '___________________________________________________________',
                    style: TextStyle(color: Color(0xFF75AB98)),
                  ),
                  Text('                     '),
                  Text('                     '),
                  Text('                     '),
                  Text('                     '),
                  Text('                     '),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '     '), //Creates space
                      WidgetSpan(
                        child: Icon(
                          Icons.local_cafe_rounded,
                          color: Color(0xFF75AB98),
                          size: 35,
                        ),
                      ),
                      TextSpan(
                        //TODO get name of individual
                        text: '   Visided cafés: -NR-',

                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF75AB98),
                          letterSpacing: 2.5,
                          height: 4,
                        ),
                      ),
                    ],
                  ),
                ),
                Text('   '), //Creates space
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '     '), //Creates space
                      WidgetSpan(
                        child: Icon(
                          Icons.rate_review,
                          color: Color(0xFF75AB98),
                          size: 35,
                        ),
                      ),
                      TextSpan(
                        //TODO get name of individual
                        text: '  Posted reviews: -NR- ',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF75AB98),
                          letterSpacing: 2.5,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

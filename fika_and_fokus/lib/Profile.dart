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
      backgroundColor: Colors.blue[100], //BACKGROUND COLOR
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/profile_avatar.jpg'),
              ),
              const Text(
                //TODO get name of individual
                '-NAME-',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 25,
                ),
              ),
              Text(
                //TODO get name of individual
                'Welcome -NAME- !',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SourceSansPro',
                  color: Colors.amber[800],
                  letterSpacing: 2.5,
                  height: 2,
                ),
              ),
              const Text(
                //TODO get name of individual
                'Visided cafés: -NUMBER-',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SourceSansPro',
                  color: Colors.black,
                  letterSpacing: 2.5,
                  height: 4,
                ),
              ),
              const Text(
                //TODO get name of individual
                'Posted reviews: -NUMBER- ',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SourceSansPro',
                  color: Colors.black,
                  letterSpacing: 2.5,
                  height: 2,
                ),
              ),
            ],
          ),
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

import 'package:fika_and_fokus/LogIn.dart';
import 'package:fika_and_fokus/Profile.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SignOut extends StatefulWidget {
  const SignOut({Key? key}) : super(key: key);

  @override
  State<SignOut> createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign out'),
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      body: SafeArea(
        child: Center(
          heightFactor: 20,
          widthFactor: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/profile_avatar.jpg'),
              ),
              const Card(
                child: Text(
                  'Are you sure?',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 45,
                  ),
                ),
              ),
              const Text(' '), //Creates space
              ElevatedButton(
                child: Column(children: const <Widget>[
                  Text('YES',
                      style:
                          TextStyle(fontFamily: 'SourceSansPro', fontSize: 40)),
                  Icon(Icons.thumb_up, color: Colors.amber, size: 40)
                ]),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LogIn(),
                  ),
                ),
              ),
              const Text(' '), //Space between buttons
              const Text(' '), //Space between buttons
              ElevatedButton(
                child: Column(children: const <Widget>[
                  Text('NO',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 40,
                      )),
                  Icon(
                    Icons.thumb_down,
                    color: Colors.amber,
                    size: 40,
                  )
                ]),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

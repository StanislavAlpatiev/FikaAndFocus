import 'package:flutter/material.dart';

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
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/bg2.jpg'),
              ),
              Text(
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
              Text(
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
              Text(
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

    // body: const Center(child: Text('Name: ', style: TextStyle(fontSize: 20))),
  }
}

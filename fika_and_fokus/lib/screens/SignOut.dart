import 'package:fika_and_fokus/GoogleSignIn.dart';
import 'package:fika_and_fokus/screens/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignOut extends StatefulWidget {
  const SignOut({Key? key}) : super(key: key);

  @override
  State<SignOut> createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOut> {
  final googleSignIn = new GoogleSignInProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0DBCF),
      appBar: AppBar(
        title: const Text('Sign out'),
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF75AB98),
      ),
      body: SafeArea(
        child: Center(
          heightFactor: 20,
          widthFactor: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/profile_picture.png'),
              ),
              const Text('  '), //Creates space
              const Card(
                child: Text(
                  '  Are you sure?  ',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF75AB98),
                  ),
                ),
              ),
              const Text(' '), //Creates space
              TextButton(
                child: Card(
                  child: Column(
                    children: const [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '     '), //Creates space
                            WidgetSpan(
                              child: Icon(
                                Icons.thumb_up,
                                color: Color(0xFF75AB98),
                                size: 35,
                              ),
                            ),
                            TextSpan(
                              //TODO get name of individual
                              text: '   YES ',

                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF75AB98),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {

                  final provider = Provider.of<GoogleSignInProvider>(
                      context,
                      listen: false);
                  provider.signOutWithGoogle();
                  //googleSignIn.signOutWithGoogle(); // doesn't seem to work
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LogIn()));
                }
              ),
              TextButton(
                  child: Card(
                    child: Column(
                      children: const [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: '     '), //Creates space
                              WidgetSpan(
                                child: Icon(
                                  Icons.thumb_down,
                                  color: Color(0xFF75AB98),
                                  size: 35,
                                ),
                              ),
                              TextSpan(
                                //TODO get name of individual
                                text: '   NO   ',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF75AB98),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // onPressed: () => null,
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogIn(),
                        ),
                      )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

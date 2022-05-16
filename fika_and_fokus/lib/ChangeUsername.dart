import 'package:flutter/material.dart';

class ChangeUserName extends StatefulWidget {
  const ChangeUserName({Key? key}) : super(key: key);

  @override
  State<ChangeUserName> createState() => _ChangeUserNamePageState();
}

class _ChangeUserNamePageState extends State<ChangeUserName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100], //BACKGROUND COLOR
      appBar: AppBar(
        title: const Text('Change username'),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    //TODO get name of individual
                    'From:',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 25,
                    ),
                  ),
                  Container(
                    child: TextField(),
                    color: Colors.white,
                  )
                ],
              ),
              Text(
                //TODO get name of individual
                'To:',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

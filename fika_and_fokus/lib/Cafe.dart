import 'package:flutter/material.dart';

class Cafe extends StatelessWidget {
  const Cafe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg5.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.brown.withOpacity(0.9), BlendMode.dstATop),
          ),
        ),
      ),
    );
  }
}
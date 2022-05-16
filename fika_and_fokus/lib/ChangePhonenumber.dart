import 'package:flutter/material.dart';

class ChangePhonenumber extends StatefulWidget {
  const ChangePhonenumber({Key? key}) : super(key: key);

  @override
  State<ChangePhonenumber> createState() => _ChangePhonenumberPageState();
}

class _ChangePhonenumberPageState extends State<ChangePhonenumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change phonenumber'),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
    );
  }
}
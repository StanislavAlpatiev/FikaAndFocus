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
      appBar: AppBar(
        title: const Text('Change user name'),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
    );
  }
}

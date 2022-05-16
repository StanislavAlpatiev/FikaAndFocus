import 'package:fika_and_fokus/Profile.dart';
import 'package:flutter/material.dart';

import 'ChangeUsername.dart';
import 'ChangePassword.dart';
import 'ChangePhonenumber.dart';
import 'package:settings_ui/settings_ui.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  State<AccountSettings> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: [
              SettingsTile(
                title: Text('Language'),
                //subtitle: 'English',
                leading: Icon(Icons.language),
              ),
              SettingsTile(
                  title: Text('Environment'), leading: Icon(Icons.cloud_queue)),
            ],
          ),
          SettingsSection(
            title: Text('Account'),
            tiles: [
              //TODO - redirections should happen when pressed!
              SettingsTile(
                  title: Text('Phone number'), leading: Icon(Icons.phone)),
              SettingsTile(title: Text('Email'), leading: Icon(Icons.email)),
              SettingsTile(title: Text('Password'), leading: Icon(Icons.lock))
            ],
          )
        ],
      ),
    );
  }
}


   /*     //Heading
        backgroundColor: Colors.blue[100], //BACKGROUND COLOR
        appBar: AppBar(
          title: const Text('Account'),
          // automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(children: [
          //FIRST BUTTON
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangeUserName(),
              ),
            ),
            child: Container(
                width: 250,
                height: 60,
                // alignment: Alignment.topRight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 7,
                          offset: Offset(2, 3))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: const [
                          Icon(Icons.person, color: Colors.blue, size: 40),
                          Text(
                            "  Change username",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),

          //SECOND BUTTON
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangePassword(),
              ),
            ),
            child: Container(
                width: 250,
                height: 60,
                alignment: Alignment.topRight,
                //color: Colors.white,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 7,
                          offset: Offset(2, 3))
                    ]),
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.lock, color: Colors.blue, size: 40),
                          Text(
                            "  Change password",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),

          //THIRD BUTTON
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangePhonenumber(),
              ),
            ),
            child: Container(
                width: 270,
                height: 60,
                // alignment: Alignment.topRight,
                //color: Colors.white,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 7,
                          offset: Offset(2, 3))
                    ]),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.phone, color: Colors.blue, size: 40),
                          Text(
                            "  Change phonenumber",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ])));
  }
}
*/

  
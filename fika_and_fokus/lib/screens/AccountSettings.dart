import 'package:fika_and_fokus/screens/ChangeEmail.dart';
import 'package:fika_and_fokus/screens/ChangeLanguage.dart';
import 'package:fika_and_fokus/screens/ChangePassword.dart';
import 'package:fika_and_fokus/screens/ChangePhonenumber.dart';
import 'package:fika_and_fokus/screens/ChangeUsername.dart';
import 'package:fika_and_fokus/screens/Profile.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  State<AccountSettings> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0DBCF),
      appBar: AppBar(
        title: Text('Settings',
          style: GoogleFonts.roboto(fontWeight: FontWeight.normal),
        ),
        backgroundColor: const Color(0xFF75AB98),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Color(0xFF75AB98),
                      letterSpacing: 0.5),
                fontWeight: FontWeight.w500),),
            tiles: [
              SettingsTile(
                  title: const Text('Language'),
                  //subtitle: 'English',
                  leading: const FaIcon(FontAwesomeIcons.globe,
                    color: Color(0xFF696969),
                    size: 20),
                  onPressed: (context) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangeLanguage(),
                            ))
                      }),
              /* SettingsTile(
                  title: const Text('Environment'),
                  leading: const Icon(Icons.cloud_queue),
                  onPressed: (context) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangeUserName(),
                            ))
                      }),
                      */
            ],
          ),
          SettingsSection(
            title: Text('Account',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Color(0xFF75AB98),
                      letterSpacing: 0.5),
                  fontWeight: FontWeight.w500),),
            tiles: [
              //TODO - redirections should happen when pressed!
              SettingsTile(
                  title: const Text('Username'),
                  leading: const FaIcon(FontAwesomeIcons.solidUser,
                    color: Color(0xFF696969),
                    size: 20,
                  ),
                  enabled: true,
                  onPressed: (context) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangeUserName(),
                            ))
                      }),
              SettingsTile(
                  title: const Text('Phone number'),
                  leading: const FaIcon(FontAwesomeIcons.phone,
                      color: Color(0xFF696969),
                      size: 20),
                  enabled: true,
                  onPressed: (context) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangePhonenumber(),
                            ))
                      }),
              SettingsTile(
                  title: const Text('Email'),
                  leading: const FaIcon(FontAwesomeIcons.solidEnvelope,
                      color: Color(0xFF696969),
                      size: 20),
                  onPressed: (context) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangeEmail(),
                            ))
                      }),
              SettingsTile(
                  title: Text('Password'),
                  leading: const FaIcon(FontAwesomeIcons.lock,
                      color: Color(0xFF696969),
                      size: 20),
                  onPressed: (context) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangePassword(),
                            ))
                      }),
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

  
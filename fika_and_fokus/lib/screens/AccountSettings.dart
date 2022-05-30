import 'package:fika_and_fokus/screens/ChangeEmail.dart';
import 'package:fika_and_fokus/screens/ChangeLanguage.dart';
import 'package:fika_and_fokus/screens/ChangePassword.dart';
import 'package:fika_and_fokus/screens/ChangePhonenumber.dart';
import 'package:fika_and_fokus/screens/ChangeUsername.dart';
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
        title: Text(
          'Settings',
          style: GoogleFonts.roboto(fontWeight: FontWeight.normal),
        ),
        backgroundColor: const Color(0xFF75AB98),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(
              'Common',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Color(0xFF75AB98), letterSpacing: 0.5),
                  fontWeight: FontWeight.w500),
            ),
            tiles: [
              SettingsTile(
                  title: const Text('Language'),
                  //subtitle: 'English',
                  leading: const FaIcon(FontAwesomeIcons.globe,
                      color: Color(0xFF696969), size: 20),
                  onPressed: (context) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangeLanguage(),
                            ))
                      }),
            ],
          ),
          SettingsSection(
            title: Text(
              'Account',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Color(0xFF75AB98), letterSpacing: 0.5),
                  fontWeight: FontWeight.w500),
            ),
            tiles: [
              SettingsTile(
                  title: const Text('Username'),
                  leading: const FaIcon(
                    FontAwesomeIcons.solidUser,
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
                      color: Color(0xFF696969), size: 20),
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
                      color: Color(0xFF696969), size: 20),
                  onPressed: (context) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangeEmail(),
                            ))
                      }),
              SettingsTile(
                  title: const Text('Password'),
                  leading: const FaIcon(FontAwesomeIcons.lock,
                      color: Color(0xFF696969), size: 20),
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

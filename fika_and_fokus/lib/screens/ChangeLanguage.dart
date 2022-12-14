import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0DBCF),
      appBar: AppBar(
        title: Text(
          'Change language',
          style: GoogleFonts.roboto(fontWeight: FontWeight.normal),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF75AB98),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const Text('   '),
            const Text('   '),
            DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  labelText: 'Language',
                  labelStyle:
                      const TextStyle(color: Colors.black87, fontSize: 21),
                  hintText: 'Please select the language here',
                  hintStyle: const TextStyle(
                      color: Color(0xFF75AB98),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFF75AB98)),
                    gapPadding: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFF75AB98)),
                    gapPadding: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFF75AB98)),
                    gapPadding: 16,
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    child: Text(
                      'English',
                      style: TextStyle(color: Colors.black87, fontSize: 20),
                    ),
                  ),
                ],
                onChanged: (context) => {}),
          ],
        ),
      ),
    );
  }
}

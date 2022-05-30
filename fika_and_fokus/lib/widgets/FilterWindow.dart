import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterWindow extends StatefulWidget {
  final Widget child;
  final Function callback;

  const FilterWindow({Key? key, required this.child, required this.callback})
      : super(key: key);

  @override
  State<FilterWindow> createState() => _FilterWindowState();
}

class _FilterWindowState extends State<FilterWindow> {
  double priceValue = 1;
  double minRating = 1;
  double maxRating = 5;
  double ratingSliderValue = 1;
  double distanceSliderValue = 8000;
  double busynessSliderValue = 20;
  double ratingRangeStart = 1;
  double ratingRangeEnd = 3;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainInteractivity: false,
      child: Container(
        width: 250,
        height: 450,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PRICE",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(letterSpacing: 3.0),
                        fontSize: 15.00,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SfSliderTheme(
                  data: SfSliderThemeData(
                    thumbColor: const Color(0xFF75AB98),
                    activeTrackColor: const Color(0xFF75AB98),
                    inactiveTrackColor: const Color(0x22696969),
                  ),
                  child: SfSlider(
                    value: priceValue,
                    min: 1,
                    max: 3,
                    stepSize: 1,
                    interval: 1,
                    showTicks: true,
                    showLabels: true,
                    labelFormatterCallback:
                        (dynamic actualValue, String formattedText) {
                      switch (actualValue) {
                        case 1:
                          return '\$';
                        case 2:
                          return '\$\$';
                        case 3:
                          return '\$\$\$';
                      }
                      return actualValue.toString();
                    },
                    onChanged: (dynamic newValue) {
                      setState(() {
                        priceValue = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "RATING",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(letterSpacing: 3.0),
                        fontSize: 15.00,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SfSliderTheme(
                  data: SfSliderThemeData(
                    thumbColor: const Color(0xFF75AB98),
                    activeTrackColor: const Color(0xFF75AB98),
                    inactiveTrackColor: const Color(0x22696969),
                  ),
                  child: SfSlider(
                    value: ratingRangeStart,
                    min: 1.0,
                    max: 5.0,
                    interval: 1,
                    stepSize: 0.5,
                    showTicks: true,
                    showLabels: true,
                    onChanged: (dynamic newValue) {
                      setState(() {
                        ratingRangeStart = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DISTANCE",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(letterSpacing: 3.0),
                        fontSize: 15.00,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: distanceSliderValue,
                  max: 10000,
                  divisions: 5,
                  activeColor: const Color(0xFF75AB98),
                  inactiveColor: const Color(0x22696969),
                  label: distanceSliderValue.round().toString() + ' m',
                  onChanged: (double value) {
                    setState(() {
                      distanceSliderValue = value;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BUSYNESS",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(letterSpacing: 3.0),
                        fontSize: 15.00,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Slider(
                  value: busynessSliderValue,
                  max: 100,
                  divisions: 10,
                  activeColor: const Color(0xFF75AB98),
                  inactiveColor: const Color(0x22696969),
                  label: busynessSliderValue.round().toString() + ' %',
                  onChanged: (double value) {
                    setState(() {
                      busynessSliderValue = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF75AB98),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      widget.callback(
                          busynessSliderValue, distanceSliderValue, priceValue.toInt(), ratingRangeStart, "search");
                    },
                    child: Text(
                      "OK",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                          textStyle: const TextStyle(letterSpacing: 3.0),
                          fontSize: 15.00,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF696969),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      widget.callback(
                          busynessSliderValue, distanceSliderValue, priceValue, ratingSliderValue, "cancel");
                    },
                    child: Text(
                      "CANCEL",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                          textStyle: const TextStyle(letterSpacing: 3.0),
                          fontSize: 15.00,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            ),
          ], //child: widget.child,
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
    ),
  );
}

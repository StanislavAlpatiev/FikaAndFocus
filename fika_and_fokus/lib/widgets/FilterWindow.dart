import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../screens/MyGoogleMap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FilterWindow extends StatefulWidget {
  final Widget child;
  final Function callback;

  FilterWindow({Key? key, required this.child, required this.callback})
      : super(key: key);

  @override
  State<FilterWindow> createState() => _FilterWindowState(callback: callback);
}

class _FilterWindowState extends State<FilterWindow> {
  _FilterWindowState({required this.callback});

  // Variables for min max filter
  // Additional variables for extra filter
  // final items1 = ["1", "2", "3", "4", "5"];
  // final items2 = ["1", "2", "3", "4", "5"];
  // final items3 = ["\$", "\$\$", "\$\$\$"];
  // final items4 = ["\$", "\$\$", "\$\$\$"];
  // String? menuValue1;
  // String? menuValue2;
  // String? menuValue3;
  // String? menuValue4;

  double priceValue = 0;
  double minRating = 1;
  double maxRating = 5;
  double ratingSliderValue = 1;
  double distanceSliderValue = 8000;
  double busynessSliderValue = 20;
  double ratingRangeStart = 1;
  double ratingRangeEnd = 3;

  final Function callback;

  Widget build(BuildContext context) {
    return Visibility(
      maintainInteractivity: false,
      child: Container(
        width: 250,
        height: 450,
        alignment: Alignment.topLeft,
        //color: Colors.white,
        decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(2, 3)
              )
            ]
        ),
        //huvudkolumn
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          // Extra min/max filter
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [Text("FILTER",
          //         textAlign: TextAlign.center,
          //         style: GoogleFonts.roboto(
          //           textStyle: const TextStyle(
          //             letterSpacing: 3.0),
          //           fontSize: 15.00,
          //           fontWeight: FontWeight.w300),
          //     )],
          //   ),
          // ), //titel
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          //   child: Row(
          //       //min-max samt dropdow
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Column(
          //           //mintitel + dropdown,
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          //               child: Text("min",
          //                   textAlign: TextAlign.center,
          //                   style: GoogleFonts.roboto(
          //                     textStyle: const TextStyle(
          //                       letterSpacing: 2.0),
          //                     fontSize: 15.00,
          //                     fontWeight: FontWeight.w300),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          //               child: DropdownButton<String>(
          //                 value: menuValue1,
          //                 items: items1.map(buildMenuItem).toList(),
          //                 onChanged: (value) => setState(() =>
          //                     this.menuValue1 = value), //onChanged: onChanged),
          //               ),
          //             ),
          //           ],
          //         ),
          //         Column(
          //           //maxtitel + dropdown
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          //               child: Text("max",
          //                   textAlign: TextAlign.center,
          //                   style: GoogleFonts.roboto(
          //                     textStyle: const TextStyle(
          //                       letterSpacing: 2.0),
          //                     fontSize: 15.00,
          //                     fontWeight: FontWeight.w300),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          //               child: DropdownButton<String>(
          //                 value: menuValue2,
          //                 items: items2.map(buildMenuItem).toList(),
          //                 onChanged: (value) => setState(() =>
          //                     this.menuValue2 = value), //onChanged: onChanged),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ]),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("PRICE",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      letterSpacing: 3.0),
                    fontSize: 15.00,
                    fontWeight: FontWeight.w300),
              )],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SfSliderTheme(
              data: SfSliderThemeData(
                thumbColor: Color(0xFF75AB98),
                activeTrackColor: Color(0xFF75AB98),
                inactiveTrackColor: Color(0x22696969),
              ),
              child: SfSlider(
                value: priceValue,
                min: 0,
                max: 2,
                stepSize: 1,
                interval: 1,
                showTicks: true,
                showLabels: true,
                labelFormatterCallback:
                    (dynamic actualValue, String formattedText) {
                  switch (actualValue) {
                    case 0:
                      return '\$';
                    case 1:
                      return '\$\$';
                    case 2:
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
            )
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("RATING",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          letterSpacing: 3.0),
                      fontSize: 15.00,
                      fontWeight: FontWeight.w300),
                )],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SfSliderTheme(
              data: SfSliderThemeData(
                thumbColor: Color(0xFF75AB98),
                activeTrackColor: Color(0xFF75AB98),
                inactiveTrackColor: Color(0x22696969),
              ),
              child: SfSlider(
                value: ratingRangeStart,
                min: 1.0,
                max: 5.0,
                interval: 1,
                showTicks: true,
                showLabels: true,
                onChanged: (dynamic newValue) {
                  setState(() {
                    ratingRangeStart = newValue;
                  });
                },
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("DISTANCE",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            letterSpacing: 3.0),
                        fontSize: 15.00,
                        fontWeight: FontWeight.w300),
              )],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Slider(
              value: distanceSliderValue,
              max: 10000,
              divisions: 5,
              activeColor: Color(0xFF75AB98),
              inactiveColor: Color(0x22696969),
              label: distanceSliderValue.round().toString() + ' m',
              onChanged: (double value) {
                setState(() {
                  distanceSliderValue = value;
                });
              },
            )
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("BUSYNESS",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          letterSpacing: 3.0),
                      fontSize: 15.00,
                      fontWeight: FontWeight.w300),
              )],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Slider(
              value: busynessSliderValue,
              max: 100,
              divisions: 10,
              activeColor: Color(0xFF75AB98),
              inactiveColor: Color(0x22696969),
              label: busynessSliderValue.round().toString() + ' %',
              onChanged: (double value) {
                setState(() {
                  busynessSliderValue = value;
                });
              },
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF75AB98),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      callback(
                          busynessSliderValue, distanceSliderValue, "search");
                      //TODO: search according to rating and price value
                    },
                    child: Text("OK",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                        textStyle: const TextStyle(letterSpacing: 3.0),
                        fontSize: 15.00,
                        fontWeight: FontWeight.w300),
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF696969),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      callback(
                          busynessSliderValue, distanceSliderValue, "cancel");
                    },
                    child: Text("CANCEL",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                        textStyle: const TextStyle(letterSpacing: 3.0),
                        fontSize: 15.00,
                        fontWeight: FontWeight.w300),
                    ),
                  ))
            ],
          )
        ] //child: widget.child,
            ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
        ),
      );
}

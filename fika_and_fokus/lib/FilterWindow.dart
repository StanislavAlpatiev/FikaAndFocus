import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GoogleMap.dart';
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

  final items1 = ["1235325", "264364", "3346346", "4532553", "564363"];
  final items2 = ["1235325", "264364", "3346346", "4532553", "564363"];
  final items3 = ["1235325", "264364", "3346346", "4532553", "564363"];
  final items4 = ["1235325", "264364", "3346346", "4532553", "564363"];
  String? menuValue1;
  String? menuValue2;
  String? menuValue3;
  String? menuValue4;

  double distanceSliderValue = 200;
  double businessSliderValue = 20;

  final Function callback;

  Widget build(BuildContext context) {
    // TODO: implement build
    return Visibility(
      maintainInteractivity: false,
      child: Container(
        width: 280,
        height: 450,
        alignment: Alignment.topLeft,
        //color: Colors.white,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("NÅGONTING")],
            ),
          ), //titel
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                //min-max samt dropdow
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    //mintitel + dropdown,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text("min"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: DropdownButton<String>(
                          value: menuValue1,
                          items: items1.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(() =>
                              this.menuValue1 = value), //onChanged: onChanged),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    //maxtitel + dropdown
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: Text("max"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: DropdownButton<String>(
                          value: menuValue2,
                          items: items2.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(() =>
                              this.menuValue2 = value), //onChanged: onChanged),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("PRICE")],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              //mintitel + dropdown,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text("min"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: DropdownButton<String>(
                    value: menuValue3,
                    items: items3.map(buildMenuItem).toList(),
                    onChanged: (menuValue3) => setState(() =>
                        this.menuValue3 = menuValue3), //onChanged: onChanged),
                  ),
                ),
              ],
            ),
            Column(
              //maxtitel + dropdown
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Text("max"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: DropdownButton<String>(
                    value: menuValue4,
                    items: items4.map(buildMenuItem).toList(),
                    onChanged: (menuValue4) => setState(() =>
                        this.menuValue4 = menuValue4), //onChanged: onChanged),
                  ),
                ),
              ],
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Distance")],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Slider(
              value: distanceSliderValue,
              max: 1000,
              divisions: 5,
              label: distanceSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  distanceSliderValue = value;
                });
              },
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Business")],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Slider(
              value: businessSliderValue,
              max: 100,
              divisions: 10,
              label: businessSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  businessSliderValue = value;
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
                    onPressed: () {
                      callback(
                          businessSliderValue, distanceSliderValue, "search");
                    },
                    child: Text("ok")),
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {
                      callback(
                          businessSliderValue, distanceSliderValue, "cancel");
                    },
                    child: Text("cancel"),
                  ))
            ],
          )
        ]
                //child: widget.child,
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

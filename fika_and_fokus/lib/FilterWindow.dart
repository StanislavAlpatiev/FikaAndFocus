import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GoogleMap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FilterWindow extends StatefulWidget {

  final Widget child;
 

  FilterWindow ({Key? key, required this.child}) :super(key: key);

  @override
  State<FilterWindow> createState() => _FilterWindowState();

}

class _FilterWindowState extends State<FilterWindow>  {

  final items1 = ["1235325", "264364", "3346346", "4532553", "564363"];
  final items2 = ["1235325", "264364", "3346346", "4532553", "564363"];
  final items3 = ["1235325", "264364", "3346346", "4532553", "564363"];
  final items4 = ["1235325", "264364", "3346346", "4532553", "564363"];
  String? menuValue1;
  String? menuValue2;
  String? menuValue3;
  String? menuValue4;

  double _currentSliderValue = 20;
  double _currentSliderValue2 = 20;

  bool isVisable = true;





  Widget build(BuildContext context) {
    // TODO: implement build
    return Visibility(

      visible: isVisable,
      maintainInteractivity: false,

      child: Container(
        width: 280,
        height: 450,
        alignment: Alignment.topLeft,
        //color: Colors.white,
        decoration: BoxDecoration(
          color:Colors.white,
          border: Border.all(
            color: Colors.black
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(2,3)
            )
          ]
        ),

        //huvudkolumn
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("NÅGONTING")
                  ],
                ),
              ), //titel
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row( //min-max samt dropdow
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Column( //mintitel + dropdown,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,0,10,0),
                          child: Text("min"),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,0,10,0),
                          child: DropdownButton<String>(
                            value: menuValue1,
                            items: items1.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() => this.menuValue1 = value),  //onChanged: onChanged),
                          ),
                        ),
                      ],
                    ),
                    Column( //maxtitel + dropdown
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,10,0),
                          child: Text("max"),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,10,0),
                          child: DropdownButton<String>(
                            value: menuValue2,
                            items: items2.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() => this.menuValue2 = value),  //onChanged: onChanged),
                          ),
                        ),
                      ],
                    ),
                ]
            ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("PRICE")
                ],
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Column( //mintitel + dropdown,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,10,0),
                        child: Text("min"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,10,0),
                        child: DropdownButton<String>(
                          value: menuValue3,
                          items: items3.map(buildMenuItem).toList(),
                          onChanged: (menuValue3) => setState(() => this.menuValue3 = menuValue3),  //onChanged: onChanged),
                        ),
                      ),
                    ],
                  ),
                  Column( //maxtitel + dropdown
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,10,0),
                        child: Text("max"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,10,0),
                        child: DropdownButton<String>(
                          value: menuValue4,
                          items: items4.map(buildMenuItem).toList(),
                          onChanged: (menuValue4) => setState(() => this.menuValue4 = menuValue4),  //onChanged: onChanged),
                        ),
                      ),
                    ],
                  ),
                ]

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Distance")
                ],
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Slider(
                    value: _currentSliderValue,
                    max: 100,
                    divisions: 5,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                    },
                  )
                ]
            ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Business")
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Slider(
                      value: _currentSliderValue2,
                      max: 100,
                      divisions: 10,
                      label: _currentSliderValue2.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue2 = value;
                        });
                      },
                    )
                  ]
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                        onPressed: _searchForCafes,
                        child: Text("ok")
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: _changeVisibility,
                      child: Text("cancel"),
                  )
                  )
                ],

              )

          ]
          //child: widget.child,
        ),

      ),
    );



    throw UnimplementedError();
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>

      DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
        ),
      );


  _searchForCafes(){
    //här är om man trycker på ok i filter, då ska cafeerna som stämmer med variablerna hämtas
    print('hejhej');
  }

  _changeVisibility() async {
    setState(() {
      isVisable = !isVisable;
    });
  }


}
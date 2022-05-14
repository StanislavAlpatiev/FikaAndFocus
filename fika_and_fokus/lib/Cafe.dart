import 'package:flutter/material.dart';

class Cafe extends StatelessWidget {
  // final String cafeName;

  const Cafe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("cafeName"),
        ),
        backgroundColor: const Color(0xFF75AB98),
        body: Stack(
            children: [
              Container(
                  // color: Colors.white,
                  child: Column(
                      children: [
                        Flexible(
                            flex: 4,
                            child: Container(
                              color: Colors.amberAccent,
                              child: Column(
                                children: [
                                  Text("cafeName"),
                                  Row(

                                  ),
                                ],
                              ),
                            )
                        ),
                        Flexible(
                            flex: 5,
                            // child: Container(
                            //   color: Colors.green,
                            //   child: Column(
                            //     children: [
                            //       Text("Review Section"),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ListView(
                                // itemBuilder: (context, index) => Card(
                                  // elevation: 30,
                              children: [
                                // Container(
                                  // margin: EdgeInsets.all(5),
                                Container(
                                  // width: 400,
                                  margin: EdgeInsets.all(10),
                                  // color: Colors.amberAccent,
                                  height: 150,
                                  decoration: _getBoxStile(),
                                ),
                                Container(
                                  // width: 400,
                                  margin: EdgeInsets.all(10),
                                  height: 150,
                                  decoration: _getBoxStile(),
                                ),
                                Container(
                                  // width: 400,
                                  margin: EdgeInsets.all(10),
                                  height: 150,
                                  decoration: _getBoxStile(),
                                ),
                                Container(
                                  // width: 400,
                                  margin: EdgeInsets.all(10),
                                  height: 150,
                                  decoration: _getBoxStile(),
                                ),
                                Container(
                                  // width: 400,
                                  margin: EdgeInsets.all(10),
                                  height: 150,
                                  decoration: _getBoxStile(),
                                ),
                                Container(
                                  // width: 400,
                                  margin: EdgeInsets.all(10),
                                  height: 150,
                                  decoration: _getBoxStile(),
                                ),
                              ],
                            ),
                          )// ),
                        ),
                      ]
                  )
              )
            ]
        )
    );
  }

  BoxDecoration _getBoxStile() {
    return BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(2, 3))
        ]
    );
  }
}
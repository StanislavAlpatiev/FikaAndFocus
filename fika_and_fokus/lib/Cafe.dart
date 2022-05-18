import 'package:fika_and_fokus/Bookmarks.dart';
import 'package:flutter/material.dart';
import 'CafeItemModel.dart';

class Cafe extends StatelessWidget {
  // final String cafeName;
  final CafeItem cafeItem;

  //const Cafe({Key? key}) : super(key: key);
  Cafe(this.cafeItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0DBCF),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            cafeItem.name,
            style: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: const Color(0xFF75AB98),
        automaticallyImplyLeading: false,
      ),
      // backgroundColor: const Color(0xFF75AB98),
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                  flex: 4,
                  child: Container(
                    // color: Colors.amberAccent,
                    child: Column(
                      children: [
                        Text(cafeItem.name),
                        Row(),
                      ],
                    ),
                  )),
              Flexible(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.green,
                      // .all(Radius.circular(20))
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            // width: 400,
                            margin: EdgeInsets.all(5),
                            // color: Colors.amberAccent,
                            height: 150,
                            decoration: _getBoxStile(),
                            child: Center(
                              child: Text(index.toString()),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
        ]);
  }
}

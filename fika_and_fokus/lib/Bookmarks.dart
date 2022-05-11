//Find icon

import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'Search.dart';
import 'Popular.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Bookmarks'),
  //     ),
  //     body: const Center(child: Text('Bookmark Page', style: TextStyle(fontSize: 60))),
  //   );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("images/bg3.jpg"),
        //     fit: BoxFit.cover,
        //     colorFilter: ColorFilter.mode(
        //         Colors.brown.withOpacity(0.9), BlendMode.dstATop),
        //   ),
        // ),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              // title: const Text('Bookmarks'),
              backgroundColor: Colors.white,
              title: const SearchBar(),
              //   decoration: InputDecoration(
              //     filled: true,
              //     fillColor:
              //     Color.fromARGB(255, 67, 71, 68).withOpacity(0.7),
              //     contentPadding: const EdgeInsets.only(
              //         left: 14.0, bottom: 8.0, top: 8.0),
              //     hintText: 'Search',
              //     hintStyle: TextStyle(
              //       color: Colors.white,
              //     ),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(50),
              //       borderSide: BorderSide(color: Colors.white, width: 1),
              //     ),
              //     prefixIcon: Icon(
              //       Icons.search,
              //       color: Colors.white,
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(25.7),
              //     ),
              //   ),
              //   style: TextStyle(
              //       color: Color.fromARGB(255, 255, 255, 255),
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold),
              // ),
            ),
            backgroundColor: Colors.transparent,
            body: //Padding(
                // padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 12),
                //child:
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // InkWell(
                //   child: Icon(
                //     Icons.arrow_circle_left_outlined,
                //     color: Colors.white,
                //     size: 29,
                //   ),
                //   onTap: () => Navigator.pop(context),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   '?Previously visited?',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 24,
                //   ),
                //   textAlign: TextAlign.left,
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // TextField(
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor:
                //     Color.fromARGB(255, 67, 71, 68).withOpacity(0.7),
                //     contentPadding: const EdgeInsets.only(
                //         left: 14.0, bottom: 8.0, top: 8.0),
                //     hintText: 'Search',
                //     hintStyle: TextStyle(
                //       color: Colors.white,
                //     ),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(50),
                //       borderSide: BorderSide(color: Colors.white, width: 1),
                //     ),
                //     prefixIcon: Icon(
                //       Icons.search,
                //       color: Colors.white,
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.white),
                //       borderRadius: BorderRadius.circular(25.7),
                //     ),
                //   ),
                //   style: TextStyle(
                //       color: Color.fromARGB(255, 255, 255, 255),
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold),
                // ), //Need to change the card, works only with textfield
                // const SizedBox(
                //   height: 14,
                // ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: <Widget>[
                      InkWell(
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                child: Image.asset(
                                  "images/cafe1.jpg",
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                ),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(
                                  'Popular',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 10),
                                child: Text(
                                  '(43)',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(1),
                              width: 2,
                            ),
                          ),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PopularCafes(),
                          ),
                        ),
                      ),
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              child: Image.asset(
                                "images/cafe2.jpg",
                                fit: BoxFit.cover,
                                height: 120,
                                width: double.infinity,
                                alignment: Alignment.center,
                              ),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'Uncrowded',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 10),
                              child: Text(
                                '(15)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        color: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.grey.withOpacity(1),
                            width: 2,
                          ),
                        ),
                      ),
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              child: Image.asset(
                                "images/cafe3.jpg",
                                fit: BoxFit.cover,
                                height: 120,
                                width: double.infinity,
                                alignment: Alignment.center,
                              ),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'Best Cofee',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 10),
                              child: Text(
                                '(12)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        color: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.grey.withOpacity(1),
                            width: 2,
                          ),
                        ),
                      ),
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              child: Image.asset(
                                "images/cafe1.jpg",
                                fit: BoxFit.cover,
                                height: 120,
                                width: double.infinity,
                                alignment: Alignment.center,
                              ),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'Elegant and calm',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 10),
                              child: Text(
                                '(43)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        color: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.grey.withOpacity(1),
                            width: 2,
                          ),
                        ),
                      ),
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              child: Image.asset(
                                "images/cafe1.jpg",
                                fit: BoxFit.cover,
                                height: 120,
                                width: double.infinity,
                                alignment: Alignment.center,
                              ),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'Popular',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 10),
                              child: Text(
                                '(43)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        color: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.grey.withOpacity(1),
                            width: 2,
                          ),
                        ),
                      ),
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              child: Image.asset(
                                "images/cafe1.jpg",
                                fit: BoxFit.cover,
                                height: 120,
                                width: double.infinity,
                                alignment: Alignment.center,
                              ),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'Popular',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 10),
                              child: Text(
                                '(43)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        color: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.grey.withOpacity(1),
                            width: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 12,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       IconButton(
                //         icon: Icon(
                //           Icons.person,
                //           color: Colors.white,
                //         ),
                //         iconSize: 32,
                //         onPressed: () => print('pressed'),
                //         highlightColor: Colors.green, //bara för test.
                //       ),
                //       IconButton(
                //         icon: Icon(
                //           Icons.location_on,
                //           color: Colors.white,
                //         ),
                //         iconSize: 32,
                //         onPressed: () => print('pressed'),
                //         highlightColor: Colors.green, //bara för test.
                //       ),
                //       IconButton(
                //         icon: Icon(
                //           Icons.settings,
                //           color: Colors.white,
                //         ),
                //         iconSize: 32,
                //         onPressed: () => print('pressed'),
                //         highlightColor: Colors.green, //bara för test.
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
    // );
  }
}
// import 'Popular.dart';

// class SecondRoute extends StatelessWidget {
//   const SecondRoute({Key? key}) : super(key: key);
//
//
// }

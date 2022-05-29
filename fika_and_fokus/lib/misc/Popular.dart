import 'package:flutter/material.dart';
import 'Cafe.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 32, 30, 30),
          image: DecorationImage(
            image: AssetImage("images/bg6.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    child: Icon(
                      Icons.arrow_circle_left_outlined,
                      color: Colors.white,
                      size: 29,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(
                    //Margin between elements.
                    height: 10,
                  ),
                  const Text(
                    'Popular',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    //Margin between elements.
                    height: 12,
                  ),
                  Center(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                        Color.fromARGB(255, 67, 71, 68).withOpacity(0.7),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    //Margin between elements.
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.check),
                          label: Text("Comfy charis and sofas (14)"),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                //side: BorderSide(color: )
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 70, 71, 70).withOpacity(0.7),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.abc),
                          label: Text("Longer study sessions (1)"),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                //side: BorderSide(color: )
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 70, 71, 70).withOpacity(0.7),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.abc),
                          label: Text("Longer study sessions (1)"),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                //side: BorderSide(color: )
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 70, 71, 70).withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(null),
                          label: Text("Coffee promo(8)"),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                //side: BorderSide(color: )
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 70, 71, 70).withOpacity(0.7),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(null),
                          label: Text("Background Music (1)"),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                //side: BorderSide(color: )
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 70, 71, 70).withOpacity(0.7),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(null),
                          label: Text("Outdoor Session (2)"),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                //side: BorderSide(color: )
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 70, 71, 70).withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image: NetworkImage(
                                    'https://images.unsplash.com/photo-1600093463592-8e36ae95ef56?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                                  ),
                                  width: 200,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Cykelcafe Le Mond',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '5.0\$',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 22.0,
                                        color: Colors.yellow[900],
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 22.0,
                                        color: Colors.yellow[900],
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 22.0,
                                        color: Colors.yellow[900],
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 22.0,
                                        color: Colors.yellow[900],
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 22.0,
                                        color: Colors.yellow[100],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: InkWell(
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => const Cafe(),
                                      //   ),
                                      // ),
                                      child: Icon(
                                        Icons.arrow_circle_right_rounded,
                                        size: 60.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    alignment: Alignment.bottomRight,
                                    width: 175,
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2017/04/19/13/03/coffee-2242213_960_720.jpg',
                                  ),
                                  width: 200,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Cykelcafe Le Mond',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '5.0\$',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 22.0,
                                        color: Colors.yellow[900],
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 22.0,
                                        color: Colors.yellow[900],
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 22.0,
                                        color: Colors.yellow[900],
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 22.0,
                                        color: Colors.yellow[100],
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 22.0,
                                        color: Colors.yellow[100],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: InkWell(
                                      onTap: () => print("hej"),
                                      child: Icon(
                                        Icons.arrow_circle_right_rounded,
                                        size: 60.0,
                                        semanticLabel: 'hejlabel',
                                        color: Colors.white,
                                      ),
                                    ),
                                    alignment: Alignment.bottomRight,
                                    width: 175,
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2017/04/19/13/03/coffee-2242213_960_720.jpg',
                                  ),
                                  width: 200,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Cykelcafe Le Mond',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '5\$',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: InkWell(
                                      onTap: () => print("hej"),
                                      child: Icon(
                                        Icons.arrow_circle_right_rounded,
                                        size: 60.0,
                                        semanticLabel: 'hejlabel',
                                        color: Colors.white,
                                      ),
                                    ),
                                    alignment: Alignment.bottomRight,
                                    width: 175,
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2017/04/19/13/03/coffee-2242213_960_720.jpg',
                                  ),
                                  width: 200,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Cykelcafe Le Mond',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '5\$',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: InkWell(
                                      onTap: () => print("hej"),
                                      child: Icon(
                                        Icons.arrow_circle_right_rounded,
                                        size: 60.0,
                                        semanticLabel: 'hejlabel',
                                        color: Colors.white,
                                      ),
                                    ),
                                    alignment: Alignment.bottomRight,
                                    width: 175,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
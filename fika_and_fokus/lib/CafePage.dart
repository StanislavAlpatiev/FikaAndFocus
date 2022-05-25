import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'CafeItemModel.dart';
import 'GoogleMapMarkerInfoWindow.dart';
import 'ReviewPage.dart';
import 'UserModel.dart';

class CafePage extends StatefulWidget {
  final CafeItem cafeItem;
  UserModel user = new UserModel(userName: "default", email: "", password: "");

  CafePage(this.cafeItem, this.user, {Key? key}) : super(key: key);

  @override
  State<CafePage> createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  var reviews = [];

  @override
  void initState() {
    refreshReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFE0DBCF),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.cafeItem.name,
          style: const TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: const Color(0xFF75AB98),
        automaticallyImplyLeading: true,
      ),
      body: CustomScrollView(
        slivers: [
        SliverAppBar(
          expandedHeight: 300,
          backgroundColor: Colors.deepPurple,
          // leading: Icon(Icons.arrow_back),
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('F A N C Y A P P B A R'),
            background: Container(color: Colors.deepPurple[700]),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Text(widget.cafeItem.name),
              Row(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReviewPage(widget.cafeItem, widget.user)));
                  },
                  child: Text(
                    'POST A REVIEW',
                    style: GoogleFonts.oswald(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF696969),
                  ),
                ),
              ]),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              //itemCount: reviews.length, //attribute from Listview
              (BuildContext context, int index) => Container(
                    decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(20),
                      //     topRight: Radius.circular(20)),
                      color: Color(0xFF75AB98),
                      // .all(Radius.circular(20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: RefreshIndicator(
                        onRefresh: refreshReviews,
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          //height: 100,
                          decoration: _getBoxStyle(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              ListTile(
                                //style: GoogleFonts.roboto(fontWeight: FontWeight.w300),
                                leading: const CircleAvatar(
                                  radius: 10,
                                  // backgroundImage: NetworkImage(user.photoURL!.replaceAll("s96-c", "s192-c")),
                                  backgroundImage: AssetImage(
                                      'images/profile_picture.png'),
                                ),
                                title: reviews[index].buildUser(context),
                                trailing: reviews[index].buildDate(context),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: RatingBarIndicator(
                                  rating: reviews[index].buildRating(context),
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemSize: 10.0,
                                  itemPadding:
                                      const EdgeInsets.fromLTRB(0, 0, 4, 5),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                child: reviews[index].buildReview(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              childCount: reviews.length),
        ),
      ]),
    );
  }

  Future refreshReviews() async {
    // Uri reviewsURI = Uri.parse('https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/ven_304c56776d34454959414e52593058646156516e6158614a496843/all');
    Uri reviewsURI = Uri.parse(
        'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${widget.cafeItem.id}/all');

    final response = await http.get(reviewsURI);

    if (response.statusCode == 200) {
      String source = const Utf8Decoder().convert(response.bodyBytes);
      var data = json.decode(source);

      reviews = [];
      var _reviewsTemp = [];
      for (var i = 0; i < data.length; i++) {
        _reviewsTemp.add(Review.fromJson(data[i]));
      }
      setState(() {
        reviews = _reviewsTemp;
      });
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  BoxDecoration _getBoxStyle() {
    return BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(2, 3))
        ]);
  }
}

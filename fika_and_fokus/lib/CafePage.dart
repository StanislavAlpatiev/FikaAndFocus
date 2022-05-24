import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'CafeItemModel.dart';
import 'UserModel.dart';

class Review {
  final Object user;
  final String review;
  final String date;
  final double rating;

  Review(this.user, this.review, this.date, this.rating);

  Widget buildUser(BuildContext context) {
    return Text(user.toString());
  }

  Widget buildReview(BuildContext context) {
    return Text(review);
  }

  Widget buildDate(BuildContext context) {
    return Text(date);
  }

  double buildRating(BuildContext context) {
    return rating;
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    double tempRating;

    if (json['rating'] == 1) {
      tempRating = 1.0;
    } else if (json['rating'] == 2) {
      tempRating = 2.0;
    } else if (json['rating'] == 3) {
      tempRating = 3.0;
    } else if (json['rating'] == 4) {
      tempRating = 4.0;
    } else {
      tempRating = 5.0;
    }

    return Review(json['user'].values.elementAt(1), json['review_string'], json['date'], tempRating);
  }
}

class CafePage extends StatefulWidget {
  final CafeItem cafeItem;
  UserModel user;
  CafePage(this.cafeItem, this.user);

  @override
  State<CafePage> createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  var reviews = [];
  final TextEditingController _controller = TextEditingController();
  Future<Review>? _futureReview;

  @override
  void initState() {
    refreshReviews();
    super.initState();
  }



  Future refreshReviews() async {
    // Uri reviewsURI = Uri.parse('https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/ven_304c56776d34454959414e52593058646156516e6158614a496843/all');
    Uri reviewsURI = Uri.parse(        'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${widget.cafeItem.id}/all');

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

  void addReviewToCafe() async {
    /**
     * lägg till review till cafe
     * på formen:
     * "/{reviewId}/cafes/{cafeId}"
     */

    Uri reviewsToCafeUrl = Uri.parse(
        'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/reviews/${widget.cafeItem.id}/all');

    final response = await http.put(reviewsToCafeUrl);
  }

  Future<Review> createReview(String review) async {
    //Uri new_review = Uri.parse(
    //    'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/reviews/add?rating=5&reviewText="jättefint"&cafeId=${widget.cafeItem.id}');

    //  OBS: MÅSTE ÄNDRA SÅ ATT DET ÄR "...group-1-75.." - URL:en

    /*
    Required parameters:
      @RequestParam Integer rating,
      @RequestParam String reviewText,
      @RequestParam String cafeId,
      @RequestParam String userEmail
     */

    Uri new_review = Uri.parse(
        'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/reviews/add?rating=5&reviewText=$review&cafeId=${widget.cafeItem.id}&userEmail=${widget.user.getEmail}');

    final response = await http.post(new_review);

    //final response = await http.post(
    //Uri.parse('https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${widget.cafeItem.id}/all'),

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Review.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(
          'Failed to create review.  ' + response.statusCode.toString());
    }
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Review'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureReview = createReview(_controller.text);
            });
          },
          child: const Text('Post Review'),
        ),
      ],
    );
  }

  FutureBuilder<Review> buildFutureBuilder() {
    return FutureBuilder<Review>(
      future: _futureReview,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.review);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
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
      body: Stack(children: [
        Column(children: [
          Flexible(
              flex: 4,
              child: Column(
                children: [
                  Text(widget.cafeItem.name),
                  Row(),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    child: (_futureReview == null)
                        ? buildColumn()
                        : buildFutureBuilder(),
                  ),
                ],
              )),
          Flexible(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color(0xFF75AB98),
                  // .all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: RefreshIndicator(
                    onRefresh: refreshReviews,
                    child: ListView.builder(
                      itemCount: reviews.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
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
                                  backgroundImage:
                                  AssetImage('images/profile_picture.png'),
                                ),
                                title: reviews[index].buildUser(context),
                                trailing: reviews[index].buildDate(context),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                child: reviews[index].buildReview(context),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ]),
    );
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

import 'package:fika_and_fokus/Bookmarks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'CafeItemModel.dart';

class Review {
  final String review;

  Review(this.review);

  Widget buildReview(BuildContext context) {
    return Text(review);
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(json['review_string']);
  }
}

class CafePage extends StatefulWidget {
  final CafeItem cafeItem;

  const CafePage(this.cafeItem);

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
    Uri reviewsURI = Uri.parse(
        'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/cafes/${widget.cafeItem.id}/all');

    final response = await http.get(reviewsURI);

    if (response.statusCode == 200) {
      String source = Utf8Decoder().convert(response.bodyBytes);
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
    Uri new_review = Uri.parse('https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/reviews/add?rating=5&reviewText=${review}&cafeId=${widget.cafeItem.id}');

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
      throw Exception('Failed to create review.  ' + response.statusCode.toString());
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
          style: TextStyle(
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
              child: Container(
                // color: Colors.amberAccent,
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
                ),
              )
          ),
          Flexible(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color(0xFF75AB98),
                  // .all(Radius.circular(20))
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Expanded(
                    child: RefreshIndicator(
                      onRefresh: refreshReviews,
                      child: ListView.builder(
                        itemCount: reviews.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            // width: 400,
                            margin: EdgeInsets.all(5),
                            // color: Colors.amberAccent,
                            height: 150,
                            decoration: _getBoxStile(),
                            child: Center(
                              child: reviews[index].buildReview(context),
                            ),
                          );
                        },
                      ),
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

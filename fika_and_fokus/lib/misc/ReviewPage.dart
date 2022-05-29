import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/CafeIModel.dart';
import '../models/UserModel.dart';
import '../models/ReviewModel.dart';

class ReviewPage extends StatefulWidget {
  final CafeModel cafeItem;
  UserModel user = new UserModel(userName: "default", email: "", password: "");

  ReviewPage(this.cafeItem, this.user, {Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final TextEditingController _controller = TextEditingController();
  Future<ReviewModel>? _futureReview;
  final _formKey = GlobalKey<FormState>();
  double rating = 0;
  bool hideNameChecked = false;

  @override
  void initState() {
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
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureReview == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(children: const [
                    // mainAxisAlignment: MainAxisAlignment.center,
                    Padding(
                        padding: EdgeInsets.fromLTRB(1, 0, 0, 10),
                        child: Text(
                          'POST A REVIEW',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF75AB98) // Color(0xFF696969)
                          ),
                        )),
                  ]),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 0, 2),
                      child: Text(
                        widget.user.getEmail,
                        style: GoogleFonts.roboto(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ]),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 0, 5),
                            child: RatingBar(
                                initialRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                minRating: 1,
                                itemCount: 5,
                                itemSize: 25.0,
                                itemPadding:
                                const EdgeInsets.fromLTRB(0, 0, 4, 5),
                                ratingWidget: RatingWidget(
                                    full: const Icon(Icons.star,
                                        color: Colors.amber),
                                    half: const Icon(Icons.star,
                                        color: Colors.amber),
                                    empty: Icon(
                                      Icons.star,
                                      color: Colors.grey.shade400,
                                    )),
                                onRatingUpdate: (value) {
                                  setState(() {
                                    rating = value;
                                  });
                                }),
                          ),
                        ]),
                        TextFormField(
                          controller: _controller,
                          maxLength: 150,
                          maxLines: 3,
                          style:
                          GoogleFonts.roboto(fontWeight: FontWeight.w300),
                          cursorColor: const Color(0xFF75AB98),
                          decoration: const InputDecoration(
                            hintText: 'Share your experiences and help others',
                            hintStyle: TextStyle(color: Color(0xFF696969)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF75AB98), width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Hide my name"),
                              Checkbox(value: hideNameChecked, onChanged: (bool? newValue) {
                                print(newValue);
                                setState(() {
                                  hideNameChecked = newValue!;
                                });
                              } ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate() &&
                                      rating != 0) {
                                    setState(() {
                                      _futureReview = createReview(
                                          rating, _controller.text, hideNameChecked);
                                    });
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   const SnackBar(content: Text('Thank you!')),
                                    // );
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  'SUBMIT',
                                  style: GoogleFonts.oswald(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFF696969),
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  FutureBuilder<ReviewModel> buildFutureBuilder() {
    return FutureBuilder<ReviewModel>(
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

  Future<ReviewModel> createReview(double rating, String review, bool hideName) async {

    /*
    Required parameters:
      @RequestParam String rating,
      @RequestParam String reviewText,
      @RequestParam String cafeId,
      @RequestParam String userEmail
     */
    String emailToPost = "anonymous";
    if (!hideName)
      emailToPost = widget.user.getEmail;

    Uri newReview = Uri.parse(
        'https://group-1-75.pvt.dsv.su.se/fikafocus-0.0.1-SNAPSHOT/reviews/add?'
            'rating=${rating.toString()}'
            '&reviewText=$review'
            '&cafeId=${widget.cafeItem.id}'
            '&userEmail=${emailToPost}');

    final response = await http.post(newReview);

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return ReviewModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(
          'Failed to create review.  ' + response.statusCode.toString());
    }
  }
}

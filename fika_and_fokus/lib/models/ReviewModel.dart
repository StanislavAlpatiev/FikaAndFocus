import 'package:flutter/cupertino.dart';

class ReviewModel {
  final Object user;
  final int id;
  final String review;
  final String date;
  final double rating;

  ReviewModel(this.user, this.id, this.review, this.date, this.rating);

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

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(json['user'].values.elementAt(1), json['id'], json['review_string'],
        json['date'], double.parse(json['rating']));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CafeItemModel.dart';

class ReviewDialogResult {
  double rating;
  String review;

  ReviewDialogResult(this.rating, this.review);
}

class ReviewDialog extends StatefulWidget {
  final CafeItem cafeItem;

  ReviewDialog(this.cafeItem, {Key? key}) : super(key: key);

  @override
  _ReviewDialogState createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  double _rating = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.grey,
                size: 25,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: Text('Rate ${widget.cafeItem.name}'),
          ),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(2, 0, 0, 5),
              child: RatingBar(
                  initialRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  minRating: 1,
                  itemCount: 5,
                  itemSize: 25.0,
                  itemPadding: const EdgeInsets.fromLTRB(0, 0, 4, 5),
                  ratingWidget: RatingWidget(
                      full: const Icon(Icons.star, color: Colors.amber),
                      half: const Icon(Icons.star, color: Colors.amber),
                      empty: Icon(
                        Icons.star,
                        color: Colors.grey.shade400,
                      )),
                  onRatingUpdate: (value) {
                    setState(() {
                      _rating = value;
                    });
                  }),
            ),
          ]),
          TextFormField(
            controller: _controller,
            maxLength: 150,
            maxLines: 3,
            style: GoogleFonts.roboto(fontWeight: FontWeight.w300),
            cursorColor: const Color(0xFF75AB98),
            decoration: const InputDecoration(
              hintText: 'Share your experiences and help others',
              hintStyle: TextStyle(color: Color(0xFF696969)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF75AB98), width: 2.0),
              ),
            ),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Required';
            //   }
            //   return null;
            // },
          ),
        ],
      ),
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            onPressed: () {
              if (_rating != 0) {
                Navigator.of(context)
                    .pop(ReviewDialogResult(_rating, _controller.text));
              }
            },
            child: Text(
              'SUBMIT',
              style: GoogleFonts.oswald(
                  color: Color(0xFFFFFFFF),
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF696969),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:segue_as_normas_app/core/models/place.dart';

import '../constants.dart';

class SecundaryCard extends StatelessWidget {
  final Place place;
  const SecundaryCard({Key key, this.place}) : super(key: key);
  //enviar o lugar como parametro depois
  @override
  Widget build(BuildContext context) {
    double _score = 0;
    String _qtdReviews =
        place.numberOfReviews != null ? place.numberOfReviews.toString() : '0';

    if (place.reviewsScore != null)
      _score = place.reviewsScore.overallAverage / place.numberOfReviews;

    return Card(
      color: cLight,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: 90.0,
              height: 135.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: NetworkImage(place.primaryImagem),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(place.category),
                      Spacer(),
                    ]),
                    Spacer(),
                    Text(
                      place.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          color: cFontPrincipal,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        Icon(Icons.security, color: cGrey1),
                        RatingBarIndicator(
                          rating: _score,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 16.0,
                          unratedColor: Colors.amber.withAlpha(50),
                          direction: Axis.horizontal,
                        ),
                        SizedBox(width: 15),
                        Icon(Icons.trending_up, color: cGrey1),
                        Text(_qtdReviews, style: TextStyle(color: cGrey1)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

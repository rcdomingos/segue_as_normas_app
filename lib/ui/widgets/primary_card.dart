import 'package:flutter/material.dart';
import 'package:segue_as_normas_app/core/models/place.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:segue_as_normas_app/ui/constants.dart';

class PrimaryCard extends StatelessWidget {
  final Place place;
  const PrimaryCard({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _score = 0;

    if (place.reviewsScore != null) {
      _score = place.reviewsScore.overallAverage / place.numberOfReviews;
    }

    String _qtdReviews =
        place.numberOfReviews != null ? place.numberOfReviews.toString() : '0';

    return Card(
      color: cLight,
      child: Container(
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 5.0,
                  backgroundColor: cGrey1,
                ),
                SizedBox(width: 10.0),
                Text(
                  place.category,
                  style: fCategoryTitle,
                ),
                Spacer(),
                Text(place.address.city,
                    style: TextStyle(fontSize: 11, color: cFontPrincipal)),
              ],
            ),
            SizedBox(height: 5.0),
            Expanded(
              child: Hero(
                tag: place.sId,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        image: NetworkImage(place.primaryImagem),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              place.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: cFontPrincipal,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              place.shortDescription,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: cBlack, fontSize: 12, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10.0),
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
                Text(_qtdReviews + " - avaliações",
                    style: TextStyle(color: cGrey1)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

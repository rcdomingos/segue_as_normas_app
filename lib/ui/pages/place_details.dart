import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:segue_as_normas_app/core/models/place.dart';
import 'package:segue_as_normas_app/ui/pages/add_score_page.dart';
import 'package:segue_as_normas_app/ui/pages/comments_page.dart';
import 'package:segue_as_normas_app/ui/widgets/circle_button.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class PlaceDetailsPage extends StatelessWidget {
  final Place place;

  const PlaceDetailsPage({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _overallAverage = 0;
    double _sanitization = 0;
    double _wearingMask = 0;
    double _socialDistancing = 0;

    if (place.reviewsScore != null) {
      _overallAverage =
          place.reviewsScore.overallAverage / place.numberOfReviews;
      _sanitization = place.reviewsScore.sanitization / place.numberOfReviews;
      _wearingMask = place.reviewsScore.wearingMask / place.numberOfReviews;
      _socialDistancing =
          place.reviewsScore.socialDistancing / place.numberOfReviews;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 0),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () => Navigator.pop(context),
                  ),
                  Spacer(),
                  CircleButton(
                    icon: Icons.share,
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: cSecundary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScorePage(placeId: place.sId),
            ),
          ).then((resp) {});
        },
        child: Icon(Icons.trending_up, color: Colors.white, size: 30),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            SizedBox(height: 12.0),
            Hero(
              tag: place.sId,
              child: Container(
                height: 220.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: NetworkImage(place.primaryImagem),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: cPrimary, width: 1.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 5.0,
                        backgroundColor: cGrey1,
                      ),
                      SizedBox(width: 6.0),
                      Text(place.category),
                    ],
                  ),
                ),
                Spacer(),
                TotalIcons(
                  icon: Icons.trending_up,
                  total: place.numberOfReviews.toString(),
                ),
                SizedBox(width: 12.0),
                TotalIcons(
                  icon: Icons.question_answer,
                  total: place.reviews.length.toString(),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(
              place.name,
              style: TextStyle(
                fontSize: 24.0,
                color: cFontPrincipal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              place.description,
              style: TextStyle(
                fontSize: 20.0,
                color: cGrey2,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15.0),
            _containerOperationHours(place.operatingHours),
            SizedBox(height: 24.0),
            Container(
              color: cPrimary,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    'NOTA DE PREVENÇÃO',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: cFontPrincipal,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Notas dadas pelos usuários sobre as medidas preventivas (COVID-19) praticadas pelo estabelecimento',
                    style: TextStyle(color: cBlack, fontSize: 12),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.security, color: cGrey1, size: 35.0),
                      SizedBox(width: 5),
                      RatingBarIndicator(
                        rating: _overallAverage,
                        itemBuilder: (context, index) =>
                            Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 30.0,
                        unratedColor: Colors.amber.withAlpha(50),
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nota Geral: ' +
                            (_socialDistancing == 0
                                ? '0'
                                : _overallAverage.toStringAsFixed(1)) +
                            '/5',
                        style: TextStyle(
                            color: cBlack, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'limpeza e higienização:',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 5),
                      RatingBarIndicator(
                        rating: _sanitization,
                        itemBuilder: (context, index) =>
                            Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 16.0,
                        unratedColor: Colors.amber.withAlpha(50),
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'uso de máscara no local:',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 5),
                      RatingBarIndicator(
                        rating: _wearingMask,
                        itemBuilder: (context, index) =>
                            Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 16.0,
                        unratedColor: Colors.amber.withAlpha(50),
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'distanciamento social:',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 5),
                      RatingBarIndicator(
                        rating: _socialDistancing,
                        itemBuilder: (context, index) =>
                            Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 16.0,
                        unratedColor: Colors.amber.withAlpha(50),
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: OutlineButton.icon(
                label: new Text('comentários'),
                icon: Icon(Icons.comment),
                textColor: cSecundary,
                color: cSecundary,
                highlightedBorderColor: cPrimary,
                borderSide: new BorderSide(color: cSecundary),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommentsPage(
                        placeId: place.sId,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  Widget _containerOperationHours(OperatingHours operatingHours) {
    var format = DateFormat.EEEE('pt_BR');
    var dateWeekday = format.format(DateTime.now());

    TextStyle _style = TextStyle(color: Colors.grey[800]);
    TextStyle _styleToday =
        TextStyle(color: Colors.red, fontWeight: FontWeight.bold);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      width: 100,
      child: Column(
        children: [
          Text(
            'Horário de Funcionamento',
            style: TextStyle(fontSize: 16, color: cFontPrincipal),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'segunda: ',
                style: (dateWeekday == 'segunda-feira' ? _styleToday : _style),
              ),
              Text(
                operatingHours.segundaFeira,
                style: (dateWeekday == 'segunda-feira' ? _styleToday : _style),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'terça: ',
                style: (dateWeekday == 'terça-feira' ? _styleToday : _style),
              ),
              Text(
                operatingHours.tercaFeira,
                style: (dateWeekday == 'terça-feira' ? _styleToday : _style),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'quarta: ',
                style: (dateWeekday == 'quarta-feira' ? _styleToday : _style),
              ),
              Text(
                operatingHours.quartaFeira,
                style: (dateWeekday == 'quarta-feira' ? _styleToday : _style),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'quinta: ',
                style: (dateWeekday == 'quinta-feira' ? _styleToday : _style),
              ),
              Text(
                operatingHours.quintaFeira,
                style: (dateWeekday == 'quinta-feira' ? _styleToday : _style),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'sexta: ',
                style: (dateWeekday == 'sexta-feira' ? _styleToday : _style),
              ),
              Text(
                operatingHours.segundaFeira,
                style: (dateWeekday == 'sexta-feira' ? _styleToday : _style),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'sábado: ',
                style: (dateWeekday == 'sábado' ? _styleToday : _style),
              ),
              Text(
                operatingHours.sabado,
                style: (dateWeekday == 'sábado' ? _styleToday : _style),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'domingo: ',
                style: (dateWeekday == 'domingo' ? _styleToday : _style),
              ),
              Text(
                operatingHours.domingo,
                style: (dateWeekday == 'domingo' ? _styleToday : _style),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TotalIcons extends StatelessWidget {
  final IconData icon;
  final String total;

  const TotalIcons({Key key, this.icon, this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: cPrimary),
        SizedBox(width: 4.0),
        Text(
          total,
          style: TextStyle(fontSize: 14.0, color: cGrey2),
        )
      ],
    );
  }
}

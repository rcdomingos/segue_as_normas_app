import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:segue_as_normas_app/core/services/api.dart';
import 'package:segue_as_normas_app/ui/widgets/circle_button.dart';

import '../constants.dart';

class AddScorePage extends StatefulWidget {
  final String placeId;
  const AddScorePage({Key key, this.placeId}) : super(key: key);

  @override
  _AddScorePageState createState() => _AddScorePageState();
}

class _AddScorePageState extends State<AddScorePage> {
  Api _api = new Api();

  double _scoreClean = 3.0;
  double _scoreMask = 3.0;
  double _scoreDist = 3.0;

  bool _ocupado = false;

  Future _saveScores() async {
    bool resultAddComment;
    this._ocupado = true;
    resultAddComment = await _api.addPlaceScore(
      placeId: this.widget.placeId,
      cleanScore: _scoreClean,
      maskScore: _scoreMask,
      distScore: _scoreDist,
    );
    setState(() {
      this._ocupado = false;
    });
    return resultAddComment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary,
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
                ],
              ),
            ),
          ),
        ),
      ),
      body: Visibility(
        visible: !this._ocupado,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Avaliação do lugar',
                    style: TextStyle(
                        fontSize: 20,
                        color: cFontPrincipal,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Ajude os outros usuarios informando as suas notas para as medidas de segurança tomadas pelo Estabelecimento na sua opnião',
                    style: TextStyle(
                        fontSize: 14,
                        color: cGrey2,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Limpeza e Higienização',
                    style: TextStyle(
                      fontSize: 14,
                      color: cBlack,
                    ),
                  ),
                  RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      _scoreClean = rating;
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Uso de Máscara no Local',
                    style: TextStyle(
                      fontSize: 14,
                      color: cBlack,
                    ),
                  ),
                  RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      _scoreMask = rating;
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Distanciamento Social',
                    style: TextStyle(
                      fontSize: 14,
                      color: cBlack,
                    ),
                  ),
                  RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      _scoreDist = rating;
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 130,
                    height: 50,
                    color: cSecundary,
                    child: FlatButton(
                      color: cSecundary,
                      onPressed: () {
                        setState(() {
                          this._ocupado = true;
                        });
                        _saveScores().then(
                          (result) => {
                            if (result) Navigator.of(context).pop(true),
                          },
                        );
                      },
                      child: Text(
                        'Avaliar',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:segue_as_normas_app/core/models/place.dart';
import 'package:segue_as_normas_app/core/services/api.dart';
import 'package:segue_as_normas_app/ui/constants.dart';
import 'package:segue_as_normas_app/ui/pages/place_details.dart';
import 'package:segue_as_normas_app/ui/widgets/primary_card.dart';
import 'package:segue_as_normas_app/ui/widgets/secundary_card.dart';

class PopularTabPage extends StatefulWidget {
  @override
  _PopularTabPageState createState() => _PopularTabPageState();
}

class _PopularTabPageState extends State<PopularTabPage> {
  List<Place> _popularPlacesList = List<Place>();
  bool _ocupado = false;
  Api _api = new Api();

  Future _getPopularPlaces() async {
    this._ocupado = true;
    _popularPlacesList = await _api.getAllPlaces();
    setState(() {
      this._ocupado = false;
    });
  }

  @override
  void initState() {
    _getPopularPlaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_ocupado,
      replacement: Center(
        child: CircularProgressIndicator(),
      ),
      child: Container(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 310.0,
              padding: EdgeInsets.only(left: 10.0),
              child: ListView.builder(
                itemCount: _popularPlacesList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Place _place = _popularPlacesList.elementAt(index);
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlaceDetailsPage(place: _place),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: PrimaryCard(place: _place),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 19.0),
                child: Text(
                  'SUGESTÕES DE LUGARES',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ListView.builder(
                itemCount: _popularPlacesList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  Place _place = _popularPlacesList.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlaceDetailsPage(place: _place),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 135.0,
                      margin:
                          EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                      child: SecundaryCard(place: _place),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

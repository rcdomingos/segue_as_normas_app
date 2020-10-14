import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:segue_as_normas_app/core/models/place.dart';
import 'package:segue_as_normas_app/core/services/api.dart';
import 'package:segue_as_normas_app/ui/constants.dart';
import 'package:segue_as_normas_app/ui/pages/place_details.dart';
import 'package:segue_as_normas_app/ui/widgets/secundary_card.dart';
import 'package:segue_as_normas_app/ui/widgets/secundary_card_distance.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _namePlace = TextEditingController();
  Api _api = new Api();

  List<Place> _resultList = List<Place>();

  @override
  void dispose() {
    // limpa o controller quando for liberado
    _namePlace.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _getUserPosition();
    super.initState();
  }

  bool _ocupado = false;
  double _latitude;
  double _longitude;

  Future _getSearchPlaces() async {
    this._ocupado = true;
    _resultList = await _api.getSearchPlaces(_namePlace.text);
    setState(() {
      this._ocupado = false;
    });
  }

  ///Pegar a posição atual do dispositivo
  Future _getUserPosition() async {
    this._ocupado = true;
    LocationPermission permission = await requestPermission();
    if (permission == LocationPermission.denied) {
      return;
    }
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // print(position);

    setState(() {
      this._latitude = position.latitude;
      this._longitude = position.longitude;
      this._ocupado = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Procurar lugar'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Text('pesquise seu lugar'),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              color: Colors.white,
              width: double.infinity,
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 50,
                      child: TextField(
                        controller: _namePlace,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.place),
                            hintText: 'digite o nome do lugar'),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        this._getSearchPlaces();
                      })
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                child: Visibility(
                  visible: !_ocupado,
                  replacement: Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ListView.builder(
                    itemCount: _resultList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      Place _place = _resultList.elementAt(index);
                      double distanceInMeters = distanceBetween(
                          _latitude,
                          _longitude,
                          _place.location.coordinates[0],
                          _place.location.coordinates[1]);

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PlaceDetailsPage(place: _place),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 135.0,
                          margin: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 12.0),
                          child: SecundaryCardDistance(
                              place: _place, distance: distanceInMeters),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

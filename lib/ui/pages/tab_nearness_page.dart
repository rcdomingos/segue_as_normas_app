import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:segue_as_normas_app/core/models/place.dart';
import 'package:segue_as_normas_app/core/services/api.dart';
import 'package:segue_as_normas_app/ui/pages/place_details.dart';
import 'package:segue_as_normas_app/ui/widgets/secundary_card_distance.dart';

class ProximidadeTabPage extends StatefulWidget {
  @override
  _ProximidadeTabPageState createState() => _ProximidadeTabPageState();
}

class _ProximidadeTabPageState extends State<ProximidadeTabPage> {
  List<Place> _recentNearnessList = List<Place>();
  Api _api = new Api();
  bool _ocupado = false;
  double _latitude;
  double _longitude;

  Future _getNearnessPlaces() async {
    this._ocupado = true;
    _recentNearnessList = await _api.getAllPlaces();
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
  void initState() {
    _getUserPosition().whenComplete(() => _getNearnessPlaces());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_ocupado,
      replacement: Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        itemCount: _recentNearnessList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          Place _place = _recentNearnessList.elementAt(index);
          double distanceInMeters = distanceBetween(_latitude, _longitude,
              _place.location.coordinates[0], _place.location.coordinates[1]);

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
              width: double.infinity,
              height: 135.0,
              margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
              child: SecundaryCardDistance(
                  place: _place, distance: distanceInMeters),
            ),
          );
        },
      ),
    );
  }
}

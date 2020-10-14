import 'package:flutter/material.dart';
import 'package:segue_as_normas_app/core/models/place.dart';
import 'package:segue_as_normas_app/core/services/api.dart';
import 'package:segue_as_normas_app/ui/pages/place_details.dart';
import 'package:segue_as_normas_app/ui/widgets/primary_card.dart';

class RecentTabPage extends StatefulWidget {
  @override
  _RecentTabPageState createState() => _RecentTabPageState();
}

class _RecentTabPageState extends State<RecentTabPage> {
  List<Place> _recentPlacesList = List<Place>();
  Api _api = new Api();
  bool _ocupado = false;

  Future _getRecentPlaces() async {
    this._ocupado = true;
    _recentPlacesList = await _api.getAllPlaces();
    setState(() {
      this._ocupado = false;
    });
  }

  @override
  void initState() {
    _getRecentPlaces();
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
        itemCount: _recentPlacesList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          Place _place = _recentPlacesList.elementAt(index);
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
              height: 300.0,
              margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
              child: PrimaryCard(place: _place),
            ),
          );
        },
      ),
    );
  }
}

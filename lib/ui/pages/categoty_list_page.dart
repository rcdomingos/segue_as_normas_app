import 'package:flutter/material.dart';
import 'package:segue_as_normas_app/core/models/place.dart';
import 'package:segue_as_normas_app/core/services/api.dart';
import 'package:segue_as_normas_app/ui/pages/place_details.dart';
import 'package:segue_as_normas_app/ui/widgets/circle_button.dart';
import 'package:segue_as_normas_app/ui/widgets/primary_card.dart';

import '../constants.dart';

class CategoryListPage extends StatefulWidget {
  final String category;

  const CategoryListPage({Key key, this.category}) : super(key: key);
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<Place> _recentPlacesList = List<Place>();
  Api _api = new Api();
  bool _ocupado = false;

  Future _getCategotyPlaces() async {
    this._ocupado = true;
    _recentPlacesList = await _api.getPlacesCategoty(this.widget.category);
    setState(() {
      this._ocupado = false;
    });
  }

  @override
  void initState() {
    _getCategotyPlaces();
    super.initState();
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
      ),
    );
  }
}

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:segue_as_normas_app/core/models/review.dart';
import 'package:segue_as_normas_app/core/services/api.dart';
import 'package:segue_as_normas_app/ui/pages/add_comment.dart';
import 'package:segue_as_normas_app/ui/widgets/circle_button.dart';

import '../constants.dart';

class CommentsPage extends StatefulWidget {
  final String placeId;

  const CommentsPage({Key key, this.placeId}) : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  List<Review> _reviews = new List<Review>();
  Api _api = new Api();
  bool _ocupado = false;

  Future _getReviewsPlaces() async {
    this._ocupado = true;
    _reviews = await _api.getReviewsPlaces(this.widget.placeId);
    setState(() {
      this._ocupado = false;
    });
  }

  @override
  void initState() {
    _getReviewsPlaces();
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
      body: Visibility(
        visible: !_ocupado,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: cFontPrincipal,
            useInkWell: true,
          ),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _reviews.length,
            itemBuilder: (context, index) {
              return CardComment(review: _reviews.elementAt(index));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: cSecundary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCommentPage(placeId: widget.placeId),
            ),
          ).then((resp) {
            if (resp) this._getReviewsPlaces();
          });
        },
        child: Icon(Icons.add_comment, color: Colors.white),
      ),
    );
  }
}

class CardComment extends StatelessWidget {
  final Review review;
  const CardComment({Key key, this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (review.reviewerName == null) {
      return null;
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundColor: cGrey1,
                            backgroundImage: AssetImage('assets/pessoa_1.jpg'),
                          ),
                          SizedBox(width: 6.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review.reviewerName,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: cFontPrincipal,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat('dd/MM/yyyy').format(DateTime.parse(
                                  review.date,
                                )),
                                style: TextStyle(fontSize: 12, color: cGrey1),
                              ),
                            ],
                          ),
                        ],
                      )),
                  collapsed: Text(
                    review.title,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              review.title,
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              review.comments,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),
                      ]),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

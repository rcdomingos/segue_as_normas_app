import 'package:flutter/material.dart';
import 'package:segue_as_normas_app/core/services/api.dart';
import 'package:segue_as_normas_app/ui/widgets/circle_button.dart';

import '../constants.dart';

class AddCommentPage extends StatefulWidget {
  final String placeId;
  const AddCommentPage({Key key, this.placeId}) : super(key: key);

  @override
  _AddCommentPageState createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
  var _ctrNome = TextEditingController();
  var _ctrEmail = TextEditingController();
  var _ctrTitle = TextEditingController();
  var _ctrComment = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  var _ocupado = false;
  var _msgErro = '';

  Api _api = new Api();

  Future _saveComment() async {
    print(this.widget.placeId);

    bool resultAddComment;

    this._ocupado = true;
    resultAddComment = await _api.addPlaceComment(
      placeId: this.widget.placeId,
      name: _ctrNome.text,
      email: _ctrEmail.text,
      title: _ctrTitle.text,
      comment: _ctrComment.text,
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
              padding: EdgeInsets.all(25),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Comentários',
                      style: TextStyle(
                          fontSize: 20,
                          color: cFontPrincipal,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Deixe um comentário sobre o lugar para ajudar os outros usuários',
                      style: TextStyle(
                          fontSize: 14,
                          color: cGrey2,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 24),
                    TextFormField(
                      controller: _ctrNome,
                      enabled: true,
                      decoration: InputDecoration(labelText: 'Nome'),
                    ),
                    TextFormField(
                      controller: _ctrEmail,
                      enabled: true,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      controller: _ctrTitle,
                      enabled: true,
                      decoration: InputDecoration(labelText: 'Titulo'),
                    ),
                    TextFormField(
                      controller: _ctrComment,
                      enabled: true,
                      decoration: InputDecoration(labelText: 'Comentario'),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: 130,
                        height: 50,
                        color: cSecundary,
                        child: FlatButton(
                          color: cSecundary,
                          onPressed: () {
                            setState(() {
                              this._ocupado = true;
                            });
                            _saveComment().then(
                              (result) => {
                                if (result) Navigator.of(context).pop(true),
                              },
                            );
                          },
                          child: Text(
                            'GRAVAR',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

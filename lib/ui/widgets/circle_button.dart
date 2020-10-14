import 'package:flutter/material.dart';

import '../constants.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  const CircleButton({Key key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Icon(
            icon,
            color: cSecundary,
            size: 15.0,
          ),
        ),
      ),
    );
  }
}

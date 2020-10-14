import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const apiURL = "http://192.168.1.16:3001/api/v1";

const cGrey1 = Color(0xFF9f9f9f);
const cGrey2 = Color(0xFF6d6d6d);
const cPrimary = Color(0xFFcad0f2);
const cSecundary = Color(0xFF48518a);
const cSecundaryLight = Color(0xFF5962a6);
const cGrey3 = Color(0xFFd6d6d6);

const cFontPrincipal = Color(0xFF48518a);
const cFontSecundary = Color(0xFFcad0f2);
const cLight = Color(0xFFfdfdfd);
const cVerdeEscuro = Color(0xFF2a766c);
const cBlack = Color(0xff1c1c1c);

var fNowActiveTabStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14.0,
    color: cGrey1,
  ),
);

var fActiveTabStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 16.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),
);

var fCategoryTitle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14.0,
    color: cGrey2,
    fontWeight: FontWeight.bold,
  ),
);

var fDetailContent = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14.0,
    color: cGrey2,
  ),
);

var fTitleCard = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 18.0,
    color: cBlack,
  ),
);

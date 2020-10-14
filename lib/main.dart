import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:segue_as_normas_app/ui/widgets/bottom_navigator.dart';
import 'package:segue_as_normas_app/ui/constants.dart';

void main() {
  initializeDateFormatting('pt_BR').then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Força de Vendas Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: cPrimary,
        appBarTheme: AppBarTheme(
          color: cPrimary,
          elevation: 0,
        ),
        primaryColor: Colors.black,
        accentColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavigator(),
    );
  }
}

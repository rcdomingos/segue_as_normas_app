import 'package:flutter/material.dart';
import 'package:segue_as_normas_app/ui/constants.dart';
import 'package:segue_as_normas_app/ui/pages/about_virus.dart';
import 'package:segue_as_normas_app/ui/pages/category_page.dart';
import 'package:segue_as_normas_app/ui/pages/home_page.dart';
import 'package:segue_as_normas_app/ui/pages/search_page.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  static List<Widget> _bottomNavView = [
    HomePage(),
    SearchPage(),
    CategoryPage(),
    AboutVirus(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _bottomNavView.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: Text('Lugares'),
              backgroundColor: cSecundary),
          new BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              title: Text('Procurar'),
              backgroundColor: cSecundaryLight),
          new BottomNavigationBarItem(
              icon: const Icon(Icons.list),
              title: Text('Categorias'),
              backgroundColor: Colors.indigo[300]),
          new BottomNavigationBarItem(
              icon: const Icon(Icons.info),
              title: Text('Informações'),
              backgroundColor: Colors.indigo[400])
        ],
      ),
    );
  }
}

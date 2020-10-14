import 'package:flutter/material.dart';
import 'package:segue_as_normas_app/ui/constants.dart';
import 'package:segue_as_normas_app/ui/pages/tab_nearness_page.dart';
import 'package:segue_as_normas_app/ui/pages/tab_popular_page.dart';
import 'package:segue_as_normas_app/ui/pages/tab_recent_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Bem Vindo',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(
                    "Não esqueça a sua mascára",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage("assets/protection-mask.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TabBar(
                    labelColor: cFontPrincipal,
                    unselectedLabelColor: Colors.white,
                    unselectedLabelStyle: fNowActiveTabStyle,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    indicatorColor: cFontPrincipal,
                    labelStyle: fActiveTabStyle.copyWith(fontSize: 25.0),
                    tabs: [
                      Tab(text: "Popular"),
                      Tab(text: "Recentes"),
                      Tab(text: "Proximidade"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            PopularTabPage(),
            RecentTabPage(),
            ProximidadeTabPage(),
          ])),
    );
  }
}

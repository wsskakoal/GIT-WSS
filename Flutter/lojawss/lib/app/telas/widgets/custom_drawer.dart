import 'package:flutter/material.dart';
import 'package:lojawss/app/telas/home_page.dart';
import 'package:scoped_model/scoped_model.dart';

import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 203, 236, 241),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildBodyBack(),
          ListView(
            padding: EdgeInsets.only(top: 40, left: 20),
            children: <Widget>[
              Container(
                color: Colors.transparent,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.only(),
                height: 100,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Loja Virtual",
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      top: 8.0,
                      child: Text(
                        "Loja Virtual",
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, pageController, 0, "Início"),
              DrawerTile(Icons.local_offer, pageController, 1, "Promoções"),
              DrawerTile(Icons.store, pageController, 2, "Lojas"),
            ],
          )
        ],
      ),
    );
  }
}

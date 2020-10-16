import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(100, 211, 99, 100),
                Color.fromARGB(255, 211, 99, 100),
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
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.only(),
                height: 170,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Text(
                          "Promoções\nVirtuais",
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

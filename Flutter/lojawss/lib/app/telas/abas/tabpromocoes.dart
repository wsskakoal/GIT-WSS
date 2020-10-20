import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lojawss/app/telas/widgets/category_tile.dart';
import 'package:lojawss/app/telas/widgets/custom_drawer.dart';
//import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class TabPromocoes extends StatelessWidget {
  final PageController controller;
  TabPromocoes(this.controller);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("produtos").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          );
        } else {
          var dividedTitle = ListTile.divideTiles(
                  tiles: snapshot.data.documents.map((doc) {
                    return CategoryTile(doc);
                  }).toList(),
                  color: Colors.grey[500])
              .toList();

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              drawer: CustomDrawer(controller),
              appBar: AppBar(
                title: Text("Promoções"),
                centerTitle: true,
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(icon: Icon(Icons.grid_on)),
                    Tab(icon: Icon(Icons.list)),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  ListView(
                    children: dividedTitle,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

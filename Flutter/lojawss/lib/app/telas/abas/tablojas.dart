import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class TabLojas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 211, 10, 8000),
                Color.fromARGB(255, 211, 181, 168),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );

    return Stack(
      children: <Widget>[
        _buildBodyBack(),

        // BARRA ROLAVEL
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              // Definir transparencia
              backgroundColor: Colors.transparent,

              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Lojas"),
                centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton.icon(
                      label: Text("Promoções"),
                      icon: Icon(Icons.local_offer),
                      onPressed: () {},
                    ),
                    FlatButton.icon(
                      label: Text("Lojas"),
                      icon: Icon(Icons.store_mall_directory),
                      onPressed: () {},
                    ),
                  ]),
            ),
            FutureBuilder<QuerySnapshot>(
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  );
                } else {
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    staggeredTiles: snapshot.data.documents.map((doc) {
                      return StaggeredTile.count(doc.data["x"], doc.data["y"]);
                    }).toList(),
                    children: snapshot.data.documents.map((doc) {
                      return FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: doc.data["image"],
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  );
                }
              },
              future: Firestore.instance
                  .collection("home")
                  .orderBy("pos")
                  .getDocuments(),
            )
          ],
        )
      ],
    );
  }
}

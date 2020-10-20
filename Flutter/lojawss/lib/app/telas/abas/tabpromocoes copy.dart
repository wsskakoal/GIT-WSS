import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lojawss/app/telas/widgets/category_tile.dart';
import 'package:transparent_image/transparent_image.dart';

class TabPromocoes2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 211, 522, 7723),
                Color.fromARGB(255, 211, 181, 168),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );

    return Stack(
      children: [
        Positioned(
          top: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                label: Text("Itens"),
                icon: Icon(Icons.auto_awesome_motion),
                onPressed: () {},
              ),
              Container(
                width: 35,
              ),
              FlatButton.icon(
                label: Text("Categorias"),
                icon: Icon(Icons.view_list),
                onPressed: () {},
              ),
            ],
          ),
        ),
        FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("produtos").getDocuments(),
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
              var dividedTitle = ListTile.divideTiles(
                      tiles: snapshot.data.documents.map((doc) {
                        return CategoryTile(doc);
                      }).toList(),
                      color: Colors.grey[500])
                  .toList();

              return Container(
                child: ListView(
                  children: dividedTitle,
                ),
              );
            }
          },
        ),
      ],
    );

    /* Stack(
      children: <Widget>[
        _buildBodyBack(),
        // BARRA ROLAVEL
        CustomScrollView(
          slivers: <Widget>[
            // BARRA DE PROMOÇÕES
            SliverAppBar(
              floating: true,
              snap: true,
              // Definir transparencia
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Promoções"),
                centerTitle: true,
              ),
            ),
            // BARRA DE ITENS E DE CATEGORIAS
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    label: Text("Itens"),
                    icon: Icon(Icons.auto_awesome_motion),
                    onPressed: () {},
                  ),
                  Container(
                    width: 35,
                  ),
                  FlatButton.icon(
                    label: Text("Categorias"),
                    icon: Icon(Icons.view_list),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // LISTA DE PRODUTOS
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance.collection("produtos").getDocuments(),
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
                  var dividedTitle = ListTile.divideTiles(
                          tiles: snapshot.data.documents.map((doc) {
                            return CategoryTile(doc);
                          }).toList(),
                          color: Colors.grey[500])
                      .toList();

                  return ListView(
                    children: dividedTitle,
                  );
                }
              },
            ),
          ],
        )
      ],
    ); */
  }
}

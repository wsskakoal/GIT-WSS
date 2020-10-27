import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lojawss/app/telas/paginas/tela_pesquisa_produtos.dart';
import 'package:lojawss/app/tema/cor_primaria.dart';
import 'package:transparent_image/transparent_image.dart';

class TabNovidades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String pesquisaText;
    // CRIADO DE DEGRADE
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(color: corPrimaria),
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
                title: const Text("Novidades"),
                centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Pesquisar por produtos",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    if (value.trim().isNotEmpty) {
                      pesquisaText = value;
                    }
                  },
                  onEditingComplete: () {
                    if (pesquisaText.isNotEmpty) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              TelaPesquisaProduto(pesquisaText),
                        ),
                      );
                    }
                  },
                ),
              ),
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

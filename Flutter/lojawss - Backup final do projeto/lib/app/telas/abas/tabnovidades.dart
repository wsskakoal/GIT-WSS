import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lojawss/app/dados/dados_produtos.dart';
import 'package:lojawss/app/telas/paginas/tela_pesquisa_produtos.dart';
import 'package:lojawss/app/telas/paginas/tela_produto.dart';
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
                      return StaggeredTile.count(2, 2);
                    }).toList(),
                    children: snapshot.data.documents.map((doc) {
                      return Card(child: GestureDetector(
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Column(
                            children: <Widget>[
                              Card(
                                color: Colors.white,
                                shadowColor: Colors.black,
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: doc.data["imgs"][0],
                                  height: 350,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 400,
                                child: Text(
                                  doc.data["titulo"].toString().toUpperCase(),
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    alignment: Alignment.centerLeft,
                                    height: 20,
                                    width: 240,
                                    child: Text(
                                      "Categoria: ${doc.data["categoria"]}",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  //Divider(),
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    alignment: Alignment.centerRight,
                                    height: 20,
                                    width: 160,
                                    child: Text(
                                      "Valor: R\$${doc.data["preco"]}",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  TelaProduto(DadosProduto.fromDocument(doc)),
                            ),
                          );
                        },
                      ),);
                    }).toList(),
                  );
                }
              },
              future: Firestore.instance
                  .collection("produtos")
                  .orderBy("dataAdd", descending: true)
                  .getDocuments(),
            )
          ],
        )
      ],
    );
  }
}

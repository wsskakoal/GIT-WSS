import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/dados_produtos.dart';
import 'package:lojawss/app/telas/widgets/janela_produto_lista.dart';
import 'package:lojawss/app/telas/widgets/janela_produtos_categorias.dart';
import 'package:lojawss/app/telas/widgets/janela_produtos_grade.dart';
import 'package:lojawss/app/telas/widgets/menu_lateral.dart';

class TabPromocoes extends StatelessWidget {


  final PageController controller;
  TabPromocoes(this.controller);
  @override
  Widget build(BuildContext context) {
    // ARMAZENA AS CATEGORIAS JÁ CRIADAS
    List<String> listaCategorias = new List<String>();

    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("produtos").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          );
        } else {
          /*          var dividedCategorias = ListTile.divideTiles(
                  tiles: snapshot.data.documents.map((doc) {
                    return JanelaCategorias(doc);
                  }).toList(),
                  color: Colors.grey[500])
              .toList();

          var dividedProdutos = ListTile.divideTiles(
                  tiles: snapshot.data.documents.map((doc) {
                    return JanelaCategorias(doc);
                  }).toList(),
                  color: Colors.grey[500])
              .toList(); */

          return DefaultTabController(
            length: 3,
            child: Scaffold(
              drawer: MenuLateral(controller),
              appBar: AppBar(
                title: Text("Promoções"),
                centerTitle: true,
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(icon: Icon(Icons.grid_on)),
                    Tab(icon: Icon(Icons.list)),
                    Tab(
                      text: "CATEGORIAS",
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  // CARREGAR DE ACORDO QUANDO ROLAR
                  GridView.builder(
                    padding: EdgeInsets.all(10.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        childAspectRatio: 0.65),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return JanelaProdutosGrade(DadosProduto.fromDocument(
                          snapshot.data.documents[index]));
                    },
                  ),

                  /* GridView.builder(
                    padding: EdgeInsets.all(10.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        childAspectRatio: 0.65),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return JanelaProdutosGrade(DadosProduto.fromDocument(
                          snapshot.data.documents[index]));
                    },
                  ), */
                  ListView(
                    children: snapshot.data.documents.map((doc) {
                      return JanelaProdutosLista(
                          DadosProduto.fromDocument(doc));
                    }).toList(),
                  ),
                  ListView(
                    children: ListTile.divideTiles(
                            tiles: snapshot.data.documents.map((doc) {
                              DadosProduto produto =
                                  DadosProduto.fromDocument(doc);
                              int qtdItensCategoria = 0;
                              qtdItensCategoria = snapshot.data.documents
                                  .where((element) =>
                                      element.data["categoria"] ==
                                      produto.categoria)
                                  .length;
                              if (!listaCategorias
                                  .contains(produto.categoria)) {
                                listaCategorias.add(produto.categoria);
                                return JanelaProdutosCategorias(
                                  produto,
                                  qtdItensCategoria,
                                );
                              } else {}
                            }).toList(),
                            color: Colors.grey[500])
                        .toList(),
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

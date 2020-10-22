import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/dados_produtos.dart';
import 'package:lojawss/app/telas/janelas/janela_produtos_grade.dart';

class TelaCategoria extends StatelessWidget {
  final String categoria;

  TelaCategoria(this.categoria);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.categoria),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          // CARREGAR APENAS OS ITENS DA CATEGORIA SELECIONADA
          future: Firestore.instance
              .collection("produtos")
              .where("categoria", isEqualTo: this.categoria)
              .getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return TabBarView(
                children: [
                  // CARREGAR DE ACORDO QUANDO ROLAR
                  GridView.builder(
                      padding: EdgeInsets.all(4.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          childAspectRatio: 0.65),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return JanelaProdutosGrade(DadosProduto.fromDocument(
                            snapshot.data.documents[index]));
                      }),
                  ListView.builder(
                    padding: EdgeInsets.all(4.0),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return JanelaProdutosGrade(DadosProduto.fromDocument(
                          snapshot.data.documents[index]));
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

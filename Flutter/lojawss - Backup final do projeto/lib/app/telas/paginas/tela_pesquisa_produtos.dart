import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/dados_produtos.dart';
import 'package:lojawss/app/dados/modelos/modelo_produto.dart';
import 'package:lojawss/app/telas/janelas/janela_produtos_grade.dart';
import 'package:lojawss/app/telas/paginas/tela_carregamento_padrao.dart';
import 'package:lojawss/app/tema/cor_primaria.dart';

class TelaPesquisaProduto extends StatefulWidget {
  final String pesquisaText;
  TelaPesquisaProduto(this.pesquisaText);
  @override
  _TelaPesquisaProdutoState createState() =>
      _TelaPesquisaProdutoState(pesquisaText);
}

class _TelaPesquisaProdutoState extends State<TelaPesquisaProduto> {
  ProdutoModel _produtoModel = ProdutoModel();
  String pesquisaText;
  _TelaPesquisaProdutoState(this.pesquisaText);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
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
              border: InputBorder.none),
          onChanged: (text) {
            setState(() {
              pesquisaText = text;
            });
          },
        ),
      ),
      backgroundColor: corPrimaria,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: <Widget>[
              /* Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
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
                  onChanged: (text) {
                    setState(() {
                      pesquisaText = text;
                    });
                  },
                ),
              ), */
/*               Divider(), */
              Expanded(
                child: FutureBuilder<QuerySnapshot>(
                    future: Firestore.instance
                        .collection("produtos")
                        .getDocuments(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return TelaCarregamentoPadrao();
                      } else if (snapshot.data.documents.length == 0) {
                        return Center(
                          child: Text("Nenhum produto encontrado"),
                        );
                      } else {
                        Iterable<DocumentSnapshot> produtosPesquisados =
                            snapshot.data.documents.where(
                          (element) => element.data["titulo"]
                              .toString()
                              .toUpperCase()
                              .contains(pesquisaText.toUpperCase()),
                        );
                        if (produtosPesquisados.length == 0) {
                          return Center(
                              child: Text("Nenhum produto com esse nome"));
                        } else {
                          // CARREGAR DE ACORDO QUANDO ROLAR
                          return GridView.builder(
                            padding: EdgeInsets.all(10.0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4.0,
                                    crossAxisSpacing: 4.0,
                                    childAspectRatio: 0.65),
                            itemCount: produtosPesquisados.toList().length,
                            itemBuilder: (context, index) {
                              return JanelaProdutosGrade(
                                  DadosProduto.fromDocument(
                                      produtosPesquisados.toList()[index]));
                            },
                          );
                        }
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

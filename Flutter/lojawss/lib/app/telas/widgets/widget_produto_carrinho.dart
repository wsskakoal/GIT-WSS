import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/dados_produto_carrinho.dart';
import 'package:lojawss/app/dados/dados_produtos.dart';
import 'package:lojawss/app/dados/modelos/modelo_carrinho.dart';
import 'package:lojawss/app/telas/janelas/janela_login.dart';
import 'package:lojawss/app/tema/cor_primaria.dart';

class WidgedtProdutoCarrinho extends StatelessWidget {
  final DadosProdutoCarrinho produtoCarrinho;
  WidgedtProdutoCarrinho(this.produtoCarrinho);
  @override
  Widget build(BuildContext context) {
    // CRIAR CONSTRUTOR DA PARTE DO PRODUTO DO CARRINHO
    Widget _buildContent() {
      ModeloCarrinho.of(context).updateCarrinho();
      return Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            width: 120.0,
            child: Image.network(produtoCarrinho.produto.images[0]),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  produtoCarrinho.produto.titulo,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Tamanho ${produtoCarrinho.tamanho}",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  "R\$ ${produtoCarrinho.produto.preco.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: corPrimaria,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  // AJUSTAR O ESPAÇO PARA TODOS OS ITENS
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: produtoCarrinho.quantidade > 1
                            ? () {
                                ModeloCarrinho.of(context)
                                    .decreItemCarrinho(produtoCarrinho);
                              }
                            : null),
                    Text(produtoCarrinho.quantidade.toString()),
                    IconButton(
                        icon: Icon(Icons.add_circle),
                        onPressed: () {
                          ModeloCarrinho.of(context)
                              .acreItemCarrinho(produtoCarrinho);
                        }),
                    FlatButton(
                      onPressed: () {
                        ModeloCarrinho.of(context)
                            .removerItemCarrinho(produtoCarrinho);
                      },
                      child: Text("Remover"),
                      textColor: Colors.grey[500],
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      );
    }
    // FIM DA PARTE CONSTRUTOR DA PARTE DO PRODUTO DO CARRINHO

// CONTRUIR A PAGINA
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: produtoCarrinho.produto == null
            ? FutureBuilder<DocumentSnapshot>(
                future: Firestore.instance
                    .collection("produtos")
                    .document(produtoCarrinho.pid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    produtoCarrinho.produto =
                        DadosProduto.fromDocument(snapshot.data);
                    return _buildContent();
                  } else {
                    return Container(
                      height: 70.0,
                      child: TelaLogin(),
                      alignment: Alignment.center,
                    );
                  }
                },
              )
            : _buildContent());
  }
}

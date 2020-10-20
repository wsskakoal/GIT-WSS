import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/dados_produtos.dart';

class JanelaProdutosGrade extends StatelessWidget {
  final DadosProduto produto;
  JanelaProdutosGrade(this.produto);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 0.8,
              child: Image.network(
                produto.images[0],
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(produto.titulo),
                  Text("R\$ ${produto.preco}"),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

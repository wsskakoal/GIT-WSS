import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/dados_produtos.dart';
import 'package:lojawss/app/telas/tela_categoria.dart';

class JanelaProdutosLista extends StatelessWidget {
  // RECEBE UM DOCUMENTO
  final DadosProduto produto;
  // CRIA O CONSTRUTOR PADRAO COM O DOCUMENTO
  JanelaProdutosLista(this.produto);

  @override
  Widget build(BuildContext context) {
    // LISTA DE TITULO PADRAO
    return ListTile(
      // ICONE QUE FICA DO LADO DO TITULO
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(produto.images[0]),
      ),
      // TITULO
      title: Text(produto.titulo),
      // ICONE QUE FICA NO FINAL DO TITULO.
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        /* Navigator.of(context).push(
            // IR PARA A TELA DE CATEGORIA
            MaterialPageRoute(builder: (context) => TelaCategoria(snapshot))); */
      },
    );
  }
}

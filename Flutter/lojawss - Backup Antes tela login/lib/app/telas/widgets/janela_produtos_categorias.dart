import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/dados_produtos.dart';
import 'package:lojawss/app/telas/tela_categoria.dart';

class JanelaProdutosCategorias extends StatelessWidget {
  // RECEBE QUANTIDADE DE ITENS NA CATEGORIA
  final int qtdItens;
  // RECEBE UM DOCUMENTO
  final DadosProduto produto;
  // CRIA O CONSTRUTOR PADRAO COM O DOCUMENTO
  JanelaProdutosCategorias(this.produto, this.qtdItens);

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
      title: Text(produto.categoria), subtitle: Text(this.qtdItens.toString()),
      // ICONE QUE FICA NO FINAL DO TITULO.
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
         Navigator.of(context).push(
            // IR PARA A TELA DE CATEGORIA
            MaterialPageRoute(builder: (context) => TelaCategoria(produto.categoria)));
      },
    );
  }
}

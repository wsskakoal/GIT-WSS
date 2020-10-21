import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/modelos/modelo_carrinho.dart';
import 'package:scoped_model/scoped_model.dart';

class TelaCarrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Carrinho"),
        // ACTIONS É O QUE FICA NA LATERAL DA APP BAR
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 8.0),
            child: ScopedModelDescendant<ModeloCarrinho>(
                builder: (context, child, model) {
              int p = model.produtos.length;
              return Text(
                "${p ?? 0}  ${p == 1 ? "ITEM" : "ITENS"}",
                style: TextStyle(fontSize: 17.0),
              );
            }),
          )
        ],
      ),
    );
  }
}

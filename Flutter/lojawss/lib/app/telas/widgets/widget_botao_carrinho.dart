import 'package:flutter/material.dart';
import 'package:lojawss/app/telas/paginas/tela_carrinho.dart';
import 'package:lojawss/app/tema/cor_primaria.dart';

class WidgetBotaoCarrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: corPrimaria,
      child: Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TelaCarrinho(),
          ),
        );
      },
    );
  }
}

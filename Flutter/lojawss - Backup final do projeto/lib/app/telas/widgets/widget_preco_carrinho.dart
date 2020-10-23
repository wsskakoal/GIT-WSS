import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/modelos/modelo_carrinho.dart';
import 'package:lojawss/app/tema/cor_primaria.dart';
import 'package:scoped_model/scoped_model.dart';

class WidgetPrecoCarrinho extends StatelessWidget {
  final VoidCallback comprar;
  WidgetPrecoCarrinho(this.comprar);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: ScopedModelDescendant<ModeloCarrinho>(
            builder: (context, child, model) {
          //VALORES
          double preco = model.getValorProdutos();
          double desconto = model.getValorDesconto();
          double frete = model.getValorFrete();
          double total = model.getValorTotal();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Resumo do pedido:",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Subtotal"),
                  Text("R\$ ${preco.toStringAsFixed(2)}"),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Desconto"),
                  Text("R\$ ${desconto.toStringAsFixed(2)}"),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Entrega"),
                  Text("R\$ ${frete.toStringAsFixed(2)}"),
                ],
              ),
              Divider(),
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "TOTAL",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "R\$ ${total.toStringAsFixed(2)}",
                    style: TextStyle(color: corPrimaria, fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              RaisedButton(
                  child: Text("Finalizar pedido"),
                  textColor: Colors.white,
                  color: corPrimaria,
                  onPressed: () {
                    comprar();
                  })
            ],
          );
        }),
      ),
    );
  }
}

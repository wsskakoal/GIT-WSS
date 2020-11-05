import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/modelos/modelo_carrinho.dart';
import 'package:lojawss/app/dados/modelos/modelo_usuario.dart';
import 'package:lojawss/app/telas/janelas/janela_login.dart';
import 'package:lojawss/app/telas/paginas/tela_carregamento_padrao.dart';
import 'package:lojawss/app/telas/paginas/tela_pedido.dart';
import 'package:lojawss/app/telas/widgets/widget_cupom_desconto_carrinho.dart';
import 'package:lojawss/app/telas/widgets/widget_frete_carrinho.dart';
import 'package:lojawss/app/telas/widgets/widget_preco_carrinho.dart';
import 'package:lojawss/app/telas/widgets/widget_produto_carrinho.dart';
import 'package:lojawss/app/tema/cor_primaria.dart';
import 'package:scoped_model/scoped_model.dart';

class TelaCarrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finalizar pedido"),
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
      // TELA DEPENDERA DO CARRINHO, SE O CARRINHO FOR ALTERADO PELO
      // LISTENER ENTAO A TELA VAI SER MUDADA TBM.
      body: ScopedModelDescendant<ModeloCarrinho>(
          // ignore: missing_return
          builder: (context, child, model) {
        if (model.isLoading && ModeloUsuario.of(context).isLoggedIn()) {
          return TelaCarregamentoPadrao();
        } else if (!ModeloUsuario.of(context).isLoggedIn()) {
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.remove_shopping_cart,
                  size: 80.0,
                  color: corPrimaria,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Faça login",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.0,
                ),
                RaisedButton(
                    child: Text("Entrar"),
                    textColor: Colors.white,
                    color: corPrimaria,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TelaLogin(),
                      ));
                    })
              ],
            ),
          );
        } else if (model.produtos == null || model.produtos.length == 0) {
          return Center(
            child: Text(
              "Nenhum produto",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: corSecundaria,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        } else {
          return ListView(
            children: <Widget>[
              Column(
                children: model.produtos.map((produto) {
                  return WidgedtProdutoCarrinho(produto);
                }).toList(),
              ),
              WidgetCupomDesconto(),
              WidgetFrete(),
              WidgetPrecoCarrinho(() async {
                String orderId = await model.finalizarPedido(context);
                if (orderId != null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text(
                          "Pedido finalizado com sucesso. Numero da ordem: $orderId")));
                  Future.delayed(Duration(seconds: 2)).then((value) =>
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => TelaPedido(),
                      )));
                }
              }),
            ],
          );
        }
      }),
    );
  }
}

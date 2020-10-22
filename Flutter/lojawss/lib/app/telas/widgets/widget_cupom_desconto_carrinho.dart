import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/modelos/modelo_carrinho.dart';

class WidgetCupomDesconto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        title: Text(
          "Cupom de desconto",
          textAlign: TextAlign.start,
          style:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700]),
        ),
        leading: Icon(Icons.card_giftcard),
        trailing: Icon(Icons.add),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite o seu código",
              ),
              initialValue: ModeloCarrinho.of(context).codCupom ?? "",
              onFieldSubmitted: (valuePassado) {
                Firestore.instance
                    .collection("cupons")
                    .document(valuePassado)
                    .get()
                    .then((documentoSnap) {
                  if (documentoSnap.data != null) {
                    ModeloCarrinho.of(context).setCupom(
                        valuePassado, documentoSnap.data["percentual"]);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Desconto de ${documentoSnap.data["percentual"]}% aplicado."),
                      backgroundColor: Colors.blueAccent,
                    ));
                  } else {
                    ModeloCarrinho.of(context).setCupom(null, 0);
                    Scaffold.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Text("Código de cupom não encontrado.")));
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

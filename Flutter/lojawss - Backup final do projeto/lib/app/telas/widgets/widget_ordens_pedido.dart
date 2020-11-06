import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lojawss/app/telas/paginas/tela_carregamento_padrao.dart';
import 'package:lojawss/app/tema/cor_primaria.dart';

// ignore: must_be_immutable
class WidgetOrdem extends StatelessWidget {
  String documentoId;
  WidgetOrdem(this.documentoId);
  @override
  Widget build(BuildContext context) {
    return Container(
    
      color: corPrimaria,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: StreamBuilder<DocumentSnapshot>(
              stream: Firestore.instance
                  .collection("ordens")
                  .document(documentoId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return TelaCarregamentoPadrao();
                } else {
                  int status = snapshot.data["status"];
                  if (status == 5) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Código do pedido: ${snapshot.data.documentID}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "Status do Pedido:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "Pedido não foi aceito.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Código do pedido: ${snapshot.data.documentID}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(_buildProductsText(snapshot.data)),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "Status do Pedido:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildCircle("1", "Confirmação", status, 1),
                            Container(
                              height: 1.0,
                              width: 20.0,
                              color: Colors.grey[500],
                            ),
                            _buildCircle("2", "Preparação", status, 2),
                            Container(
                              height: 1.0,
                              width: 20.0,
                              color: Colors.grey[500],
                            ),
                            _buildCircle("3", "Transporte", status, 3),
                            Container(
                              height: 1.0,
                              width: 20.0,
                              color: Colors.grey[500],
                            ),
                            _buildCircle("4", "Entrega", status, 4),
                          ],
                        ),
                      ],
                    );
                  }
                }
              }),
        ),
      ),
    );
  }

  String _buildProductsText(DocumentSnapshot snapshot) {
    String text = "Descrição:\n";
    for (LinkedHashMap p in snapshot.data["produtos"]) {
      text +=
          "${p["quantidade"]} x ${p["produto"]["titulo"]} (R\$ ${p["produto"]["preco"].toStringAsFixed(2)})\n";
    }
    text +=
        "Valor frete: R\$ ${snapshot.data["valorFrete"].toStringAsFixed(2)}   ";
    text +=
        "Valor desconto: R\$ ${snapshot.data["valorDescontos"].toStringAsFixed(2)}\n";
    text += "Total: R\$ ${snapshot.data["valorTotal"].toStringAsFixed(2)}";
    return text;
  }

  Widget _buildCircle(
      String title, String subtitle, int status, int thisStatus) {
    Color backColor;
    Widget child;

    if (status < thisStatus) {
      backColor = Colors.grey[500];
      child = Text(
        title,
        style: TextStyle(color: Colors.white),
      );
    } else if (status == thisStatus) {
      backColor = Colors.blue;
      child = Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        ],
      );
    } else {
      backColor = Colors.green;
      child = Icon(
        Icons.check,
        color: Colors.white,
      );
    }

    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          backgroundColor: backColor,
          child: child,
        ),
        Text(subtitle)
      ],
    );
  }
}

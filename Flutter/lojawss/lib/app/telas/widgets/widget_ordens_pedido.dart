import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lojawss/app/telas/paginas/tela_carregamento_padrao.dart';

class WidgetOrdem extends StatelessWidget {
  String documentoId;
  WidgetOrdem(this.documentoId);
  @override
  Widget build(BuildContext context) {
    return Card(
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
                return Column(
                  children: <Widget>[
                    Text("Código do pedido: ${snapshot.data.documentID}"),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(""),
                  ],
                );
              }
            }),
      ),
    );
  }
}

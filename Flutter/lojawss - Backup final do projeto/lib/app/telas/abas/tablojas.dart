import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojawss/app/telas/paginas/tela_carregamento_padrao.dart';
import 'package:lojawss/app/telas/widgets/widget_loja.dart';

class TabLojas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
/*     Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 211, 10, 8000),
                Color.fromARGB(255, 211, 181, 168),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ); */

    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("lojas").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return TelaCarregamentoPadrao();
        } else {
          return ListView(
            children: snapshot.data.documents
                .map((doc) => WidgetLoja(doc))
                .toList(),
          );
        }
      },
    );
  }
}

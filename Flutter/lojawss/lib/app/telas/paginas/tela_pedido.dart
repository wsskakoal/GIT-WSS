import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lojawss/app/dados/modelos/modelo_usuario.dart';
import 'package:lojawss/app/telas/janelas/janela_login.dart';
import 'package:lojawss/app/telas/paginas/tela_carregamento_padrao.dart';
import 'package:lojawss/app/telas/widgets/widget_ordens_pedido.dart';
import 'package:lojawss/app/tema/cor_primaria.dart';

class TelaPedido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (ModeloUsuario.of(context).isLoggedIn()) {
      String uid = ModeloUsuario.of(context).firebaseUser.uid;
      return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("users")
            .document(uid)
            .collection("ordens")
            .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return TelaCarregamentoPadrao();
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Tela de Pedido'),
                centerTitle: true,
              ),
              body: ListView(
                children: snapshot.data.documents
                    .map((doc) => WidgetOrdem(doc.documentID))
                    .toList()
                    // INVERTE A LISTA
                    .reversed
                    // JOGA COMO LISTA NOVAMENTE
                    .toList(),
              ),
            );
          }
        },
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Tela de Pedido'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.view_list,
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
        ),
      );
    }
  }
}

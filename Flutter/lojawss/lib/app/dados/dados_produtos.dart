import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class DadosProduto {
  String id;
  String titulo;
  String descricao;
  //double preco;
  List images;
  String categoria;

  DadosProduto.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    titulo = snapshot.data["titulo"];
    descricao = snapshot.data["descricao"];
    images = snapshot.data["imgs"];
    //preco = snapshot.data["price"] + 0.0;
  }
}

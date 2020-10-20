import 'package:cloud_firestore/cloud_firestore.dart';

class DadosProduto {
  String id;
  String titulo;
  String descricao;
  double preco;
  List images;
  String categoria;

  DadosProduto.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    titulo = snapshot.data["titulo"];
    descricao = snapshot.data["descricao"];
    images = snapshot.data["imgs"];
    categoria = snapshot.data["categoria"];
    preco = snapshot.data["preco"] + 0.0;
  }
}

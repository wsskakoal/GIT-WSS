import 'package:cloud_firestore/cloud_firestore.dart';

class DadosProduto {
  String id;
  String titulo;
  String descricao;
  double preco;
  List images;
  String categoria;
  List tamanho;

  DadosProduto.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    titulo = snapshot.data["titulo"];
    descricao = snapshot.data["descricao"];
    images = snapshot.data["imgs"];
    categoria = snapshot.data["categoria"];
    preco = snapshot.data["preco"] + 0.0;
    tamanho = snapshot.data["tamanho"];
  }

  Map<String, dynamic> toResumedMap() {
    return {
      "titulo": titulo,
      "descricao": descricao,
      "preco": preco,
    };
  }
}

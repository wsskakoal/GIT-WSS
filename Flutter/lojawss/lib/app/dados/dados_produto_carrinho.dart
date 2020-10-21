import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lojawss/app/dados/dados_produtos.dart';

class DadosProdutoCarrinho {
  String cid;
  String pid;
  String categoria;
  int quantidade;
  String tamanho;
  DadosProduto produto;

  DadosProdutoCarrinho();
  DadosProdutoCarrinho.fromDocument(DocumentSnapshot snapshot) {
    cid = snapshot.documentID;
    pid = snapshot.data["pid"];
    categoria = snapshot.data["categoria"];
    quantidade = snapshot.data["quantidade"];
    tamanho = snapshot.data["tamanho"];
  }

  Map<String, dynamic> toMap() {
    return {
      "categoria": categoria,
      "pid": pid,
      "quantidade": quantidade,
      "tamanho": tamanho,
      //"produto": produto.toResumedMap(),
    };
  }
}

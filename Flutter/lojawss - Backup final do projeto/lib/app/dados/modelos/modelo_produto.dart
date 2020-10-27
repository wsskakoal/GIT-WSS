import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoModel {
  final Map<String, Map<String, dynamic>> _produtos = {};
  Firestore _firestore = Firestore.instance;
  ProdutoModel() {
    procurarProduto();
  }

  void procurarProduto() {
    _firestore.collection("produtos").snapshots().listen((snapshot) {
      snapshot.documents.forEach((documento) {
        String uid = documento.documentID;
        _produtos[uid].addAll(documento.data);
      });
    });
  }

  Future <List<DocumentSnapshot>> procurarProdutoSearch (String pesquisa)  async{
    List<DocumentSnapshot> listaItensPesquisados;
    await _firestore.collection("produtos").snapshots().listen((snapshot) {
      snapshot.documents.forEach((documento) {
        String uid = documento.documentID;
        if (documento.data["titulo"]
            .toString()
            .toUpperCase()
            .contains(pesquisa.toUpperCase())) {
          listaItensPesquisados.add(documento);
        }
      });
    });
    return listaItensPesquisados;
  }
}

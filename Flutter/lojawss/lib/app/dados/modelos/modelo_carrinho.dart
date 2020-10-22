import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojawss/app/dados/dados_produto_carrinho.dart';
import 'package:lojawss/app/dados/modelos/modelo_usuario.dart';
import 'package:lojawss/app/telas/widgets/widget_produto_carrinho.dart';
import 'package:scoped_model/scoped_model.dart';

class ModeloCarrinho extends Model {
  ModeloUsuario usuario;
  List<DadosProdutoCarrinho> produtos = [];
  ModeloCarrinho(this.usuario) {
    if (usuario.isLoggedIn()) {
      _carregarDadosCarrinho();
    }
  }
  bool isLoading = false;

  static ModeloCarrinho of(BuildContext context) =>
      ScopedModel.of<ModeloCarrinho>(context);

  void adicionarItemCarrinho(DadosProdutoCarrinho produtoCarrinho) {
    produtos.add(produtoCarrinho);
    Firestore.instance
        // ACESSA A PRIMEIRA COLEÇÃO DO BANCO DE DADOS
        .collection("users")
        // PEGA O DOCUMENTO ESPECIFICO
        .document(usuario.firebaseUser.uid)
        // ACESSA A SEGUNDA COLEÇÃO DO BANCO DE DADOS
        .collection("carrinho")
        // ADD O DOCUMENTO
        .add(produtoCarrinho.toMap())
        .then((doc) {
      produtoCarrinho.cid = doc.documentID;
    });
    notifyListeners();
  }

  void removerItemCarrinho(DadosProdutoCarrinho produtoCarrinho) {
    // ACESSA A PRIMEIRA COLEÇÃO DO BANCO DE DADOS
    Firestore.instance
        .collection("users")
        // PEGA O DOCUMENTO ESPECIFICO
        .document(usuario.firebaseUser.uid)
        // ACESSA A SEGUNDA COLEÇÃO DO BANCO DE DADOS
        .collection("carrinho")
        // PEGA O DOCUMENTO ESPECIFICO
        .document(produtoCarrinho.cid)
        // DELETA
        .delete();

    produtos.remove(produtoCarrinho);
    notifyListeners();
  }

  void acreItemCarrinho(DadosProdutoCarrinho produtoCarrinho) {
    produtoCarrinho.quantidade++;

    Firestore.instance
        .collection("users")
        .document(usuario.firebaseUser.uid)
        .collection("carrinho")
        .document(produtoCarrinho.cid)
        .updateData(produtoCarrinho.toMap());
    notifyListeners();
  }

  void decreItemCarrinho(DadosProdutoCarrinho produtoCarrinho) {
    produtoCarrinho.quantidade--;

    Firestore.instance
        .collection("users")
        .document(usuario.firebaseUser.uid)
        .collection("carrinho")
        .document(produtoCarrinho.cid)
        .updateData(produtoCarrinho.toMap());
    notifyListeners();
  }

  void _carregarDadosCarrinho() async {
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("users")
        .document(usuario.firebaseUser.uid)
        .collection("carrinho")
        .getDocuments();

    produtos = querySnapshot.documents.map((produto) {
      return DadosProdutoCarrinho.fromDocument(produto);
    }).toList();
    notifyListeners();
  }
}

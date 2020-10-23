import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/dados_produto_carrinho.dart';
import 'package:lojawss/app/dados/modelos/modelo_usuario.dart';
import 'package:lojawss/app/telas/widgets/widget_produto_carrinho.dart';
import 'package:scoped_model/scoped_model.dart';

class ModeloCarrinho extends Model {
  // USUARIO DONO DO CARRINHO
  ModeloUsuario usuario;
  // PRODUTO ADICIONADOS AO CARRINHO
  List<DadosProdutoCarrinho> produtos = [];
  // CODIGO DO CUPOM
  String codCupom;
  // QUANTIDADE PERCENTUAL DE DESCONTO
  int descontoPercentual = 0;

// Construtor padrão.
  ModeloCarrinho(this.usuario) {
    if (usuario.isLoggedIn()) {
      _carregarDadosCarrinho();
    }
  }
  bool isLoading = false;

  static ModeloCarrinho of(BuildContext context) =>
      ScopedModel.of<ModeloCarrinho>(context);

  void adicionarItemCarrinho(DadosProdutoCarrinho produtoCarrinho, BuildContext context) {
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
    }).catchError((e){
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao adicionar produto ao carrinho. Erro: $e"))
        );
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

  void setCupom(String cupom, int desconto) {
    this.codCupom = cupom;
    this.descontoPercentual = desconto;
  }

  double getValorProdutos() {
    double preco = 0.0;
    for (DadosProdutoCarrinho c in produtos) {
      if (c.produto != null) {
        preco += c.quantidade * c.produto.preco;
      }
    }
    return preco;
  }

  double getValorDesconto() {
    return getValorProdutos() * descontoPercentual / 100;
  }

  double getValorFrete() {
    return 9.99;
  }

  void updateCarrinho() {
    notifyListeners();
  }

  double getValorTotal() {
    double preco = 0.0;
    preco = getValorProdutos() - getValorDesconto() + getValorFrete();
    return preco;
  }

  Future<String> finalizarPedido(BuildContext context) async {
    if (produtos.length == 0) return null;

    isLoading = true;
    notifyListeners();
    double valorProdutos = getValorProdutos();
    double valorDescontos = getValorDesconto();
    double valorFrete = getValorFrete();

    DocumentReference reference =
        await Firestore.instance.collection("ordens").add({
      "clienteId": usuario.firebaseUser.uid,
      "produtos": produtos.map((produto) => produto.toMap()).toList(),
      "valorFrete": valorFrete,
      "valorProdutos": valorProdutos,
      "valorDescontos": valorDescontos,
      "valorTotal": (valorProdutos - valorDescontos + valorFrete),
      "status": 1,
    }).catchError((e) {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao adicionar ordem. Erro: $e")));
      isLoading = false;
      notifyListeners();
      return null;
    });

    await Firestore.instance
        .collection("users")
        .document(usuario.firebaseUser.uid)
        .collection("ordens")
        .document(reference.documentID)
        .setData({
      "ordemId": reference.documentID,
    });

    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(usuario.firebaseUser.uid)
        .collection("carrinho")
        .getDocuments()
        .catchError((e) {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao adicionar ordem. Erro: $e")));
      isLoading = false;
      notifyListeners();
      return null;
    });

    for (var doc in query.documents) {
      doc.reference.delete();
    }

    produtos.clear();
    descontoPercentual = 0;
    codCupom = null;
    isLoading = false;
    notifyListeners();
    return reference.documentID;
  }
}

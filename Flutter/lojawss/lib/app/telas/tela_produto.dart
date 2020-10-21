import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/dados_produto_carrinho.dart';
import 'package:lojawss/app/dados/dados_produtos.dart';
import 'package:lojawss/app/dados/modelos/modelo_carrinho.dart';
import 'package:lojawss/app/dados/modelos/modelo_usuario.dart';
import 'package:lojawss/app/telas/janela_login.dart';
import 'package:lojawss/app/telas/tela_carrinho.dart';

import 'janela_imagem.dart';

class TelaProduto extends StatefulWidget {
  final DadosProduto produto;
  TelaProduto(this.produto);
  @override
  _TelaProdutoState createState() => _TelaProdutoState(produto);
}

class _TelaProdutoState extends State<TelaProduto> {
  final DadosProduto produto;
  String size;

  _TelaProdutoState(this.produto);

  @override
  Widget build(BuildContext context) {
    final Color corPrimaria = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.titulo),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              boxFit: BoxFit.cover,
              onImageTap: (index) {
                Navigator.of(context).push(
                    // IR PARA A TELA DA IMAGEM
                    MaterialPageRoute(
                        builder: (context) =>
                            TelaImagem(produto.images[index])));
              },
              images: produto.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              // TAMANHO DO BOTAO DE ROLAR IMAGEM.
              dotSize: 10.0,
              // ESPAÇAMENTO ENTRE OS PONTOS.
              dotSpacing: 30.0,
              // COR DO BACKGROUND DOS PONTOS.
              dotBgColor: Colors.transparent,
              dotIncreasedColor: Colors.red,
              // COR DOS PONTOS.
              dotColor: corPrimaria,
              // ROLAR AUTOMATICO
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  produto.titulo,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${produto.preco.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: corPrimaria),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Tamanho",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: corPrimaria),
                ),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    // DEFINIR A ORIETACAO PARA FORÇAR A DIREÇÃO
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        // TAMANHO DA BOX
                        childAspectRatio: 0.5),
                    children: produto.tamanho.map((s) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            size = s;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                            border: Border.all(
                                color:
                                    s == size ? corPrimaria : Colors.grey[500],
                                width: 3.0),
                          ),
                          width: 50.0,
                          alignment: Alignment.center,
                          child: Text(s),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    onPressed: size != null
                        ? () {
                            if (ModeloUsuario.of(context).isLoggedIn()) {
                              DadosProdutoCarrinho produtoCarrinho =
                                  DadosProdutoCarrinho();

                              produtoCarrinho.tamanho = size;
                              produtoCarrinho.quantidade = 1;
                              produtoCarrinho.pid = produto.id;
                              produtoCarrinho.categoria = produto.categoria;
                              ModeloCarrinho.of(context)
                                  .adicionarItemCarrinho(produtoCarrinho);

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TelaCarrinho()));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TelaLogin(),
                              ));
                            }
                          }
                        : null,
                    child: Text(
                      ModeloUsuario.of(context).isLoggedIn()
                          ? "Adicionar ao carrinho"
                          : "Entre para visualizar",
                      style: TextStyle(fontSize: 25),
                    ),
                    color: corPrimaria,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Descrição",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  produto.descricao,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/dados_produtos.dart';

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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

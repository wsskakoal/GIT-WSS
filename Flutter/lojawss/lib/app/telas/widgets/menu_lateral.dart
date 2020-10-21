import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/modelos/modelo_usuario.dart';
import 'package:lojawss/app/telas/janela_login.dart';
import 'package:scoped_model/scoped_model.dart';
import 'titulo_menu_lateral.dart';

class MenuLateral extends StatelessWidget {
  final PageController pageController;
  MenuLateral(this.pageController);

  @override
  Widget build(BuildContext context) {
    Color corPrimaria = Theme.of(context).primaryColor;
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 203, 236, 241),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildBodyBack(),
          ListView(
            padding: EdgeInsets.only(top: 40, left: 20),
            children: <Widget>[
              Container(
                color: Colors.transparent,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.only(),
                height: 100,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Loja Virtual",
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant<ModeloUsuario>(
                          builder: (contex, child, model) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              child: Text(
                                !model.isLoggedIn()
                                    ? "Entre ou cadastre-se"
                                    : "Sair",
                                style: TextStyle(
                                    color: corPrimaria,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                if (!model.isLoggedIn()) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => TelaLogin(),
                                    ),
                                  );
                                } else {
                                  model.sair();
                                }
                              },
                            )
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Divider(),
              TituloMenuLateral(Icons.home, pageController, 0, "Início"),
              TituloMenuLateral(
                  Icons.local_offer, pageController, 1, "Promoções"),
              TituloMenuLateral(Icons.store, pageController, 2, "Lojas"),
            ],
          )
        ],
      ),
    );
  }
}

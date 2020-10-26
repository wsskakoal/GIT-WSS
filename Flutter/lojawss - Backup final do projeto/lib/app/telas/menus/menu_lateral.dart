import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/modelos/modelo_usuario.dart';
import 'package:lojawss/app/telas/janelas/janela_login.dart';
import 'package:scoped_model/scoped_model.dart';

class MenuLateral extends StatelessWidget {
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
          ScopedModelDescendant<ModeloUsuario>(
            builder: (contex, child, model) {
              return ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountEmail: Text("user@mail.com"),
                    accountName: Text("Seu zé"),
                    currentAccountPicture: CircleAvatar(
                      child: Text("SZ"),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(10),
                    height: 160,
                    child: Stack(children: <Widget>[
                      Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Text(
                          "E - Promo",
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        width: 300,
                        left: 0.0,
                        bottom: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Olá, seja bem vindo ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
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
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.shopping_basket),
                    title: Text("Meus pedidos"),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TelaLogin(),
                        ),
                      );
                      //Navegar para outra página
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

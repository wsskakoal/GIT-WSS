import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/modelos/modelo_carrinho.dart';
import 'package:scoped_model/scoped_model.dart';
import 'app/dados/modelos/modelo_usuario.dart';
import 'app/telas/home_page.dart';
import 'app/tema/tema_vermelho.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ModeloUsuario>(
      model: ModeloUsuario(),
      child: ScopedModelDescendant<ModeloUsuario>(
          builder: (context, child, model) {
        return ScopedModel<ModeloCarrinho>(
          model: ModeloCarrinho(model),
          child: MaterialApp(
            title: 'Aplicativo loja virtual Wyllian',
            debugShowCheckedModeBanner: false,
            theme: appTemaVermelho,
            home: HomePage(),
          ),
        );
      }),
    );
  }
}

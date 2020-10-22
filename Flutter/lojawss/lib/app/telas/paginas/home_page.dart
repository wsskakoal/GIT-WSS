import 'package:flutter/material.dart';
import 'package:lojawss/app/telas/abas/tablojas.dart';
import 'package:lojawss/app/telas/widgets/widget_barra_inferior.dart';
import 'package:lojawss/app/telas/widgets/widget_botao_carrinho.dart';
import 'package:lojawss/app/telas/menus/menu_lateral.dart';

import '../abas/hometab.dart';
import '../abas/tabpromocoes.dart';

class HomePage extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Scaffold(
          body: HomeTab(_pageController),
          drawer: MenuLateral(_pageController),
          bottomNavigationBar: WidgetBarraInferior(_pageController, 0),
        ),
        Scaffold(
          body: TabPromocoes(_pageController),
          floatingActionButton: WidgetBotaoCarrinho(),
          bottomNavigationBar: WidgetBarraInferior(_pageController, 1),
        ),
        Scaffold(
          body: TabLojas(),
          floatingActionButton: WidgetBotaoCarrinho(),
          drawer: MenuLateral(_pageController),
          bottomNavigationBar: WidgetBarraInferior(_pageController, 2),
        ),
      ],
    );
  }
}

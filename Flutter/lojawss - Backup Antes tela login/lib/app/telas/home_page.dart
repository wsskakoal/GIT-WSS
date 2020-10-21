import 'package:flutter/material.dart';
import 'package:lojawss/app/telas/abas/tablojas.dart';
import 'package:lojawss/app/telas/widgets/menu_lateral.dart';

import 'abas/hometab.dart';
import 'abas/tabpromocoes.dart';

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
        ),
        Scaffold(
          body: TabPromocoes(_pageController),
        ),
        Scaffold(
          body: TabLojas(),
          drawer: MenuLateral(_pageController),
        ),
      ],
    );
  }
}

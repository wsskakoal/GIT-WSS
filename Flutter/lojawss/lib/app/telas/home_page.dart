import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:http/http.dart' as http;
import 'package:lojawss/app/telas/abas/tablojas.dart';
import 'package:lojawss/app/telas/widgets/custom_drawer.dart';

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
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: TabPromocoes(_pageController),
        ),
        Scaffold(
          body: TabLojas(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}

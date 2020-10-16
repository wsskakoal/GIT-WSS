import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:http/http.dart' as http;
import 'package:lojawss/app/dados/controller/home_page_controller.dart';
import 'package:lojawss/app/telas/abas/tablojas.dart';
import 'package:lojawss/app/telas/widgets/custom_drawer.dart';

import 'abas/hometab.dart';
import 'abas/tabpromocoes.dart';

class HomePage extends GetView<HomePageController> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(),
        ),
        TabPromocoes(),
        TabLojas(),
      ],
    );
  }
}

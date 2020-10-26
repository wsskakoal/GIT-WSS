import 'package:flutter/material.dart';
import 'package:lojawss/app/telas/abas/tablojas.dart';
import 'package:lojawss/app/telas/paginas/tela_pedido.dart';
import 'package:lojawss/app/telas/menus/menu_lateral.dart';
import 'package:lojawss/app/tema/cor_primaria.dart';
import '../abas/tabnovidades.dart';
import '../abas/tabpromocoes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final _pageController = PageController();
  int _paginaAtual = 0;

  final List<Widget> _telas = [
    TabNovidades(),
    TabPromocoes(),
    TabLojas(),
    TelaPedido(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_paginaAtual],
      drawer: MenuLateral(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaAtual,
        backgroundColor: Colors.white,
        unselectedItemColor: corSecundaria,
        selectedItemColor: corPrimaria,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_active,
              ),
              title: Text("Novidades")),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), title: Text("Promoções")),
          BottomNavigationBarItem(
              icon: Icon(Icons.store), title: Text("Lojas")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), title: Text("Pedidos")),
        ],
        onTap: onTaped,
      ),
    );
  }

  void onTaped(int indice) {
    setState(() {
      _paginaAtual = indice;
    });
  }
}

import 'package:flutter/material.dart';

class WidgetBarraInferior extends StatelessWidget {
  final PageController _controller;
  final int indicePaginal;
  WidgetBarraInferior(this._controller, this.indicePaginal);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: indicePaginal,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_active,
          ),
          title: Text("Novidades"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_offer,
          ),
          title: Text("Promoções"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.store,
          ),
          title: Text("Lojas"),
        ),
      ],
      onTap: (i) {
        _controller.animateToPage(i,
            //easeInOutQuint
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutQuint);
      },
    );
  }
}

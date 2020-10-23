import 'package:flutter/material.dart';

class WidgetTituloMenuLateral extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  WidgetTituloMenuLateral(this.icon, this.controller, this.page, this.text);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // fechar o drawner
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          color: controller.page == this.page
              ? Colors.transparent
              : Colors.transparent,
          height: 60,
          child: Row(
            children: [
              Icon(
                icon,
                color: controller.page.round() == page
                    ? Theme.of(context).primaryColor
                    : Colors.grey[700],
                size: 40.0,
              ),
              Container(
                width: 30,
              ),
              Text(
                this.text,
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.normal,
                  color: controller.page.round() == page ?
                  Theme.of(context).primaryColor : Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojawss/app/telas/widgets/category_screen.dart';

class CategoryTile extends StatelessWidget {
  // RECEBE UM DOCUMENTO
  final DocumentSnapshot snapshot;
  // CRIA O CONSTRUTOR PADRAO COM O DOCUMENTO
  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    // LISTA DE TITULO PADRAO
    return ListTile(
      // ICONE QUE FICA DO LADO DO TITULO
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.data["icon"]),
      ),
      // TITULO
      title: Text(snapshot.data["titulo"]),
      // ICONE QUE FICA NO FINAL DO TITULO.
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CategoryScreen(snapshot)));
      },
    );
  }
}

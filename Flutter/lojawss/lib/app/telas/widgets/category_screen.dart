import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;
  CategoryScreen(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data["titulo"]),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance
              .collection("produtos")
              .document(snapshot.documentID)
              .collection("itens")
              .getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return TabBarView(
                children: [
                  // CARREGAR DE ACORDO QUANDO ROLAR
                  GridView.builder(
                      padding: EdgeInsets.all(4.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: null),
                  Container(
                    color: Colors.green,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

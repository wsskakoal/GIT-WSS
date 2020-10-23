import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetLoja extends StatelessWidget {
  DocumentSnapshot snapshotLoja;
  WidgetLoja(this.snapshotLoja);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 100.0,
            child: Image.network(
              snapshotLoja.data["img"],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  snapshotLoja.data["nome"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                Text(
                  snapshotLoja.data["endereco"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  launch(
                      "https://www.google.com/maps/search/?api=1&query=${snapshotLoja.data["lat"]},"
                      "${snapshotLoja.data["long"]}");
                },
                child: Text("Ver no mapa"),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
              ),
              FlatButton(
                onPressed: () {
                  launch("tel:${snapshotLoja.data["telefone"]}");
                },
                child: Text("Ligar"),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

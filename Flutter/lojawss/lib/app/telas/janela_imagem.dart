import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class TelaImagem extends StatelessWidget {
  final dynamic imagemUrl;
  TelaImagem(this.imagemUrl);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
            aspectRatio: 0.8,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imagemUrl,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            )),
      ],
    );
  }
}

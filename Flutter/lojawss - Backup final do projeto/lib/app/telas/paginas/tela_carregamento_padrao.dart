import 'package:flutter/material.dart';
import 'package:lojawss/app/tema/cor_primaria.dart';

class TelaCarregamentoPadrao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          strokeWidth: 15.0,
          backgroundColor: corSecundaria,
          valueColor: AlwaysStoppedAnimation(corPrimaria),
        ),
      ),
    );
  }
}

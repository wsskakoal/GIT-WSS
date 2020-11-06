import 'package:controleloja/app/paginas/home.dart';
import 'package:controleloja/app/paginas/login.dart';
import 'package:controleloja/app/routes/app_paginas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

// TELA INICIAL
class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          routeName: Routes.INITIAL,
          gradientBackground: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.topCenter,
              colors: [Colors.amber, Colors.white]),
          navigateAfterSeconds: LoginPage(),
          loaderColor: Colors.blue,
          //imageBackground: AssetImage("images/pay.png"),
          // image: Image(
          //   alignment: Alignment.center,
          //   // width: Get.width / 2,
          //   // height: Get.height / 2,
          //   fit: BoxFit.cover,

          //   image: AssetImage("images/pay.png"),
          // ),
          loadingText: Text("Bem vindo ao epromo!"),
          useLoader: true,

          //photoSize: Get.height / 2,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image(
                height: Get.height / 6,
                alignment: Alignment.center,
                // width: Get.width / 2,
                // height: Get.height / 2,
                fit: BoxFit.cover,
                image: AssetImage("images/pay.png"),
              ),
            ),
          ],
        )
      ],
    );
  }
}

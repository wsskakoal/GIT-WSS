import 'package:controleloja/app/routes/app_paginas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/theme/tema.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Paginas
      getPages: AppPages.pages,
      // Pagina inicial
      initialRoute: Routes.INITIAL,
      // DESABILITAR DEBUG FLAG
      debugShowCheckedModeBanner: false,
      // TITULO DO APP
      title: 'epromo loja controle',
      // DEFINIR TEMA PRINCIPAL
      theme: appTema,
    );
  }
}

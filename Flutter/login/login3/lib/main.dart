import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login2/app/routes/app_pages.dart';
import 'package:login2/app/routes/app_routes.dart';



void main() {
  runApp(GetMaterialApp(
    title: "LOGIN FIREBASE",
    theme: ThemeData(
      primaryColor: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    // DESABILITAR BANNER DEBUG
    debugShowCheckedModeBanner: false,
    //ARQUVISO DE ROTAS
    getPages: AppPages.routes,
    // Rota inicial
    initialRoute: Routes.INITIAL,
  ));
}

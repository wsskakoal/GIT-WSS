import 'package:firebaselogin/app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(GetMaterialApp(
    title: "LOGIN FIREBASE",
    // TEMA INICIAL DA APLICAÇÃO
    theme: appThemeData,
    // DESABILITAR BANNER DEBUG
    debugShowCheckedModeBanner: false,
    //ARQUVISO DE ROTAS
    getPages: AppPages.routes,
    // Rota inicial
    initialRoute: Routes.INITIAL,
  ));
}

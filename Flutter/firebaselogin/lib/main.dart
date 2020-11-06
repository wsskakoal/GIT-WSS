import 'package:firebaselogin/app/ui/theme/app_theme.dart';
import 'package:firebaselogin/app/ui/theme/app_theme_dark.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  await GetStorage.init('login_firebase');
  GetStorage box = GetStorage('login_firebase');
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      title: "LOGIN FIREBASE",
      // TEMA INICIAL DA APLICAÇÃO
      theme: box.read("theme") == "dark"
          ? appThemeDataDark
          : appThemeData ?? appThemeData,
      themeMode: ThemeMode.system,
      darkTheme: appThemeDataDark,

      // DESABILITAR BANNER DEBUG
      debugShowCheckedModeBanner: false,
      //ARQUVISO DE ROTAS
      getPages: AppPages.routes,
      // Rota inicial
      initialRoute: Routes.INITIAL,
    ),
  );
}
